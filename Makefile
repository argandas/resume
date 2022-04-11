#
# Makefile for Latex resume 
#
DEBUG='true'

# Folders
ROOT_DIR=$(shell pwd)
SRC_DIR = $(ROOT_DIR)/src
BUILD_DIR=$(ROOT_DIR)/pdf

# XeLaTex options
CC = xelatex
OPTS = -output-directory=$(BUILD_DIR)

# Resume folders
RESUME_DIR = $(SRC_DIR)/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

.PHONY: clean resume.pdf

resume.pdf:
    @echo "Compile Latex ..."
ifeq ($(DEBUG) , 'true')
	@echo $(SRC_DIR)
	@echo $(RESUME_DIR)
	@echo $(RESUME_SRCS)
endif
	$(CC) $(OPTS) $(SRC_DIR)/test.tex
	$(CC) $(OPTS) $(SRC_DIR)/resume.tex $(RESUME_SRCS)

clean:
	rm -rf $(BUILD_DIR)/*.pdf