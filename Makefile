############################################################ LICENSE
#
# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (c) 2026 Devin Teske <dteske@FreeBSD.org>
#
############################################################ IDENT(1)
#
# $Title: bhotkeys-display-common - shared display layouts $
# $Copyright: 2026 Devin Teske. All rights reserved. $
# $FrauBSD: bhotkeys-display-common/Makefile 2026-10-05 21:46:53 -0700 Devin Teske $
#
############################################################ PATHS

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
LIBEXECDIR?=	${PREFIX}/libexec/bhotkeys
MANDIR?=	${PREFIX}/share/man/man1

############################################################ FILES

BIN=		bin/display-laptop-only
SUBR=		libexec/display-randr-common.subr
MAN1=		display-laptop-only

############################################################ TARGETS

.PHONY: all

all: ${BIN} ${SUBR} man/display-laptop-only.1

${BIN}: ${BIN}.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' ${BIN}.in > ${BIN}
	chmod 755 ${BIN}

${SUBR}: ${SUBR}.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' ${SUBR}.in > ${SUBR}

man/display-laptop-only.1: man/display-laptop-only.1.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' man/display-laptop-only.1.in \
	    > man/display-laptop-only.1

.PHONY: install

install: all
	mkdir -p ${DESTDIR}${BINDIR} ${DESTDIR}${LIBEXECDIR} \
	    ${DESTDIR}${MANDIR}
	install -m 755 ${BIN} ${DESTDIR}${BINDIR}
	install -m 644 ${SUBR} ${DESTDIR}${LIBEXECDIR}
.for m in ${MAN1}
	gzip -cn man/${m}.1 > ${DESTDIR}${MANDIR}/${m}.1.gz
	chmod 444 ${DESTDIR}${MANDIR}/${m}.1.gz
.endfor

.PHONY: clean

clean:
	rm -f ${BIN} ${SUBR} man/display-laptop-only.1

################################################################################
# END
################################################################################
