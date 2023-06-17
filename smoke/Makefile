# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

DISTNAME=		smoke-${VERSION}
VERSION?=		1.2.12
CATEGORIES=		microbox
MASTER_SITES=		https://bitbucket.org/pagodabox-stormpack/smoke

MAINTAINER=		andrew@pagodabox.com
HOMEPAGE=		https://bitbucket.org/pagodabox-stormpack/smoke
COMMENT=		smoke server
LICENSE=		cddl-1.0

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
USE_TOOLS=		gmake
USE_TOOLS+=		perl

GIT_REPOSITORIES=	smoke
GIT_REPO.smoke=		git@bitbucket.org:pagodabox-stormpack/smoke.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		master

MAKE_JOBS_SAFE=		no

.include "../../mk/bsd.prefs.mk"

.include "../../gomicro/erlang18/versions.mk"
.include "Makefile.versions"

BUILD_DEFS+=		VARBASE SMOKE_USER SMOKE_GROUP
BUILD_DEFS+=		SMOKE_DATA SMOKE_LOG

SMOKE_USER?=		smoke
SMOKE_GROUP?=		${SMOKE_USER}
SMOKE_DATA?=		${VARBASE}/db/smoke
SMOKE_LOG?=		${VARBASE}/log/smoke

PKG_GROUPS+=			${SMOKE_GROUP}
PKG_USERS+=			${SMOKE_USER}:${SMOKE_GROUP}
PKG_HOME.${SMOKE_USER}=		${SMOKE_DATA}
PKG_GECOS.${SMOKE_USER}=	smoke daemon user

OWN_DIRS+=		${SMOKE_DATA} ${SMOKE_LOG}
OWN_DIRS_PERMS+=	${SMOKE_DATA} ${SMOKE_USER} ${SMOKE_GROUP} 0770
OWN_DIRS_PERMS+=	${SMOKE_LOG} ${SMOKE_USER} ${SMOKE_GROUP} 0770

PKG_SYSCONFSUBDIR=	smoke
CONF_FILES+=		share/examples/smoke/smoke.conf ${PKG_SYSCONFDIR}/smoke.conf

.if ${OPSYS} == SmartOS
RCD_SCRIPTS=		smoke smoke-epmd
SMF_USER=		${SMOKE_USER}
SMF_GROUP=		${SMOKE_GROUP}
SMF_HOME=		${SMOKE_DATA}
SMF_METHODS=		${RCD_SCRIPTS}
.endif

BUILD_TARGET=		rel

SUBST_CLASSES+=		pkgsrc
SUBST_STAGE.pkgsrc=	pre-build
SUBST_MESSAGE.pkgsrc=	Fixing pkgsrc locations and tools
SUBST_FILES.pkgsrc=	rel/vars.config
SUBST_VARS.pkgsrc=	PREFIX PKG_SYSCONFDIR PKGVERSION_NOREV
SUBST_VARS.pkgsrc+=	SMOKE_USER SMOKE_DATA SMOKE_LOG

REPLACE_INTERPRETER+=	escript
REPLACE.escript.old=	.*escript
REPLACE.escript.new=	${BUILDLINK_PREFIX.erlang}/bin/escript
REPLACE_FILES.escript=	rel/files/nodetool

FILES_SUBST+=		ERTS_VERSION=${VERSION.erts}
FILES_SUBST+=		SMF_USER=${SMF_USER:Q}
FILES_SUBST+=		SMF_GROUP=${SMF_GROUP:Q}
FILES_SUBST+=		SMF_HOME=${SMF_HOME:Q}

CHECK_INTERPRETER_SKIP=	smoke/erts-${VERSION.erts}/bin/nodetool

MAKE_ENV+=		PATCH=${PATCH:Q}

INSTALL_ENV+=		REPO=smoke
INSTALL_ENV+=		PKG_VERSION=${PKGVERSION_NOREV}
INSTALL_ENV+=		OSNAME=${OPSYS}
INSTALL_ENV+=		ARCH=${MACHINE_ARCH}

WRKSRC=			${WRKDIR}/smoke

post-extract:
	cd ${WRKSRC} && \
		git apply ${FILESDIR}/patch-rel__vars.config
	cd ${WRKSRC} && ${RM} -rf deps

do-install:
	${MKDIR} ${WRKSRC}/rel/pkgsrc
	${INSTALL_DATA} ${FILESDIR}/Makefile ${WRKSRC}/rel/pkgsrc
	cd ${WRKSRC}/rel/pkgsrc && \
		${SETENV} ${INSTALL_ENV} ${MAKE_ENV} \
		SMOKE_PATH=${WRKSRC} VERSION_STRING=${PKGVESION_NOREV} \
			${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS}

.include "../../devel/ncurses/buildlink3.mk"
BUILDLINK_DEPMETHOD.erlang=	build
.include "../../gomicro/erlang18/buildlink3.mk"
.include "../../gomicro/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
