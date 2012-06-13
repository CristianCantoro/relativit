# ancora sperimentale

NAME	= relativit
DEST 	= RelSpec 
MAIN_SOURCE	= $(NAME).tex
OUTDVI  = $(NAME).dvi
OUTPDF	= $(NAME).pdf
IST	= $(NAME).ist
IND	= $(NAME).ind
IDX	= $(NAME).idx
BBL	= $(NAME).bbl
TEXS	= $(wildcard TeX/*.tex)

LATEX	= latex
PDFLATEX = pdflatex
BIBTEX	= bibtex
MAKEINDEX = makeindex


pdf:	pdf_images $(MAIN_SOURCE) $(IND) $(OUTPDF)

dvi:	eps_images $(MAIN_SOURCE) $(IND) $(OUTDVI)

images: pdf_images eps_images

pdf_images:
	@$(MAKE) -C immagini pdf_images

eps_images:
	@$(MAKE) -C immagini eps_images

$(OUTPDF):	$(MAIN_SOURCE) $(IND) $(TEXS)
	$(PDFLATEX) $(MAIN_SOURCE)
	@while (grep "Rerun to get cross-references" $(NAME).log > /dev/null ); do echo '** Re-running LaTeX **'; $(PDFLATEX) $(MAIN_SOURCE); done

$(OUTDVI):	$(MAIN_SOURCE) $(IND) $(TEXS)
	$(LATEX) $(MAIN_SOURCE)

$(IND):	
	@echo ************************
	@echo     creazione indice
	@echo ************************
	$(PDFLATEX) $(MAIN_SOURCE)
	$(MAKEINDEX) $(IDX)
#TODO: PDFLATEX / LATEX

$(BBL): $(TEXSRC) $(BIBSRC)
	$(LATEX) $(TARGET).tex
	$(BIBTEX) $(TARGET)

clean:
	rm -f *.aux $(NAME).ilg $(NAME).ind $(NAME).lof $(NAME).log $(NAME).lot $(NAME).toc *.tex~ TeX/*.tex~ TeX/*.aux TeX/*.backup TeX/*.bak $(NAME).out $(NAME).blg $(NAME).idx
	cat $(NAME).maf|xargs rm -f
	rm -f $(NAME).maf
	rm -f *.backup

tar:	
	clean
	tar cfv $(NAME).tar $(DEST); mv $(NAME).tar $(DEST); gzip $(NAME).tar
