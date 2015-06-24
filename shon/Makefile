# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		shon-${VERSION}
VERSION?=		0.0.0
PKGREVISION?=		1
CATEGORIES=		gonano
MASTER_SITES=		github.com/pagodabox/shon

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/pagodabox/shon
COMMENT=		takes json input it returns shell veriables
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/shon

USE_LANGUAGES=		# none

GIT_REPOSITORIES=	shon
GIT_REPO.shon=	git@github.com:pagodabox/shon.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		github.com
GO_USER=		pagodabox
GO_PROJECT=		shon

.include "../../gonano/git/git-package.mk"
.include "../../gonano/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"

