# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet
DISTNAME=		consul-${VERSION}
VERSION?=		0.5.2
# PKGREVISION?=		1
CATEGORIES=		gomicro
MASTER_SITES=		github.com/hashicorp/consul

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		github.com/hashicorp/consul
COMMENT=		consul
LICENSE=       		MPL-2.0

BUILD_DEPENDS+=         go>=1.5:../../gomicro/go15
BUILD_DEPENDS+=		mercurial>=3.3.2:../../devel/mercurial
BUILD_DEPENDS+=		bzr>=2.5.1:../../devel/bzr
.if exists(../../gomicro/git/Makefile)
BUILD_DEPENDS+=         git>=2.5:../../gomicro/git
.else
.if exists(../../devel/git/Makefile)
BUILD_DEPENDS+=         git-base>=1.6.4:../../devel/git-base
.else
BUILD_DEPENDS+=         scmgit-base>=1.6.4:../../devel/scmgit-base
.endif
.endif	

USE_LANGUAGES=		c
USE_TOOLS+=		gmake

GIT_REPOSITORIES=	consul
GIT_REPO.consul=	git@github.com:hashicorp/consul.git
# GIT_TAG=		master
GIT_TAG=		v${VERSION}

GO_DOMAIN=		github.com
GO_USER=		hashicorp
GO_PROJECT=		consul
GOPATH=			${WRKDIR}/gocode

MAKE_ENV+=		GOPATH=${GOPATH}

WRKSRC=			${GOPATH}/src/${GO_DOMAIN}/${GO_USER}/${GO_PROJECT}

go-copy:
	@${MKDIR} -p ${GOPATH}/src/${GO_DOMAIN}/${GO_USER}
	@${CP} -r ${WRKDIR}/consul ${GOPATH}/src/${GO_DOMAIN}/${GO_USER}/${GO_PROJECT}

pre-build: go-copy

do-install:
	@${MKDIR} -p ${DESTDIR}${PREFIX}/bin
	@${CP} ${GOPATH}/src/${GO_DOMAIN}/${GO_USER}/${GO_PROJECT}/bin/consul ${DESTDIR}${PREFIX}/bin/consul

.include "../../gomicro/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
