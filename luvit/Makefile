# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

VERSION=		0.10.0
DISTNAME=		luvit-${VERSION}
# PKGREVISION=		1
CATEGORIES=		gomicro
MASTER_SITES=		https://github.com/luvit/luvit

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://github.com/luvit/luvit
COMMENT= 		luvit framework
#LICENSE=		# TODO: (see mk/license.mk)
REPO=			git@github.com:luvit/luvit.git

USE_TOOLS+=		gmake
USE_LANGUAGES+=		c c++
HAS_CONFIGURE=		yes
# BUILD_DIRS=		out
CONFIG_SHELL=		python
CONFIGURE_ARGS+=	--prefix=${DESTDIR}${PREFIX}
# CONFIGURE_ARGS+=	--arch=ia32
CONFIGURE_ARGS+=	--without-ssl
CONFIGURE_ARGS+=	--without-fat
ENVIRONMENT+=		PATH=/usr/local/sbin:/usr/local/bin:/opt/gomicro/sbin:/opt/gomicro/bin:/opt/gomicro/gcc49/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENVIRONMENT+=		LINK=g++
ENVIRONMENT+=		LDFLAGS="${LDFLAGS}"
ENVIRONMENT+=		CFLAGS="${CFLAGS}"

# MAKE_ENV+=		MH_NAME=ia32
# MAKE_ENV+=		CFLAGS=-m32 
# MAKE_ENV+=		DEBUG=0
# MAKE_ENV+=		LUAJIT_TARGET=LUAJIT_ARCH_X86

MAKE_JOBS_SAFE=		no

do-wrapper:
	@${DO_NADA}

.PHONY: pre-fetch git-clone git-checkout git-submodule-update cache-git
.if exists(${DISTDIR}/${DISTFILES})
pre-fetch:
.else
pre-fetch: cache-git
.endif

git-clone: 
	if [ ! -d ${WRKSRC} ]; then \
		git clone --recursive ${REPO} ${WRKSRC}; \
	fi

git-checkout: git-clone
	cd ${WRKSRC}; git checkout ${VERSION}

git-submodule-update: git-checkout
	cd ${WRKSRC}; git submodule update --init --recursive

cache-git: git-submodule-update
	if [ ! -f ${DISTDIR}/${DISTFILES} ]; then \
		tar -czf ${DISTDIR}/${DISTFILES} -C ${WRKDIR} ${DISTNAME}; \
	fi

do-configure:
	cd ${WRKSRC}; ${ENVIRONMENT} ${WRKSRC}/configure ${CONFIGURE_ARGS}

do-build:
	cd ${WRKSRC}; ${ENVIRONMENT} make -C out -j8 BUILDTYPE=Release

do-install:
	cd ${WRKSRC}; ${ENVIRONMENT} make -C out -j8 BUILDTYPE=Release install 

.include "../../mk/bsd.pkg.mk"