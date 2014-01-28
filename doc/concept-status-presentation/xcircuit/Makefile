
all: hardware_overview.pdf

%.eps: %.ps
	ps2epsi $< $@

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.pdf
