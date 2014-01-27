
all: design.pdf

design.pdf: design.tex
	pdflatex $<
	biber design
	makeglossaries design
	pdflatex $<

design.ps: design.pdf
	pdf2ps $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f design.pdf design.ps design.dvi
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
