FILE = mard-survey

TARGET = ad@perth.di.uoa.gr:/home/users/ad/public_html/k24/

PRINTER = lp

all: $(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)
	okular $(FILE).pdf &

u: $(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

pack:
	tar czvf ../$(shell date "+%Y%m%d:%H:%M")_$(FILE).tar.gz . --exclude=".git" --exclude=".gitignore" --exclude="misc/papers" --exclude="README.md"

clean:
	rm -f $(FILE).ps $(FILE).pdf $(FILE).log $(FILE).dvi $(FILE).bbl $(FILE).blg $(FILE).aux $(FILE).spl

install:
	scp $(FILE).ps  $(TARGET)
	scp $(FILE).pdf  $(TARGET)

#pdf:
#	gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$(FILE).pdf $(FILE).ps -c quit

b: $(FILE).tex
	bibtex $(FILE)

l: $(FILE).tex
	pdflatex $(FILE)

p:
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)
