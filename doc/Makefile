
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
main.pdf: main.tex references.bib
	# if it hangs, Ctrl-C, quit, then run program manually
	pdflatex $< 1>/dev/null
	biber main 1>/dev/null
	pdflatex $< 1>/dev/null

clean:
	-rm -f *.aux *.log *.blg *.bbl *.toc *.lof *.bcf
	-rm -f *.out *.pdf *-blx.bib *.xml
	-rm -f *.idx *.ilg *.ind *.idl
