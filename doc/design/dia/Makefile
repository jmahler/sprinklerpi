
all: hardware_state.pdf software_overview.pdf queue-daemon.pdf \
	timer-daemon.pdf architectural_overview.pdf sprinklerpi_overview.pdf \
	tester.pdf

%.pdf: %.eps
	epspdf $<

%.eps: %.dia
	dia -t eps -e $@ $<

clean:
	-rm -f *.pdf *.eps
