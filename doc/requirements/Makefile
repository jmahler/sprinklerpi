
all: main.pdf

main.pdf: main.tex references.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex

main-all.pdf: main.pdf
	#pdftk ERD-cover.pdf main.pdf drawings/*.PDF cat output out.pdf
	pdftk cover-page.pdf main.pdf cat output main-all.pdf

clean:
	-rm -f *.aux *.log *.blg *.bbl *.toc *.lof *.bcf
	-rm -f *.out *-blx.bib *.xml
	-rm -f *.idx *.ilg *.ind *.idl
	-rm -f *.glo *.xdy
	-rm -f *.glg *.gls *.ist
	-rm -f main.pdf main-all.pdf

