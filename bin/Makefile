
all: water

ARGV=-Wall -Wextra -pedantic
INC=-I../include ../lib/sprinklerpi.o

water: water.c
	gcc $(ARGV) $(INC) $< -o $@

%: %.c
	gcc $(ARGV) $< -o $@

clean:
	cd ..; make clean
	-rm -f water
