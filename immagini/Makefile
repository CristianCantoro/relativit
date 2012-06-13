FIGS = $(wildcard *.fig) $(wildcard */*.fig)
SVGS = $(wildcard *.svg) $(wildcard */*.svg)
MATHEMATICAS = $(wildcard *.mathematica) $(wildcard */*.mathematica)
PDFS = $(FIGS:.fig=.pdf) $(SVGS:.svg=.pdf) $(MATHEMATICAS:.mathematica=.pdf)
EPSS = $(FIGS:.fig=.eps) $(SVGS:.svg=.eps) $(MATHEMATICAS:.mathematica=.eps)


images: pdf_images eps_images

remove_pdf_images:
	rm $(PDFS) --force

remove_eps_images:
	rm $(EPSS) --force

pdf_images: $(PDFS)

eps_images: $(EPSS)

%.pdf: %.fig
	fig2dev -L pdf $< $@ 

%.pdf: %.svg
	inkscape --export-pdf=$@ $<

%.pdf: %.mathematica
	math -noprompt -run "<<$<"

%.eps: %.fig
	fig2dev -L eps $< $@

%.eps: %.svg
	inkscape --export-eps=$@ $<

%.eps: %.mathematica
	math -noprompt -run "<<$<"
