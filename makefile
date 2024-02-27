OUTPUTDIR = output
SRC_FILES = main.tex
FIGURES = $(wildcard figures/*.tex)
OUTPUT = $(SRC_FILES:.tex=.pdf)

all: $(OUTPUT)

$(OUTPUT): $(FIGURES:.tex=.pdf)\

%.pdf: %.tex
	latexmk --output-directory=$(shell pwd)/$(OUTPUTDIR) -f -interaction=nonstopmode -shell-escape -pdf -use-make -cd $<
	mv $(shell pwd)/$(OUTPUTDIR)/$(shell basename $@) $(shell pwd)/$@

clean:
	latexmk --output-directory=$(shell pwd)/$(OUTPUTDIR) -pdf -cd -C $(SRC_FILES) $(FIGURES)
	$(RM) $(OUTPUT)
	$(RM) figures/*.pdf
	$(RM) main.bbl
