# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		nanoagent-mist-${VERSION}
VERSION?=		0.0.0
# PKGREVISION?=		1
CATEGORIES=		gonano
MASTER_SITES=		bitbucket.org/nanobox/na-mist

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		bitbucket.org/nanobox/na-mist
COMMENT=		takes json input it returns shell veriables
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/na-mist

USE_LANGUAGES=		# none

GIT_REPOSITORIES=	na-mist
GIT_REPO.na-mist=	git@bitbucket.org:nanobox/na-mist.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		bitbucket.org
GO_USER=		nanobox
GO_PROJECT=		na-mist

.include "../../gonano/git/git-package.mk"
.include "../../gonano/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"
