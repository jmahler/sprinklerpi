
/**
 * NAME
 * ----
 *
 * spkpi-waterd-server.c
 *
 * DESCRIPTION
 * -----------
 *
 * The server accepts incoming connects from a client and when
 * changes are made to the valves (valves/group-*) it sends
 * the command to the client.
 *
 * This server must choose a port number and the client must use
 * the same one.
 *
 *   spkpi-waterd-server 5000 ../www/sprinklerpi/
 *
 * AUTHOR
 * ------
 *
 *  Jeremiah Mahler <jmmahler@gmail.com>
 *  http://github.com/jmahler
 *
 * COPYRIGHT
 * --------
 *
 * Copyright (c) 2014, Jeremiah Mahler. All Rights Reserved.
 * This project is free software and released under the
 * GNU General Public License.
 *
 */

#include <sys/inotify.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <error.h>
#include <fcntl.h>
#include <netdb.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAXLINE 128

#define S 1 /* sleep time on error */

inline int max(int a, int b) {
	return ( (a > b) ? a : b);
}

int quit = 0;
void int_handler() {
	quit = 1;
}

int sockfd = 0;
struct addrinfo *res = NULL;

/* {{{ get_command() */
int get_command(char **_cmd, char *dir) {
	static char cmd[4];
	char file[1024];
	char buf[4];
	int i;
	int n;
	int in;

	for (i = 1; i <= 3; i++) {
		n = sprintf(file, "%s/valves/group-%i", dir, i);
		if (n < 0) {
			error(0, errno, "sprintf");
			return -1;
		}

		in = open(file, O_RDONLY);
		if (-1 == in ) {
			error(0, errno, "open");
			printf("  file: '%s'\n", file);
			return -1;
		}

		n = read(in, buf, 1);
		if (-1 == n) {
			error(0, errno, "read");
			close(in);
			return -1;
		}

		close(in);

		cmd[i-1] = buf[0];
	}
	cmd[4] = '\0';

	*_cmd = cmd;

	return 3; /* return length of command (chars) */
}
/* }}} */

#define BUF_LEN 1024

int main(int argc, char* argv[]) {

	struct addrinfo hints, *p;
	int n;
	int sockfd;
	char *port;
	char *dir;
	struct sockaddr_in sin;
	socklen_t len;
	char *cmd;
	int optval;
	int notify;
	char file[1024];
	int i;
	char buf[BUF_LEN];
	fd_set rd_set;
	fd_set wr_set;
	fd_set ex_set;
	int max_fd = 0;
	struct sigaction int_act;
	struct sigaction disc_act;
	int firstpass;

	memset(&int_act, 0, sizeof(int_act));
	int_act.sa_handler = int_handler;
	sigaction(SIGINT, &int_act, 0);

	/* suppress client disconnect interrupt */
	memset(&disc_act, 0, sizeof(disc_act));
	disc_act.sa_handler = SIG_IGN;
	sigaction(SIGPIPE, &disc_act, 0);

	if (argc != 3) {
		fprintf(stderr, "usage: %s <port> <spkpi dir>\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	port = argv[1];
	dir  = argv[2];

	/* {{{ setup inotify */
	notify = inotify_init();
	if (-1 == notify) {
		error(0, errno, "inotify_init");
		exit(EXIT_FAILURE);
	}

	for (i = 1; i <= 3; i++) {
		n = sprintf(file, "%s/valves/group-%i", dir, i);
		if (n < 0) {
			error(0, errno, "sprintf");
			exit(EXIT_FAILURE);
		}

		inotify_add_watch(notify, file, IN_CLOSE_WRITE);
	}
	/* }}} */

	/* {{{ setup sockets */
	memset(&hints, 0, sizeof(hints));
	hints.ai_family 	= AF_INET;
	hints.ai_socktype 	= SOCK_STREAM;
	hints.ai_flags 		= AI_PASSIVE;

	if ( (n = getaddrinfo(NULL, port, &hints, &res)) != 0) {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(n));
		exit(EXIT_FAILURE);
	}

	/* loop through addresses, use first one that works */
	for (p = res; p != NULL; p = p->ai_next) {
		/* Create the socket */
		if ((sockfd = socket(p->ai_family, p->ai_socktype,
							p->ai_protocol)) == -1) {
			error(0, errno, "socket");
			continue;
		}

		optval = 1;
		if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR,
							&optval, sizeof(optval)) == -1) {
			error(0, errno, "setsockopt");
			close(sockfd);	
			continue;
		}

		/* Bind the socket */
		if (bind(sockfd, p->ai_addr, p->ai_addrlen) == -1) {
			error(0, errno, "bind");
			close(sockfd);	
			continue;
		}

		/* Listen to the socket */
		if (listen(sockfd, 1) < 0) {
			error(0, errno, "listen");
			close(sockfd);	
			return -1;
		}

		break;
	}
	if (NULL == p) {
		fprintf(stderr, "No address found.");
		exit(EXIT_FAILURE);
	}

	/* find the port number we were given */
	if (p->ai_family == AF_INET) {
		len = sizeof(struct sockaddr_in);
		if (getsockname(sockfd, (struct sockaddr *) &sin, &len) == -1) {
			error(0, errno, "getsockname");
			exit(EXIT_FAILURE);
		}

		printf("Port: %u\n", ntohs(sin.sin_port));
	} else {
		fprintf(stderr, "only ipv4 supported\n");
		exit(EXIT_FAILURE);
	}
	/* }}} */

	FD_ZERO(&rd_set);
	FD_ZERO(&wr_set);
	FD_ZERO(&ex_set);

	FD_SET(sockfd, &rd_set);

	FD_SET(notify, &rd_set);

	max_fd = 0;
	max_fd = max(sockfd, max_fd);
	max_fd = max(notify, max_fd);

	while (!quit) {
		int cli_conn;

		if ((cli_conn = accept(sockfd, NULL, NULL)) == -1) {
			if (quit)
				break;

			error(0, errno, "accept");
			continue;
		}

		firstpass = 1;
		while (!quit) {
			if (!firstpass) {
				select(max_fd+1, &rd_set, &wr_set, &ex_set, NULL);
				if (quit)
					break;

				/* valve file changes */
				if (FD_ISSET(notify, &rd_set)) {
					if ((n = read(notify, buf, BUF_LEN)) == -1) {
						if (errno == EINTR)
							break;

						error(0, errno, "inotify read");
						break;
					}
				}

				/* client reconnect */
				if (FD_ISSET(sockfd, &rd_set)) {
					break;
				}
			}

			/* read command from valve files */
			if ( (n = get_command(&cmd, dir)) < 0) {
				error(0, 0, "get_command() failed");
				sleep(S);
				continue;
			}

			if ( (n = send(cli_conn, cmd, n, 0)) < 0) {
				if (errno == EPIPE)  /* client disconnect */
					break;

				error(0, errno, "send");
				break;
			}

			firstpass = 0;
		}
	}

	close(sockfd);
	freeaddrinfo(res);

	return EXIT_SUCCESS;
}
