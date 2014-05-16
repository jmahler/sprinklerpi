
all: technology-roadmap.pdf

technology-roadmap.pdf: technology-roadmap.tex
	pdflatex $<
	pdflatex $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
