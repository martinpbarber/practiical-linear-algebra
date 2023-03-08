VENV := .venv
ACTIVATE := $(VENV)/bin/activate
ACTIVATE_VENV := . $(ACTIVATE)


.PHONY: notebook
notebook: venv
	$(ACTIVATE_VENV) && jupyter notebook
	
.PHONY: venv
venv: $(ACTIVATE)
$(ACTIVATE): requirements.txt
	python3 -m venv $(VENV)
	$(ACTIVATE_VENV) && pip install -r requirements.txt

.PHONY: versions
versions: venv
	$(ACTIVATE_VENV) && pip list

.PHONY: outdated
outdated: venv
	$(ACTIVATE_VENV) && pip list --outdated

.PHONY: clean
clean:
	rm -rf $(VENV)
	find . -name '__pycache__' -exec rm -rf {} +
