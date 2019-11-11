all: help

.PHONY: install
install: man ## install orapass
	@mkdir -p /usr/lib/orapass
	@cp ./lib/orapass /usr/lib/orapass/orapass
	@ln -s -f /usr/lib/orapass/orapass /usr/bin/orapass
	@mkdir -p /usr/share/man1/			
	@cp /tmp/orapass_build/orapass.1 /usr/share/man/man1/orapass.1

.PHONY: local-install
local-install: man ## install orapass
	@mkdir -p /usr/local/lib/orapass
	@cp ./lib/orapass /usr/local/lib/orapass/orapass
	@ln -s -f /usr/local/lib/orapass/orapass /usr/local/bin/orapass
	@mkdir -p /usr/local/share/man/man1/
	@cp /tmp/orapass_build/orapass.1 /usr/local/share/man/man1/orapass.1

.PHONY: man
man:
	@mkdir -p /tmp/orapass_build/
	@pandoc -s -t man -o /tmp/orapass_build/orapass.1 man/orapass.1.md

.PHONY: test
test: ## run unit tests
	@unittest=1 lib/orapass

.PHONY: depends
depends: ## install dependencies
	@apt install `awk '/^[^#]/ { print $$1 }' requirements.txt`

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {gsub("\\\\n",sprintf("\n%22c",""), $$2);printf "\033[92m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
