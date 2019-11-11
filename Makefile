all: help

.PHONY: install
install: man ## install orapass
	@mkdir -p /usr/lib/orapass
	@cp ./lib/orapass /usr/lib/orapass/orapass
	@ln -s -f /usr/lib/orapass/orapass /usr/bin/orapass
	@mkdir -p /usr/share/man1/			
	@cp /tmp/orapass_build/orapass.1.gz /usr/share/man/man1/orapass.1.gz

.PHONY: local-install
local-install: man ## install orapass
	@mkdir -p /usr/local/lib/orapass
	@cp ./lib/orapass /usr/local/lib/orapass/orapass
	@ln -s -f /usr/local/lib/orapass/orapass /usr/local/bin/orapass
	@mkdir -p /usr/local/share/man/man1/
	@cp /tmp/orapass_build/orapass.1.gz /usr/local/share/man/man1/orapass.1.gz

.PHONY: man
man:
	@mkdir -p /tmp/orapass_build/
	@pandoc -s -t man man/orapass.1.md | gzip > /tmp/orapass_build/orapass.1.gz 

.PHONY: test
test: ## run unit tests
	@unittest=1 lib/orapass

.PHONY: depends
depends: ## install dependencies
	@apt install `awk '/^[^#]/ { print $$1 }' requirements.txt`

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {gsub("\\\\n",sprintf("\n%22c",""), $$2);printf "\033[92m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
