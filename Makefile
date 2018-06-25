GITBOOK_SERVE = docker run -d --rm -v "$(PWD)":/gitbook -p 4000:4000 billryan/gitbook gitbook serve
GITBOOK_PDF   = docker run --rm -it -v "$(PWD)":/gitbook billryan/gitbook gitbook pdf .

INPUTS = $(wildcard **/*.md)

all: docs.pdf
.PHONY: all

start:
	@$(GITBOOK_SERVE) > .server

stop:
	@docker stop `cat .server`
	@rm .server
.PHONY: stop

docs.pdf: $(INPUTS)
	@$(GITBOOK_PDF) $@

clean: 
	@rm -rf docs.pdf
	@rm -rf _book
.PHONY: clean
