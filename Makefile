PREFIX ?= /usr/local
INSTALL ?= /usr/bin/install
CURL ?= /usr/bin/curl
URL = "https://raw.githubusercontent.com/freebsd/freebsd/master/bin/realpath/realpath.{c,1}"

bin = realpath
src = $(bin).c
obj = $(src:.c=.o)

all: $(bin)
.PHONY: all

$(bin): $(obj)

$(obj): $(src)

$(src):
	$(CURL) -sO $(URL)

install: $(bin)
	$(INSTALL) -o root -g wheel -m 755 -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -o root -g wheel -m 555 $(bin) $(DESTDIR)$(PREFIX)/bin/
	$(INSTALL) -o root -g wheel -m 755 -d $(DESTDIR)$(PREFIX)/share/man/man1
	$(INSTALL) -o root -g wheel -m 444 $(bin).1 $(DESTDIR)$(PREFIX)/share/man/man1/
	$(INSTALL) -o root -g wheel -m 755 -d $(DESTDIR)$(PREFIX)/share/doc/$(bin)
	$(INSTALL) -o root -g wheel -m 444 LICENSE $(DESTDIR)$(PREFIX)/share/doc/$(bin)/
.PHONY: install

uninstall:
	rm -f $(PREFIX)/bin/$(bin)
	rm -f $(PREFIX)/share/man/man1/$(bin).1
	rm -rf $(PREFIX)/share/doc/$(bin)
.PHONY: uninstall

clean:
	rm -f $(obj) $(bin)
.PHONY: clean

distclean:
	rm -rf $(src) $(obj) $(bin) $(bin).1
.PHONY: distclean
