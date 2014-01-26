
all: architecture_overview.pdf control.pdf driver_mult.pdf power_supply.pdf

%.eps: %.ps
	ps2epsi $< $@

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f architecture_overview.pdf
