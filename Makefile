# See LICENSE for copyright and license details.

.POSIX:

include config.mk

BIN=lscolor
OBJ=lscolor.o util.o

NUKEFILES=config.h

all: ${BIN}

${OBJ}: config.h

.SUFFIXES:
.SUFFIXES: .c .o

.c.o:
	${CC} -c ${CPPFLAGS} ${CFLAGS} $<

${BIN}: ${OBJ}
	${LD} -o$@ ${LDFLAGS} ${OBJ}

config.h:
	cp config.def.h config.h

clean:
	rm -f ${BIN} ${BIN}.o ${OBJ}
nuke: clean
	rm -rf ${NUKEFILES}

install: ${BIN}
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ${BIN} ${DESTDIR}${PREFIX}/bin/${BIN}
	chmod 555 ${DESTDIR}${PREFIX}/bin/${BIN}
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	cp -f ${BIN}.1 ${DESTDIR}${MANPREFIX}/man1
	chmod 444 ${DESTDIR}${MANPREFIX}/man1/${BIN}.1

uninstall:
	rm ${DESTDIR}${PREFIX}/bin/${BIN}
	rm ${DESTDIR}${MANPREFIX}/man1/${BIN}.1

.OBJDIR: .
.PHONY: all clean nuke install uninstall
