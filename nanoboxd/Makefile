# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		nanoboxd-${VERSION}
VERSION?=		0.0.0
# PKGREVISION?=		1
CATEGORIES=		gonano
MASTER_SITES=		bitbucket.org/nanobox/nanoboxd

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		bitbucket.org/nanobox/nanoboxd
COMMENT=		nanoboxd
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/nanoboxd

USE_LANGUAGES=		# none

GIT_REPOSITORIES=	nanoboxd
GIT_REPO.nanoboxd=	git@bitbucket.org:nanobox/nanoboxd.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		bitbucket.org
GO_USER=		nanobox
GO_PROJECT=		nanoboxd

.include "../../gonano/git/git-package.mk"
.include "../../gonano/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"
