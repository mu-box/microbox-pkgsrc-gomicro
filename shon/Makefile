# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		shon-${VERSION}
VERSION?=		0.0.0
PKGREVISION?=		2
CATEGORIES=		gomicro
MASTER_SITES=		github.com/mu-box/shon

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/mu-box/shon
COMMENT=		takes json input it returns shell veriables
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/shon

USE_LANGUAGES=		# none

GIT_REPOSITORIES=	shon
GIT_REPO.shon=	git@github.com:mu-box/shon.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		github.com
GO_USER=		microbox
GO_PROJECT=		shon

.include "../../gomicro/git/git-package.mk"
.include "../../gomicro/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"

