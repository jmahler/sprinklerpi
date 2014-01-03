
all: power_supply.pdf driver_one.pdf driver_mult.pdf control.pdf \
	expansion_current.pdf expansion_spi.pdf

driver_one.ps: driver.ps
	psselect -p1 $< $@

driver_mult.ps: driver.ps
	psselect -p2 $< $@

%.eps: %.ps
	ps2epsi $< $@

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f power_supply.pdf driver.pdf control.pdf
	-rm -f driver_one.ps driver_mult.ps
	-rm -f expansion_current.pdf expansion_spi.pdf
