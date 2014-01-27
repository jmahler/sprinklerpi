
all: requirements.pdf

requirements.pdf: requirements.tex
	pdflatex requirements.tex
	biber requirements
	pdflatex requirements.tex

requirements-all.pdf: requirements.pdf
	#pdftk ERD-cover.pdf requirements.pdf drawings/*.PDF cat output out.pdf
	pdftk cover-page.pdf requirements.pdf cat output requirements-all.pdf

clean:
	-rm -f *.aux *.log *.blg *.bbl *.toc *.lof *.bcf
	-rm -f *.out *-blx.bib *.xml
	-rm -f *.idx *.ilg *.ind *.idl
	-rm -f *.glo *.xdy
	-rm -f *.glg *.gls *.ist
	-rm -f requirements.pdf requirements-all.pdf

