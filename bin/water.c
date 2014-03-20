/*
 * NAME
 * ----
 *
 * water - SprinklerPI water control, turns on/off sprinklers
 *
 * DESCRIPTION
 * -----------
 *
 * Control watering by turning on/off sprinklers.
 *
 * The duration is not controlled by this program,
 * once a circuit is turned on it will remain on
 * until turned off.
 *
 * To turn off all the sprinklers specify the circuit zero,
 * which is an unused circuit.
 *
 *   $ water -c "0"
 *
 * If there are two control groups two zeros should be given, and so on.
 *
 *   $ water -c "00"
 *
 * To water circuit 6 in group 1 and 3 in group 5.
 *
 *   $ water -c "65"
 *
 * To to see what the command is doing use the '-v' option.
 * And for other usage see the '-h' option.
 *
 *   $ water -v -c "65"
 *   $ water -v  # shows defaults
 *
 *   $ water -h
 *
 * With just this command a simple timer can be created using
 * the `sleep` command.
 * This example has one control group and waters circuit 3 for 5 minutes.
 * Notice that it has to be explicitly turned off.
 *
 *   $ water -c 3; sleep 5m; water -c 0
 *
 * Several of these commands could be combined in a file
 * to create a shell script which runs a full schedule.
 *
 *   #!/bin/sh
 *   water -c 3; sleep 5m;
 *   water -c 4; sleep 7m;
 *   water -c 0
 *
 */

#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <linux/types.h>
#include <linux/spi/spidev.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

#include "sprinklerpi.h"

void usage(char *proc) {
	fprintf(stderr, "usage: %s -c \"0-8...\" [-d /dev/name]\n", proc);
}

int main(int argc, char* argv[]) {

	int fd;
	/* choose device for your chip enable (CE0, CE1) */
	char *dev = "/dev/spidev0.0";
	ssize_t ret;
	size_t len;
	unsigned char cmd_len;
	char *incmd = NULL;
	char *cmd;
	int opt;
	int verbose = 0;
	unsigned char spi_mode;

	/* Get arguments, valve number */
	while ((opt = getopt(argc, argv, "c:d:vh")) != -1) {
		switch (opt) {
		case 'c':
			incmd = optarg;
			break;
		case 'd':
			dev = optarg;
			break;
		case 'v':
			verbose = 1;
			break;
		case 'h':
		default: /* '?' */
			usage(argv[0]);
			exit(EXIT_FAILURE);
		}
	}

	if (NULL == incmd) {
		usage(argv[0]);
		fprintf(stderr, "  A command (-c) must be specified.\n");
		exit(EXIT_FAILURE);
	}

	if (verbose) {
		printf("device = \"%s\"\n", dev);
	}
	fd = open(dev, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Unable to open '%s': %s\n", dev, strerror(errno));
		return 1;
	}

	/* set SPI MODE */
	spi_mode = SPI_MODE_0;
	ioctl(fd, SPI_IOC_WR_MODE, &spi_mode);

	/* encode the ASCII command */
	len = strlen(incmd);
	if (verbose) {
		printf("cmd = \"%s\" (%lu)\n", incmd, (long unsigned int) len);
	}
	ret = encode_cmd(incmd, len, &cmd, &cmd_len);
	if (ret < 0) {
		fprintf(stderr, "Command error, commands 0-8, max groups?\n");
		return 1;
	}

	ret = write(fd, cmd, cmd_len);
	if (ret == -1) {
		fprintf(stderr, "Unable to write '%s': %s\n", dev, strerror(errno));
		close(fd);
		return 1;
	}

	close(fd);

	return 0;
}
