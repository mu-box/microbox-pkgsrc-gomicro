# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

VERSION=		1.0.2
# PKGREVISION=		1
DISTNAME=		mustache-${VERSION}
CATEGORIES=		microbox
MASTER_SITES=		github.com/mustache/mustache

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		github.com/mustache/mustache
COMMENT= 		Mustache is a framework-agnostic way to render logic-free views.
LICENSE=		mit

GIT_REPOSITORIES=	mustache
GIT_REPO.mustache=	git@github.com:mustache/mustache.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		bugfix/syntax

WRKSRC=			${WRKDIR}/mustache

RUBY_APP_BINS=		mustache

.include "../../gomicro/ruby/ruby-app.mk"
.include "../../gomicro/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
