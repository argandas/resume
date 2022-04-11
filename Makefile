.PHONY: examples

COMPILER = xelatex
TEX_DIR = src
RESUME_DIR = src/resume
PDF_PATH = pdf
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

@echo RESUME_DIR
@echo RESUME_SRCS

files: $(foreach x, test resume, $x.pdf)

test.pdf: $(TEX_DIR)/test.tex 
	$(COMPILER) -output-directory=$(PDF_PATH) $<

resume.pdf: $(TEX_DIR)/resume.tex $(RESUME_SRCS)
	$(COMPILER) -output-directory=$(PDF_PATH) $<

clean:
	rm -rf $(PDF_PATH)/*.pdf