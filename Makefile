all: help

.PHONY: install
install: ## install orapass
	@mkdir -p /usr/lib/orapass
	@cp ./lib/orapass /usr/lib/orapass/orapass
	@ln -s /usr/lib/orapass/orapass /usr/bin/orapass

.PHONY: test
test: ## run unit tests
	@unittest=1 lib/orapass

.PHONY: depends
depends: ## install dependencies
	@apt install `awk '/^[^#]/ { print $$1 }' requirements.txt`

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {gsub("\\\\n",sprintf("\n%22c",""), $$2);printf "\033[92m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
