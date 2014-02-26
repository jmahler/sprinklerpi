
ARGV=-Wall -Wextra -pedantic

all: lib/sprinklerpi.o

lib/sprinklerpi.o: lib/sprinklerpi.c include/sprinklerpi.h
	gcc $(ARGV) -c -o lib/sprinklerpi.o -I include/ lib/sprinklerpi.c

clean:
	-rm -f lib/sprinklerpi.o

