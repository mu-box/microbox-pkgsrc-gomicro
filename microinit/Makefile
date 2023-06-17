# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:mu-box/microbox-microinit.git

VERSION=		0.0.0
PKGREVISION=		1
DISTNAME=		microinit-${VERSION}
CATEGORIES=		microbox
MASTER_SITES=		github.com/mu-box/microbox-microinit

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/mu-box/microbox-microinit
COMMENT= 		A combination of Nano and Init
#LICENSE=		# TODO: (see mk/license.mk)

GIT_REPOSITORIES=	microinit
GIT_REPO.microinit=	git@github.com:mu-box/microbox-microinit.git
# GIT_TAG=		v${VERSION}
GIT_TAG=		master

WRKSRC=			${WRKDIR}/microinit

do-install:
	mkdir -p ${DESTDIR}/${PREFIX}/bin
	cp ${WRKSRC}/microinit ${DESTDIR}/${PREFIX}/bin/microinit

.include "../../gomicro/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
