.PHONY: build test install uninstall reinstall clean

FINDLIB_NAME=inotify-event
MOD_NAME=inotify_event

OCAMLBUILD=ocamlbuild -use-ocamlfind -classic-display

WITH_CMDLINER=$(shell ocamlfind query cmdliner > /dev/null 2>&1 ; echo $$?)

TARGETS=.cma .cmxa

PRODUCTS=$(addprefix $(MOD_NAME),$(TARGETS))

ifeq ($(WITH_CMDLINER), 0)
PRODUCTS+=inotify_events.native
endif

TYPES=.mli .cmi .cmti

INSTALL:=$(addprefix $(MOD_NAME), $(TYPES)) \
         $(addprefix $(MOD_NAME), $(TARGETS))

INSTALL:=$(addprefix _build/lib/,$(INSTALL))

ARCHIVES:=_build/lib/$(MOD_NAME).a

build:
	$(OCAMLBUILD) $(PRODUCTS)

test: build
	$(OCAMLBUILD) lib_test/test.native
	./test.native

install:
	ocamlfind install $(FINDLIB_NAME) META $(INSTALL) $(ARCHIVES)

uninstall:
	ocamlfind remove $(FINDLIB_NAME)

reinstall: uninstall install

clean:
	ocamlbuild -clean
	rm -f lib/inotify_event.cm? lib/inotify_event.o
