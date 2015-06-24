# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

VERSION=		0.0.0
PKGREVISION=		2
DISTNAME=		hookyd-${VERSION}
CATEGORIES=		pagoda
MASTER_SITES=		github.com/pagodabox/hookyd

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/pagodabox/hookyd
COMMENT= 		A management plane for executing hooks remotely
#LICENSE=		# TODO: (see mk/license.mk)

GIT_REPOSITORIES=	hookyd
GIT_REPO.hookyd=	git@github.com:pagodabox/hookyd.git
# GIT_TAG=		v${VERSION}
GIT_TAG=		master

WRKSRC=			${WRKDIR}/hookyd

NO_BUILD=		yes
NO_CONFIGURE=		yes

HOOKY_SCRIPTS=		hookyd.lua job.lua lever.lua
HOOKY_CONFIG=		hookyd.conf

# RCD_SCRIPTS=		hookyd
# SMF_METHODS=		${RCD_SCRIPTS}
# HOOKY_WRAPPERS=		hookyd.lua

.PHONY: install-scripts install-config

do-install: install-scripts install-config

install-scripts:
	[[ -d ${DESTDIR}${PREFIX}/hookyd ]] || mkdir -p ${DESTDIR}${PREFIX}/hookyd
	for i in ${HOOKY_SCRIPTS}; \
	do \
		cp ${WRKSRC}/$$i ${DESTDIR}${PREFIX}/hookyd/$$i; \
	done

install-config:
	[[ -d ${DESTDIR}${PREFIX}/etc/hookyd ]] || mkdir -p ${DESTDIR}${PREFIX}/etc/hookyd
	for i in ${HOOKY_CONFIG}; \
	do \
		cp ${FILESDIR}/$$i ${DESTDIR}${PREFIX}/etc/hookyd/; \
	done

.include "../../gonano/luvit/buildlink3.mk"
.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"