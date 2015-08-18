# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:pagodabox/nanobox-nanoinit.git

VERSION=		0.0.0
PKGREVISION=		1
DISTNAME=		nanoinit-${VERSION}
CATEGORIES=		nanobox
MASTER_SITES=		github.com/pagodabox/nanobox-nanoinit

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/pagodabox/nanobox-nanoinit
COMMENT= 		A combination of Nano and Init
#LICENSE=		# TODO: (see mk/license.mk)

GIT_REPOSITORIES=	nanoinit
GIT_REPO.nanoinit=	git@github.com:pagodabox/nanobox-nanoinit.git
# GIT_TAG=		v${VERSION}
GIT_TAG=		master

WRKSRC=			${WRKDIR}/nanoinit

do-install:
	mkdir -p ${DESTDIR}/${PREFIX}/bin
	cp ${WRKSRC}/nanoinit ${DESTDIR}/${PREFIX}/bin/nanoinit

.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
