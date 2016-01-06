FILE = mard-survey

#TARGET = 

PRINTER = lp

all: $(FILE).tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

l: $(FILE).tex
	pdflatex $(FILE)

b: $(FILE).tex
	bibtex $(FILE)

clean:
	rm -f $(FILE).out $(FILE).ps $(FILE).pdf $(FILE).log $(FILE).dvi $(FILE).bbl $(FILE).blg $(FILE).aux $(FILE).spl header.aux

pack:
	tar czvf ../$(shell date "+%Y%m%d:%H:%M")_$(FILE).tar.gz . --exclude=".git" --exclude=".gitignore" --exclude="misc/papers" --exclude="README.md"

#install:
#	scp $(FILE).ps  $(TARGET)
#	scp $(FILE).pdf  $(TARGET)

#pdf:
#	gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$(FILE).pdf $(FILE).ps -c quit

p:
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)
