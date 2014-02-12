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
 *   $ water "0"
 *
 * If there are two control groups two zeros should be given, and so on.
 *
 *   $ water "00"
 *
 * Note, it is good practice to enclose the command in quotes to ensure
 * the shell does not misinterpret the command.
 *
 * To water circuit 6 in group 1 and 3 in group 5.
 *
 *   $ water 65
 *
 * With just this command a simple timer can be created using
 * the `sleep` command.
 * This example has one control group and waters circuit 3 for 5 minutes.
 * Notice that it has to be explicitly turned off.
 *
 *   $ water 3; sleep 5m; water 0
 *
 * Several of these commands could be combined in a file
 * to create a shell script which runs a full schedule.
 *
 *   #!/bin/sh
 *   water 3; sleep 5m;
 *   water 4; sleep 7m;
 *   water 0
 *
 */

#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

#include "sprinklerpi.h"

int main(int argc, char* argv[]) {

	int fd;
	// choose device for your chip enable (CE0, CE1) 
	char dev[] = "/dev/spidev0.0";
	//char dev[] = "/dev/spidev0.1";
	ssize_t ret;
	size_t len;
	unsigned char cmd_len;
	char *cmd = NULL;

	// Get arguments, valve number
	if (2 == argc) {
		// one command argument, OK
	} else {
		fprintf(stderr, "usage: %s 0-8...\n", argv[0]);
		return 1;
	}

	fd = open(dev, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Unable to open '%s': %s\n", dev, strerror(errno));
		return 1;
	}

	// encode the ASCII command
	len = strlen(argv[1]);
	ret = encode_cmd(argv[1], len, &cmd, &cmd_len);
	if (ret < 0) {
		fprintf(stderr, "Command error, are command numbers less than 8?\n");
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
