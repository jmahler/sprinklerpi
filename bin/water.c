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
#include <assert.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

// choose device for your chip enable (CE0, CE1) 
char dev[] = "/dev/spidev0.0";
//char dev[] = "/dev/spidev0.1";

int main(int argc, char* argv[]) {

	char usage[] = "usage: water [0-8]";
	int fd;
	int n;
	char cmd;

	assert(1 == sizeof(cmd));

	if (!(argc >= 1 && argc <= 2)) {
		printf("%s\n", usage);
		return 1;
	}

	fd = open(dev, O_WRONLY);
	if (-1 == fd) {
		perror("open");
		return 1;
	}

	n = 0;  // default all off
	if (2 == argc) {
		n = atoi(argv[1]);
	}
	
	if (n < 0 || n > 8) {
		printf("invalid command\n");
		printf("%s\n", usage);
		return 1;
	}

	//       command
	//  7      4 3     1      0
	// +--------+-------+------+
	// |  X     | valve | en_n |
	// +--------+-------+------+
	//

	if (0 == n) {
		cmd = 1;  // disable all
	} else {
		cmd = (n - 1) << 1;  // enable #
	}

	write(fd, &cmd, sizeof(cmd));

	close(fd);

	return 0;
}
