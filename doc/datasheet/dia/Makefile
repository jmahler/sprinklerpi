
all:sprinklerpi_overview.pdf

%.pdf: %.eps
	epspdf $<

%.eps: %.dia
	dia -t eps -e $@ $<

clean:
	-rm -f *.pdf *.eps
