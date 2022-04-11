#
# Makefile for Latex resume 
#
DEBUG='true'

# Folders
SRC_DIR = src
BUILD_DIR = .build
PDF_DIR = pdf

# XeLaTex options
CC = xelatex
OPTS = -output-directory=$(BUILD_DIR)

# Resume folders
RESUME_DIR = $(SRC_DIR)/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

TODAY = $(shell date '+%Y.%m.%d')
.PHONY: clean resume.pdf

resume.pdf:
	@echo "Compile Latex ..."
	[-d $(BUILD_DIR)] || mkdir -p $(BUILD_DIR)
	[-d $(PDF_DIR)] || mkdir -p $(PDF_DIR)
ifeq ($(DEBUG) , 'true')
	@echo $(SRC_DIR)
	@echo $(RESUME_DIR)
	@echo $(RESUME_SRCS)
	$(CC) $(OPTS) $(SRC_DIR)/test.tex
endif
# Run 1st time to generate AUX files
	$(CC) $(OPTS) $(SRC_DIR)/resume.tex $(RESUME_SRCS)
# Run 2nd time to generate PDF file with page numbering
	$(CC) $(OPTS) $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	mv $(BUILD_DIR)/resume.pdf "pdf/Hugo_Arganda_$(TODAY).pdf"
	cp "pdf/Hugo_Arganda_$(TODAY).pdf" "pdf/Hugo_Arganda_Resume.pdf"

clean:
	rm -rf $(BUILD_DIR)/*.pdf
	rm -rf $(PDF_DIR)/*.pdf