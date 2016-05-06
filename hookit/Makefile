# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:nanopack/hookit.git

VERSION=		0.12.2
# PKGREVISION=		1
DISTNAME=		hookit-${VERSION}
CATEGORIES=		nanobox
MASTER_SITES=		github.com/nanopack/hookit

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		github.com/nanopack/hookit
COMMENT= 		The core framework to provide hookit scripts with re-usable components.
#LICENSE=		# TODO: (see mk/license.mk)

GIT_REPOSITORIES=	hookit
GIT_REPO.hookit=	git@github.com:nanopack/hookit.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		master

WRKSRC=			${WRKDIR}/hookit

RUBY_APP_BINS=		hookit

.include "../../gonano/ruby/ruby-app.mk"
.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
