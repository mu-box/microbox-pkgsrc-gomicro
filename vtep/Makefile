# $NetBSD: Makefile,v 1.3 2013/03/06 17:32:08 gdt Exp $
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

DISTNAME=       	vtep-${VERSION}
VERSION?=		0.0.2
PG_VISIBILITY=		public
# PKGREVISION?=		1
CATEGORIES=		devel
MASTER_SITES=		https://bitbucket.org/nanobox/vtep

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://bitbucket.org/nanobox/vtep
COMMENT=		vtep cli
# LICENSE=		

GIT_REPOSITORIES=	vtep
GIT_REPO.vtep=		git@bitbucket.org:nanobox/vtep.git
GIT_TAG=		v${VERSION}

GNU_CONFIGURE=		yes

USE_TOOLS+=		gmake aclocal autoconf automake
USE_LIBTOOL=		yes
AUTO_MKDIRS=		yes

WRKSRC=			${WRKDIR}/vtep

pre-configure:
	cd $(WRKSRC) && autoreconf -vfi

.include "../../gonano/libbframe/buildlink3.mk"
.include "../../gonano/libmsgxchng/buildlink3.mk"
.include "../../devel/libuv/buildlink3.mk"
.include "../../devel/msgpack/buildlink3.mk"
.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
