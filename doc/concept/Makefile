
all: main.pdf

main.pdf: main.tex references.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	-rm -f *.aux *.log *.blg *.bbl *.toc *.lof *.bcf
	-rm -f *.out *.pdf *-blx.bib *.xml
	-rm -f *.idx *.ilg *.ind *.idl
	-rm -f *.glo *.xdy
	-rm -f *.glg *.gls *.ist
	-rm -f *.glsdefs

