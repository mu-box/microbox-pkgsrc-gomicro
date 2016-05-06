# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:nanopack/siphon.git

VERSION=		1.2.2
# PKGREVISION=		1
DISTNAME=		siphon-${VERSION}
CATEGORIES=		nanobox
MASTER_SITES=		github.com/nanopack/siphon

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		github.com/nanopack/siphon
COMMENT= 		The core framework to provide siphon scripts with re-usable components.
#LICENSE=		# TODO: (see mk/license.mk)

USE_TOOLS+=		gmake aclocal autoconf automake

GNU_CONFIGURE=		yes

GIT_REPOSITORIES=	siphon
GIT_REPO.siphon=	git@github.com:nanopack/siphon.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		master

WRKSRC=			${WRKDIR}/siphon

pre-configure:
	cd ${WRKSRC}; autoreconf -vfi

.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
