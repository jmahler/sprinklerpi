
all: power_supply.pdf

power_supply.eps: power_supply.ps
	ps2epsi $< $@

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f power_supply.pdf
