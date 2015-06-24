# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

VERSION=		0.1.0
# PKGREVISION=		1
DISTNAME=		narc-${VERSION}
CATEGORIES=		pagodabox
MASTER_SITES=		https://bitbucket.org/pagodabox-logvac/narc

MAINTAINER=		tyler@pagodabox.com
HOMEPAGE=		https://bitbucket.org/pagodabox-logvac/narc
COMMENT=		Watches log files for logvac
LICENSE=		cddl-1.0

USE_LANGUAGES=		c c++
USE_TOOLS=		gmake pax perl aclocal autoconf automake

GNU_CONFIGURE=		yes

DEPENDS+=  		libuv>=20130301:../../devel/libuv
BUILDLINK_TREE+=	libuv

.if !defined(LIBUV_BUILDLINK3_MK)
LIBUV_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libuv+=	libuv>=20130301
BUILDLINK_ABI_DEPENDS.libuv+=	libuv>=20130301
BUILDLINK_PKGSRCDIR.libuv?=	../../devel/libuv
.endif # LIBUV_BUILDLINK3_MK

BUILDLINK_TREE+=	-libuv


GIT_REPOSITORIES=	narc
GIT_REPO.narc=		git@bitbucket.org:pagodabox-logvac/narc.git
GIT_TAG=		v${VERSION}
# GIT_TAG=		master

EGDIR=			${PREFIX}/share/examples/${PKGBASE}
INSTALLATION_DIRS+=	bin ${EGDIR}
PKG_SYSCONFSUBDIR=	narc
CONF_FILES+=		${EGDIR}/narc.conf.example ${PKG_SYSCONFDIR}/narc.conf

BUILD_DEFS+=		VARBASE NARC_USER NARC_GROUP NARC_DATADIR
BUILD_DEFS+=		NARC_LOGDIR NARC_PIDDIR

NARC_USER?=		root
NARC_GROUP?=		${NARC_USER}
NARC_DATADIR?=		${VARBASE}/db/narc
NARC_LOGDIR?=		${VARBASE}/log/narc
NARC_PIDDIR?=		${VARBASE}/run

OWN_DIRS+=		${NARC_DATADIR} ${NARC_LOGDIR}
OWN_DIRS_PERMS+=	${NARC_DATADIR} ${NARC_USER} ${NARC_GROUP} 0770
OWN_DIRS_PERMS+=	${NARC_LOGDIR} ${NARC_USER} ${NARC_GROUP} 0770

FILES_SUBST+=		NARC_USER=${NARC_USER}
FILES_SUBST+=		NARC_GROUP=${NARC_GROUP}
FILES_SUBST+=		NARC_DATADIR=${NARC_DATADIR}

SUBST_CLASSES+=			fix-paths
SUBST_STAGE.fix-paths=		post-patch
SUBST_MESSAGE.fix-paths=	Fixing paths.
SUBST_FILES.fix-paths=		narc.conf
SUBST_VARS.fix-paths=		NARC_DATADIR NARC_LOGDIR NARC_PIDDIR

INSTALL_ENV+=		REPO=narc
INSTALL_ENV+=		PKG_VERSION=${PKGVERSION_NOREV}
INSTALL_ENV+=		OSNAME=${OPSYS}
INSTALL_ENV+=		ARCH=${MACHINE_ARCH}

WRKSRC=			${WRKDIR}/narc

pre-configure:
	cd $(WRKSRC) && autoreconf -vfi

post-install:
	${INSTALL_DATA} ${WRKSRC}/narc.conf ${DESTDIR}${EGDIR}/narc.conf.example

.include "../../gonano/git/git-package.mk"
.include "../../mk/bsd.pkg.mk"
