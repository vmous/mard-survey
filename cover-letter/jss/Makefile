FILE  = Letter2Editor

PRINTER = pr

all:	$(FILE).tex
	latex $(FILE)
	dvips $(FILE).dvi -o $(FILE).ps
	evince $(FILE).ps

clean: 
	rm -f $(FILE).dvi $(FILE).ps $(FILE).pdf $(FILE).log

pdf:
	ps2pdf  $(FILE).ps  $(FILE).pdf
	

# gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$(FILE).pdf $(FILE).ps -c quit

bib:	$(FILE).tex
	bibtex $(FILE)
	latex $(FILE)
	latex $(FILE)
	dvips $(FILE).dvi -o $(FILE).ps
	ghostview $(FILE).ps

s:	$(FILE).tex
	latex $(FILE)
	dvips $(FILE).dvi -o $(FILE).ps

p:	
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)

install:
	cp $(FILE).ps /home/ad/public_html/NEWDelisCV.ps
	chmod 755  /home/ad/public_html/NEWDelisCV.ps
