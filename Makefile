#
# Makefile for Latex resume 
#
DEBUG='true'

FILE_NAME = Hugo_Arganda_Resume

# Folders
SRC_DIR = src
BUILD_DIR = .build
PDF_DIR = pdf
FILE_EXT = .pdf

# XeLaTex options
CC = xelatex
OPTS = -output-directory=$(BUILD_DIR)

# Resume folders
RESUME_DIR = $(SRC_DIR)/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

TODAY = $(shell date '+%Y.%m.%d')

FILE = $(PDF_DIR)/$(FILE_NAME)$(FILE_EXT)
FILE_BKP = $(PDF_DIR)/$(FILE_NAME)_$(TODAY)$(FILE_EXT)

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
	$(CC) $(OPTS) $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	cp $(BUILD_DIR)/resume.pdf $(FILE_BKP)
	cp $(FILE_BKP) $(FILE)

clean:
	rm -rf $(BUILD_DIR)/*.pdf
	rm -rf $(BUILD_DIR)/*.aux
