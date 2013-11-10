FILE = mard-survey

TARGET = ad@perth.di.uoa.gr:/home/users/ad/public_html/k24/

PRINTER = lp

all: $(FILE).tex
	rm -f $(FILE).ps
	pdflatex $(FILE).tex
	okular $(FILE).pdf

install:
	scp $(FILE).ps  $(TARGET)
	scp $(FILE).pdf  $(TARGET)

clean:
	rm -f $(FILE).ps $(FILE).pdf $(FILE).log $(FILE).dvi $(FILE).bbl $(FILE).aux $(FILE).blg

pdf:
	gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$(FILE).pdf $(FILE).ps -c quit

bib:$(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	dvips $(FILE).dvi -o $(FILE).ps
	# rm $(FILE).dvi $(FILE).log $(FILE).blg

s:$(FILE).tex
	pdflatex $(FILE)

p:	
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)

