.PHONY: examples

COMPILER = xelatex
PDF_PATH = ../pdf

files: $(foreach x, test resume, $x.pdf)

resume.pdf: resume.tex
	$(COMPILER) -output-directory=$(PDF_PATH) $<

clean:
	rm -rf $(PDF_PATH)/*.pdf