## Spyglass Installer
##
## Based on https://www.freecodecamp.org/news/self-documenting-makefile/


.PHONY: help install update

all:
	$(MAKE) help

install: ## Install Spyglass as service
	@echo "On ToDo List :)"


update: ## Update Spyglass (via git Repository)
	@git fetch && git pull



help: ## Show this help
	@printf "\nSpyglass Install Helper:\n"
	@grep -E -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

