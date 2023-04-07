VENV           = ./venv
BIN            = $(VENV)/bin
VENV_PYTHON    = $(BIN)/python
SYSTEM_PYTHON  = $(or $(shell which python3), $(shell which python))
PYTHON         = $(or $(wildcard $(VENV_PYTHON)), $(SYSTEM_PYTHON))
MYPATH         = $(PWD)/lib:$(PATH)

venv:
	$(SYSTEM_PYTHON) -m venv $(VENV)
	$(VENV_PYTHON) -m pip install --upgrade pip
	$(VENV_PYTHON) -m pip install -U setuptools wheel

install:
	$(VENV_PYTHON) -m pip install -r requirements.txt

clean-venv:
	rm -rf venv
clean-env:
	rm -rf __pycache__ logs

all: venv install
clean: clean-venv clean-env

.PHONY: clean venv install all
