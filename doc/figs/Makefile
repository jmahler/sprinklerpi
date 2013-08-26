
all: driver.pdf power.pdf

power.pdf: power.svg
	inkscape -D -z --file=power.svg --export-pdf=power.pdf

driver.pdf: driver.svg
	inkscape -D -z --file=driver.svg --export-pdf=driver.pdf

clean:
	-rm -f *.pdf_tex *.pdf
