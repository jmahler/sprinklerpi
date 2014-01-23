
#
# The following packages were required
# to build on a Debian system:
#
#   biblatex
#   texlive-latex-extra
#   texlive-fonts-recommended
#

all: main.pdf

# pdf, with links
main.pdf: main.tex main.bib
	cd xcircuit; make
	pdflatex $<
	biber main
	pdflatex $<

clean:
	cd xcircuit; make clean
	-rm -f *.aux *.log *.blg *.bbl *.toc *.lof *.bcf
	-rm -f *.out *.pdf *-blx.bib *.xml
	-rm -f *.idx *.ilg *.ind *.idl
