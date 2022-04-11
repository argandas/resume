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

.PHONY: clean resume.pdf

resume.pdf:
	@echo "Compile Latex ..."
	[-d $(BUILD_DIR)] || mkdir -p $(BUILD_DIR)
ifeq ($(DEBUG) , 'true')
	@echo $(SRC_DIR)
	@echo $(RESUME_DIR)
	@echo $(RESUME_SRCS)
endif
	$(CC) $(OPTS) $(SRC_DIR)/test.tex
	$(CC) $(OPTS) $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	mv $(BUILD_DIR)/resume.pdf "pdf/Hugo_Arganda_$(shell date '+%Y.%m.%d').pdf"

clean:
	rm -rf $(BUILD_DIR)/*.pdf	
	rm -rf $(PDF_DIR)/*.pdf