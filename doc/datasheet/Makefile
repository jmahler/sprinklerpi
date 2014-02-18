
all: datasheet.pdf

datasheet.pdf: datasheet.tex
	pdflatex $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f datasheet.pdf datasheet.ps datasheet.dvi
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
