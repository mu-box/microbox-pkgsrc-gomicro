# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		nanobox-cli-${VERSION}
VERSION?=		0.10.1
# PKGREVISION?=		1
CATEGORIES=		gonano
MASTER_SITES=		github.com/pagodabox/nanobox-cli

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/pagodabox/nanobox-cli
COMMENT=		CLI to interact with nanobox
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/nanobox-cli

USE_LANGUAGES=		c # none

GIT_REPOSITORIES=	nanobox-cli
GIT_REPO.nanobox-cli=	git@github.com:pagodabox/nanobox-cli.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		github.com
GO_USER=		pagodabox
GO_PROJECT=		nanobox-cli

post-install:
	mv ${DESTDIR}${PREFIX}/bin/nanobox-cli ${DESTDIR}${PREFIX}/bin/nanobox

.include "../../gonano/git/git-package.mk"
.include "../../gonano/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"

