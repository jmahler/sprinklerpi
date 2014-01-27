
all: schedule.pdf

schedule.pdf: schedule.tex
	pdflatex $<

schedule.ps: schedule.pdf
	pdf2ps $<

clean:
	-rm -f *.log *.aux *.toc *.out *.blg *.bcf *.bbl *.xml
	-rm -f schedule.pdf schedule.ps schedule.dvi
	-rm -f *.glo *.gls *.glg *.glsdefs *.xdy
