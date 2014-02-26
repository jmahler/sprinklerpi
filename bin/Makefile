
ARGV=-Wall -Wextra -pedantic

all: water

water: water.c
	cd ..; make
	gcc $(ARGV) -I../include ../lib/sprinklerpi.o $< -o $@

clean:
	cd ..; make clean
	-rm -f water
