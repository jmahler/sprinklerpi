
all: design.pdf

design.pdf: design.tex
	cd dia; make
	cd xcircuit; make
	pdflatex $<
	biber design
	makeglossaries design
	pdflatex $<

design.ps: design.pdf
	pdf2ps $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
