
all: main.pdf

main.pdf: main.tex
	pdflatex $<
	biber main
	makeglossaries main
	pdflatex $<

main.ps: main.pdf
	pdf2ps $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f main.pdf main.ps main.dvi
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
