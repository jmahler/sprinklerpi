#!/usr/bin/perl
use strict;

use Time::HiRes qw(usleep);

=head2

Demonstrates the operation of the system by displaying
entertaining patterns on the LEDs of the control/driver
boards.

=cut

# Turn off valves during Ctrl-C quit
$SIG{INT} = sub {
	`water "000"`;
	exit(0);
};

my $counter_mode = 0;

while (1) {

	# Each of the different demos is run in sequence.
	# To make the time of each demo the same, the sleep
	# time is calculated according to the number of steps.

	# all same, forward then backward
	my $steps = 3*(8 + 8);
	my $T = 2;  # time period, seconds
	my $sleep = $T/$steps;
	for (my $n = 0; $n < 3; $n++) {
		for (my $i = 1; $i <= 8; $i++) {
			`water "$i$i$i"`;
			usleep($sleep*1e6);
		}
		for (my $i = 8; $i >= 1; $i--) {
			`water "$i$i$i"`;
			usleep($sleep*1e6);
		}
	}

	# end to end, forward then backward
	my $steps = 3*9*6;
	my $T = 2;  # time period, seconds
	my $sleep = $T/$steps;
	for (my $n = 0; $n < 3; $n++) {

		for (my $i = 0; $i <= 8; $i++) {
			my $cmd = "00" . "$i";
			`water "$cmd"`;
			usleep($sleep*1e6);
		}

		for (my $i = 0; $i <= 8; $i++) {
			my $cmd = "0" . "$i" . "0";
			`water "$cmd"`;
			usleep($sleep*1e6);
		}

		for (my $i = 0; $i <= 8; $i++) {
			my $cmd = "$i" . "00";
			`water "$cmd"`;
			usleep($sleep*1e6);
		}

		for (my $i = 8; $i >= 0; $i--) {
			my $cmd = "$i" . "00";
			`water "$cmd"`;
			usleep($sleep*1e6);
		}

		for (my $i = 8; $i >= 0; $i--) {
			my $cmd = "0" . "$i" . "0";
			`water "$cmd"`;
			usleep($sleep*1e6);
		}

		for (my $i = 8; $i >= 0; $i--) {
			my $cmd = "00" . "$i";
			`water "$cmd"`;
			usleep($sleep*1e6);
		}
	}

	# full speed, sleep only at 4
	for (my $n = 0; $n < 24; $n++) {
		for (my $i = 0; $i <= 8; $i++) {
			`water "$i$i$i"`;
			if ((4 == $i) and (12 == $n)) {
				usleep(0.5*1e6);
			}
		}
		for (my $i = 8; $i >= 0; $i--) {
			`water "$i$i$i"`;
			if ((4 == $i) and (23 == $n)) {
				usleep(0.5*1e6);
			}
		}
	}

	# counter
	my $steps = 9*9*9;
	my $T = 3;  # time period, seconds
	my $sleep = $T/$steps;
	for (my $i = 0; $i <= 8; $i++) {
		for (my $j = 0; $j <= 8; $j++) {
			for (my $k = 0; $k <= 8; $k++) {
				if (0 == $counter_mode) {
					`water "$k$j$i"`;
				} elsif (1 == $counter_mode) {
					`water "$i$k$j"`;
				} else {
					`water "$j$i$k"`;
				}
				usleep($sleep*1e6);
			}
		}
	}
	if (++$counter_mode > 2) {
		$counter_mode = 0;	
	}
}

`water "000"`;
