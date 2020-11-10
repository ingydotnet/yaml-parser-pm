SHELL := bash

PARSER := yaml-reference-parser

export PATH := $(PWD)/.bin:$(PATH)

build: lib/YAML/Parser.pm

test: build
	prove -lv test

clean:
	rm -fr $(PARSER)

lib/YAML/Parser.pm: $(PARSER) .bin/build-parser-module Meta
	build-parser-module $< > $@

$(PARSER):
	git clone git@github.com:yaml/$@
