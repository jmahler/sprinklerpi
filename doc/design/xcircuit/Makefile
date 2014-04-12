
all: hardware_overview.pdf control.pdf driver_mult.pdf power_supply.pdf \
	expansion_spi.pdf expansion_current.pdf spi-gpio.pdf spi-gpio-scaled.pdf

spi-gpio-scaled.pdf: spi-gpio-scaled.tex spi-gpio.pdf
	pdflatex $<

%.eps: %.ps
	ps2epsi $< $@

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.pdf
