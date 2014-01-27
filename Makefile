FILE = mard-survey

TARGET = ad@perth.di.uoa.gr:/home/users/ad/public_html/k24/

PRINTER = lp

all: $(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	okular $(FILE).pdf &

clean:
	rm -f $(FILE).ps $(FILE).pdf $(FILE).log $(FILE).dvi $(FILE).bbl $(FILE).blg $(FILE).aux

update: $(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

install:
	scp $(FILE).ps  $(TARGET)
	scp $(FILE).pdf  $(TARGET)

#pdf:
#	gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$(FILE).pdf $(FILE).ps -c quit

b: $(FILE).tex
	bibtex $(FILE)

s: $(FILE).tex
	pdflatex $(FILE)

p:
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)

