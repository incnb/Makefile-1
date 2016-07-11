.PHONY: run install clean

VENV_DIR ?= .env
PYTHON = python3.5
REQUIREMENTS = requirements.txt

run:
	clear
	$(VENV_DIR)/bin/$(PYTHON) main.py

init:
	clear
	rm -rf $(VENV_DIR)
	@$(MAKE) $(VENV_DIR)

clean:
	find . -iname "*.pyc" -delete
	find . -iname "*.pyo" -delete
	find . -iname "__pycache__" -delete

test:
	clear
	$(VENV_DIR)/bin/$(PYTHON) -m unittest discover

coverage:
	clear
	$(VENV_DIR)/bin/$(PYTHON) -m coverage run -m unittest discover
	$(VENV_DIR)/bin/$(PYTHON) -m coverage report -m

pep8:
	clear
	$(VENV_DIR)/bin/flake8 .

$(VENV_DIR):
	virtualenv $(VENV_DIR)
	if [ -a $(REQUIREMENTS) ] ; \
	then \
		$(VENV_DIR)/bin/pip install -r requirements.txt ; \
	else \
		$(VENV_DIR)/bin/pip install flake8 coverage; \
		$(VENV_DIR)/bin/pip freeze > requirements.txt ; \
	fi;
