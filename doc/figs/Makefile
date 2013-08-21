
all: driver.pdf

driver.pdf: driver.svg
	inkscape -D -z --file=driver.svg --export-pdf=driver.pdf

driver.pdf_tex: driver.svg
	inkscape -D -z --file=driver.svg --export-pdf=driver.pdf --export-latex

clean:
	-rm -f *.pdf_tex *.pdf
