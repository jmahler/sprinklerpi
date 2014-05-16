
all: hardware_state.pdf queue-daemon.pdf \
	scheduler-daemon.pdf \
	sprinklerpi_overview.pdf sprinklerpi_overview-net.pdf \
	tester.pdf \
	daemon_oview.pdf \
	water-daemon.pdf \
	daemon_oview-net.pdf

%.pdf: %.eps
	epspdf $<

%.eps: %.dia
	dia -t eps -e $@ $<

clean:
	-rm -f *.pdf *.eps
