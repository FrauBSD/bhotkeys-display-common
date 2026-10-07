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
# $FrauBSD: bhotkeys-display-common/Makefile 2026-10-06 19:39:42 -0700 Devin Teske $
#
############################################################ PATHS

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
LIBEXECDIR?=	${PREFIX}/libexec/bhotkeys
MANDIR?=	${PREFIX}/share/man/man1

############################################################ FILES

BIN=		bin/display-laptop-only bin/display-session-restore
SUBR=		libexec/display-randr-common.subr
MAN1=		display-laptop-only display-session-restore

############################################################ TARGETS

.PHONY: all

all: ${BIN} ${SUBR} man/display-laptop-only.1 \
	man/display-session-restore.1

.for prog in ${BIN}
${prog}: ${prog}.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' ${prog}.in > ${prog}
	chmod 755 ${prog}
.endfor

${SUBR}: ${SUBR}.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' ${SUBR}.in > ${SUBR}

.for page in ${MAN1}
man/${page}.1: man/${page}.1.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' man/${page}.1.in > man/${page}.1
.endfor

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
	rm -f ${BIN} ${SUBR} man/display-laptop-only.1 \
	    man/display-session-restore.1

################################################################################
# END
################################################################################
