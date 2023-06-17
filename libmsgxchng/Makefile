# $NetBSD: Makefile,v 1.3 2013/03/06 17:32:08 gdt Exp $
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

DISTNAME=       	libmsgxchng-${VERSION}
VERSION?=		0.0.0
PG_VISIBILITY=		public
# PKGREVISION?=		1
CATEGORIES=		devel
MASTER_SITES=		https://bitbucket.org/pagodabox-msgxchng/msgxchng-c

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://bitbucket.org/pagodabox-msgxchng/msgxchng-c
COMMENT=		library for exchanging messages and responses
LICENSE=		mit AND 2-clause-bsd AND isc AND modified-bsd

GIT_REPOSITORIES=	libmsgxchng
GIT_REPO.libmsgxchng=	git@bitbucket.org:pagodabox-msgxchng/msgxchng-c.git
GIT_TAG=		develop

GNU_CONFIGURE=		yes

USE_TOOLS+=		gmake aclocal autoconf automake
USE_LIBTOOL=		yes
AUTO_MKDIRS=		yes

WRKSRC=			${WRKDIR}/libmsgxchng

pre-configure:
	cd $(WRKSRC) && autoreconf -vfi

.include "../../gomicro/git/git-package.mk"
.include "../../devel/msgpack/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
