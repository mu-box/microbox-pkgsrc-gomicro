# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		microboxd-${VERSION}
VERSION?=		0.0.0
# PKGREVISION?=		1
CATEGORIES=		gomicro
MASTER_SITES=		bitbucket.org/microbox/microboxd

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		bitbucket.org/microbox/microboxd
COMMENT=		microboxd
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/microboxd

USE_LANGUAGES=		# none

GIT_REPOSITORIES=	microboxd
GIT_REPO.microboxd=	git@bitbucket.org:mubox/microboxd.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		bitbucket.org
GO_USER=		microbox
GO_PROJECT=		microboxd

.include "../../gomicro/git/git-package.mk"
.include "../../gomicro/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"
