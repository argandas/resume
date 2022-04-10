.PHONY: examples

COMPILER = xelatex
TEX_DIR = tex
PDF_PATH = pdf
TEST_SRCS = $(shell find $(TEX_DIR)/test -name '*.tex')
RESUME_SRCS = $(shell find $(TEX_DIR)/resume -name '*.tex')

files: $(foreach x, test resume, $x.pdf)

test.pdf: $(TEX_DIR)/test/test.tex $(TEST_SRCS)
	$(COMPILER) -output-directory=$(PDF_PATH) $<

resume.pdf: $(TEX_DIR)/resume/resume.tex $(TEX_DIR)/resume/structure.tex
	$(COMPILER) -output-directory=$(PDF_PATH) $<

clean:
	rm -rf $(PDF_PATH)/*.pdf