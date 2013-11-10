FILE = distrproj

PRINTER = lp

all: $(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	okular $(FILE).pdf &

clean:
	rm -f $(FILE).ps $(FILE).pdf $(FILE).log $(FILE).dvi $(FILE).bbl $(FILE).blg $(FILE).aux

install:
	scp $(FILE).ps  $(TARGET)
	scp $(FILE).pdf  $(TARGET)

bib: $(FILE).tex
	bibtex $(FILE)

s: $(FILE).tex
	pdflatex $(FILE)

p:
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)
