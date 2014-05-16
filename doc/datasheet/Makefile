
all: datasheet.pdf

datasheet.pdf: datasheet.tex
	pdflatex $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
