
all: water

ARGV=-Wall -Wextra -pedantic

libsprinklerpi.o: libsprinklerpi.c libsprinklerpi.h
	gcc -c $(ARGV) $< -o $@

water: water.c libsprinklerpi.o
	gcc $(ARGV) $^ -o $@

clean:
	cd ..; make clean
	-rm -f water
	-rm -f *.o
