.PHONY: examples

COMPILER = xelatex
TEX_DIR = tex
PDF_PATH = pdf
TEX_SRCS = $(shell find $(TEX_DIR) -name '*.tex')

files: $(foreach x, test, $x.pdf)

test.pdf: $(TEX_DIR)/test.tex $(TEX_SRCS)
	$(COMPILER) -output-directory=$(PDF_PATH) $<

clean:
	rm -rf $(PDF_PATH)/*.pdf