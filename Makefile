pdfs=pods-R-intro

all: ${pdfs}.pdf

%.tex: %.Rnw
	R CMD sweave $<

%.pdf: %.tex
	latexmk -pdf $<
	echo "open R and do tools::compactPDF() on files"

clean:
	-rm *.aux *.log *.nav *.out *.snm *.synctex* *.tox *.vrb *latexmk *.fls *.toc

clean-all:
	make clean
	-rm ${pdfs}.pdf ${pdfs}.tex
