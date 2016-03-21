CC=TEXINPUTS="$(shell pwd)/..:$(TEXINPUTS)" pdflatex
NO_SOLUTION=$(shell basename `pwd`)
SOLUTION=$(NO_SOLUTION)s

all: $(SOLUTION).pdf $(NO_SOLUTION).pdf

$(SOLUTION).pdf: $(SOLUTION).tex
	$(CC) $(SOLUTION)

$(NO_SOLUTION).tex: $(SOLUTION).tex
	$(SHELL) ../bin/strip_solutions.sh $(SOLUTION).tex > $(NO_SOLUTION).tex

$(NO_SOLUTION).pdf: $(NO_SOLUTION).tex
	$(CC) $(NO_SOLUTION)

clean:
	rm -f $(SOLUTION).{pdf,log,out,aux} $(NO_SOLUTION).{tex,pdf,log,out,aux}

.PHONY: all clean

