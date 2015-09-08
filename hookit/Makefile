# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
# git@github.com:pagodabox/hookit.git

VERSION=		0.10.0
# PKGREVISION=		1
DISTNAME=		hookit-${VERSION}
CATEGORIES=		nanobox
MASTER_SITES=		github.com/pagodabox/hookit

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		github.com/pagodabox/hookit
COMMENT= 		The core framework to provide hookit scripts with re-usable components.
#LICENSE=		# TODO: (see mk/license.mk)

GIT_REPOSITORIES=	hookit
GIT_REPO.hookit=	git@github.com:pagodabox/hookit.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		bugfix/syntax

WRKSRC=			${WRKDIR}/hookit

RUBY_APP_BINS=		hookit

.include "../../gonano/ruby/ruby-app.mk"
.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
