# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:mu-box/hookit.git

VERSION=		0.12.5
# PKGREVISION=		1
DISTNAME=		hookit-${VERSION}
CATEGORIES=		microbox
MASTER_SITES=		github.com/mu-box/hookit

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		github.com/mu-box/hookit
COMMENT= 		The core framework to provide hookit scripts with re-usable components.
#LICENSE=		# TODO: (see mk/license.mk)

GIT_REPOSITORIES=	hookit
GIT_REPO.hookit=	git@github.com:mu-box/hookit.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		master

WRKSRC=			${WRKDIR}/hookit

RUBY_APP_BINS=		hookit

.include "../../gomicro/ruby/ruby-app.mk"
.include "../../gomicro/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
