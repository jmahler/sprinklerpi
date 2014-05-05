
/**
 * NAME
 * ----
 *
 * spkpi-waterd-client.c
 *
 * DESCRIPTION
 * -----------
 *
 * The client connects to a server and waits for incoming commands.
 * When a command is received it is written to the physical device
 * (SPI) using the `water` command.
 *
 * This client must connect to the same port used by the server.
 *
 *   spkpi-waterd-client /dev/spidev0.0 localhost 5000
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

#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>
#include <error.h>
#include <netdb.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAXLINE 128

#define S 1  /* sleep time on error */
#define VERBOSE 0

int quit = 0;
void int_handler() {
	quit = 1;
}

int main(int argc, char* argv[]) {
	struct addrinfo hints, *p;
	int n;
	char *host;
	char *port;
	char *dev;
	char cmd[MAXLINE];
	char sysc[MAXLINE];
	struct addrinfo *res = NULL;
	int sockfd = 0;
	struct sigaction int_act;

	if (argc != 4) {
		fprintf(stderr, "usage: %s <dev> <host> <port>\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	dev  = argv[1];
	host = argv[2];
	port = argv[3];

	memset(&int_act, 0, sizeof(int_act));
	int_act.sa_handler = int_handler;
	sigaction(SIGINT, &int_act, 0);

	/* turn all valves off during startup */
	sprintf(sysc, "water -d \"%s\" \"%s\"", dev, "000");
	if (VERBOSE) printf("startup, turning all valves off.\n");
	if ((n = system(sysc)) != 0) {
		if (-1 == n)
			error(1, errno, "system");
		else
			error(1, 0, "system status (%d)", n);
	}

	while (!quit) {

		/* free objects each time around */
		if (res != NULL) {
			freeaddrinfo(res);
			res = NULL;
		}
		if (sockfd != 0) {
			close(sockfd);
			sockfd = 0;
		}

		memset(&hints, 0, sizeof(hints));
		hints.ai_family 	= AF_INET;
		hints.ai_socktype 	= SOCK_STREAM;

		if ( (n = getaddrinfo(host, port, &hints, &res)) != 0) {
			fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(n));
			sleep(S);
			continue;
		}

		/* loop through addresses, use first one that works */
		for (p = res; p != NULL; p = p->ai_next) {
			sockfd = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
			if (-1 == sockfd) {
				error(0, errno, "socket");
				continue;
			}

			break;
		}
		if (NULL == p) {
			error(0, 0, "No address found.\n");
			sleep(S);
			continue;
		}

		if (-1 == connect(sockfd, res->ai_addr, sizeof(*(res->ai_addr)))) {
			if (errno != ECONNREFUSED)
				error(0, errno, "connect");
			sleep(S);
			continue;
		}

		while (!quit) {
			if ((n = recv(sockfd, cmd, 3, 0)) == -1) {
				if (errno == EINTR)
					break;

				error(0, errno, "recv");
				break;
			}

			if (n != 3) {
				fprintf(stderr, "malformed command (%d != 3)\n", n);	
				break;
			} else {
				/* execute the water command */
				cmd[3] = '\0';
				sprintf(sysc, "water -d \"%s\" \"%s\"", dev, cmd);
				if (VERBOSE) printf("%s\n", sysc);
				if ((n = system(sysc)) != 0) {
					if (-1 == n)
						error(0, errno, "system");
					else
						error(0, 0, "system status (%d)", n);

					break;
				}
			}
		}
	}

	if (res != NULL)
		freeaddrinfo(res);

	if (sockfd != 0)
		close(sockfd);

	return EXIT_SUCCESS;
}
