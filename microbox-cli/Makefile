# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		microbox-cli-${VERSION}
VERSION?=		0.10.1
# PKGREVISION?=		1
CATEGORIES=		gomicro
MASTER_SITES=		github.com/mu-box/microbox-cli

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/mu-box/microbox-cli
COMMENT=		CLI to interact with microbox
#LICENSE=       	# TODO: (see mk/license.mk)

WRKSRC=			${WRKDIR}/microbox-cli

USE_LANGUAGES=		c # none

GIT_REPOSITORIES=	microbox-cli
GIT_REPO.microbox-cli=	git@github.com:mu-box/microbox-cli.git
GIT_TAG=		master
# GIT_TAG=		${VERSION}

GO_DOMAIN=		github.com
GO_USER=		microbox
GO_PROJECT=		microbox-cli

post-install:
	mv ${DESTDIR}${PREFIX}/bin/microbox-cli ${DESTDIR}${PREFIX}/bin/microbox

.include "../../gomicro/git/git-package.mk"
.include "../../gomicro/go/go-app.mk"
.include "../../mk/bsd.pkg.mk"

