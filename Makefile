## Spyglass Installer
##
## Selfdocumenting Makefile
## Based on https://www.freecodecamp.org/news/self-documenting-makefile/


.PHONY: help install uninstall update


#### Install Paths
USER = $(shell whoami)
SYSTEMD = /etc/systemd/system
BIN_PATH = /usr/local/bin
CONF_PATH = /home/$(USER)/printer_data/config

all:
	$(MAKE) help

install: ## Install Spyglass as service
	@printf "\nCopying systemd service file ...\n"
	@cp -f "${PWD}/resources/spyglass.service" $(SYSTEMD)
	@printf "\nCopying spyglass launch script ...\n"
	@cp -f "${PWD}/scripts/spyglass" $(BIN_PATH)
	@printf "\nCopying basic configuration file ...\n"
	@cp -f "${PWD}/resources/spyglass.service" $(CONF_PATH)

uninstall: ## Uninstall Spyglass
	@echo "On ToDo List :)"

update: ## Update Spyglass (via git Repository)
	@git fetch && git pull



help: ## Show this help
	@printf "\nSpyglass Install Helper:\n"
	@grep -E -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

