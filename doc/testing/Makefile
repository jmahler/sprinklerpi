
all: testing.pdf

testing.pdf: testing.tex
	pdflatex $<
	biber testing
	pdflatex $<

#testing.ps: testing.pdf
#	pdf2ps $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
