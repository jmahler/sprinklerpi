#!/usr/bin/perl
use strict;

unless (@ARGV) {
	die "usage: $0 <file.csv>";
}
my $file = shift @ARGV;

open(IN, "<", $file)
	or die "Unable to open file '$file': $!";

my $header = <IN>;
chomp($header);

my @names = split /,\s*/, $header;

my $co;
for ($co = 0; $co < @names; $co++) {
	if ($names[$co] eq 'cost') {
		last;
	}
}
if ($co == @names) {
	die "Unable to find 'cost' in header\n";
}

my $total_cost = 0;
while (my $line = <IN>) {
	chomp($line);

	print "$line\n";
	my @vals = split /,\s*/, $line;

	$total_cost += $vals[$co];
}

print "total cost: $total_cost\n";

close(IN);
