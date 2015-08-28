# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		repositorium-${VERSION}
VERSION?=		0.0.2
# PKGREVISION?=		1
CATEGORIES=		gonano
MASTER_SITES=		github.com/repositorium/repositorium

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/repositorium/repositorium
COMMENT=		repositorium
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/repositorium

USE_LANGUAGES=		# none

GIT_REPOSITORIES=	repositorium
GIT_REPO.repositorium=	git@github.com:repositorium/repositorium.git
# GIT_TAG=		master
GIT_TAG=		${VERSION}

GO_DOMAIN=		github.com
GO_USER=		repositorium
GO_PROJECT=		repositorium

.include "../../gonano/git/git-package.mk"
.include "../../gonano/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"
