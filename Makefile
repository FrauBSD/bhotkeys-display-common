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
# $FrauBSD: bhotkeys-display-common/Makefile 2026-10-03 20:37:23 -0700 Devin Teske $
#
############################################################ PATHS

PREFIX?=	/usr/local
LIBEXECDIR?=	${PREFIX}/libexec/bhotkeys

############################################################ FILES

SUBR=		libexec/display-randr-common.subr

############################################################ TARGETS

.PHONY: all

all: ${SUBR}

${SUBR}: ${SUBR}.in Makefile
	sed -e 's|@PREFIX@|${PREFIX}|g' ${SUBR}.in > ${SUBR}

.PHONY: install

install: all
	mkdir -p ${DESTDIR}${LIBEXECDIR}
	install -m 644 ${SUBR} ${DESTDIR}${LIBEXECDIR}

.PHONY: clean

clean:
	rm -f ${SUBR}

################################################################################
# END
################################################################################
