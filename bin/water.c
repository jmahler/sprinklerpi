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
 *   $ water 0
 *
 * To water circuit 6
 *
 *   $ water 6
 *
 * Using the standard Linux `sleep` command, the duration
 * can be controlled.
 * This examples waters circuit 3 for 5 minutes.
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
 * This program doesn't do anything magical.
 * It simply opens the correct SPI device file and
 * writes an 8-bit number.  It does however make this a
 * little easier to do.
 */

#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char* argv[]) {

	int fd;
	int n;
	char cmd;
	// choose device for your chip enable (CE0, CE1) 
	char dev[] = "/dev/spidev0.0";
	//char dev[] = "/dev/spidev0.1";
	ssize_t ret;

	// Get arguments, valve number
	if (1 == argc) {
		n = 0;  // no arg, turn all off
	} else if (2 == argc) {
		n = atoi(argv[1]);

		// Check for valid valve number
		if (n < 0) {
			fprintf(stderr, "Negative valve number is invalid.\n");
			return 1;
		} else if (n > 8) {
			fprintf(stderr, "Valve numbers larger than 8 are not supported.\n");
			return 1;
		}
	} else {
		fprintf(stderr, "usage: %s [0-8]\n", argv[0]);
		return 1;
	}

	fd = open(dev, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Unable to open '%s': %s\n", dev, strerror(errno));
		return 1;
	}

	//       command
	//  7      4 3     1      0
	// +--------+-------+------+
	// | unused | valve | en_n |
	// +--------+-------+------+
	//
	if (0 == n) {
		cmd = 1;  // disable all, en_n = 1
	} else {
		cmd = (n - 1) << 1;  // valve # (0 offset), en_n = 0
	}

	ret = write(fd, &cmd, sizeof(cmd));
	if (ret == -1) {
		fprintf(stderr, "Unable to write '%s': %s\n", dev, strerror(errno));
		close(fd);
		return 1;
	}

	close(fd);

	return 0;
}
