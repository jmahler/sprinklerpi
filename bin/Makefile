
all: water

water: water.c
	cd ..; make
	gcc -Wall -Wextra -I../include ../lib/sprinklerpi.o $< -o $@
