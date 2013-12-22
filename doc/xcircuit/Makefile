
all: power_supply.pdf driver.pdf control.pdf

%.eps: %.ps
	ps2epsi $< $@

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f power_supply.pdf driver.pdf
