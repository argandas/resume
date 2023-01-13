#
# Makefile for Latex resume 
#
DEBUG='false'

FILE_NAME = Hugo_Arganda_Resume

# Folders
SRC_DIR = resume/src
BUILD_DIR = .build

# XeLaTex options
CC = xelatex
OPTS = -output-directory=$(BUILD_DIR)

# Resume folders
SRC = $(shell find $(SRC_DIR) -name '*.tex')

.PHONY: clean resume.pdf

resume.pdf:
	@echo "Compile Latex ..."
	[-d $(BUILD_DIR)] || mkdir -p $(BUILD_DIR)
ifeq ($(DEBUG) , 'true')
	@echo $(SRC_DIR)
	@echo $(SRC)
endif
	$(CC) $(OPTS) resume/resume.tex resume/resume.cls $(SRC)
	$(CC) $(OPTS) resume/resume.tex resume/resume.cls $(SRC)

clean:
	rm -rf $(BUILD_DIR)/*.pdf
	rm -rf $(BUILD_DIR)/*.aux
