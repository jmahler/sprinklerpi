
all: concept.pdf

concept.pdf: concept.tex
	pdflatex concept.tex
	biber concept
	pdflatex concept.tex

clean:
	-rm -f *.aux *.log *.blg *.bbl *.toc *.lof *.bcf
	-rm -f *.out *.pdf *-blx.bib *.xml
	-rm -f *.idx *.ilg *.ind *.idl
	-rm -f *.glo *.xdy
	-rm -f *.glg *.gls *.ist
	-rm -f *.glsdefs

