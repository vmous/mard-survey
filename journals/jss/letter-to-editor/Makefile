#FILE  = letter-to-editor
FILE  = letter-to-editor-r1

PRINTER = pr

all:	$(FILE).tex
	latex $(FILE)
	dvips $(FILE).dvi -o $(FILE).ps
	evince $(FILE).ps

clean: 
	rm -f $(FILE).dvi $(FILE).ps $(FILE).pdf $(FILE).log $(FILE).aux

pdf:
	ps2pdf  $(FILE).ps  $(FILE).pdf

p:	
	lpr -P$(PRINTER) $(FILE).ps; 
	lpq -P$(PRINTER)
