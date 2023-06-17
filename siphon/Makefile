# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:mu-box/siphon.git

VERSION=		1.2.2
# PKGREVISION=		1
DISTNAME=		siphon-${VERSION}
CATEGORIES=		microbox
MASTER_SITES=		github.com/mu-box/siphon

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		github.com/mu-box/siphon
COMMENT= 		The core framework to provide siphon scripts with re-usable components.
#LICENSE=		# TODO: (see mk/license.mk)

USE_TOOLS+=		gmake aclocal autoconf automake

GNU_CONFIGURE=		yes

GIT_REPOSITORIES=	siphon
GIT_REPO.siphon=	git@github.com:mu-box/siphon.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		master

WRKSRC=			${WRKDIR}/siphon

pre-configure:
	cd ${WRKSRC}; autoreconf -vfi

.include "../../gomicro/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
