# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

.if !defined(RUBY_APP_MK)
RUBY_APP_MK=		#defined
USE_LANGUAGES=		c c++

RUBY_VERSION_SUPPORTED=	22
RUBY_VERSION_REQD=	22

.include "../../lang/ruby/rubyversion.mk"

pre-install: remove-git

do-build:
	cd ${WRKSRC} && bundle22 install --standalone --path vendor/bundle

do-install:
	${CP} -r ${WRKSRC} ${DESTDIR}${PREFIX}
	${MKDIR} ${DESTDIR}${PREFIX}/bin
	for i in ${RUBY_APP_BINS}; \
	do \
		sed "s|@PREFIX@|${PREFIX}|g;s|@PKGBASE@|${PKGBASE:S/pb-//}|g;s|@RUBY_APP_BIN@|$$i|g" ${PKGSRCDIR}/gonano/ruby/files/ruby-binstub > ${DESTDIR}${PREFIX}/bin/$$i; \
		chmod +x ${DESTDIR}${PREFIX}/bin/$$i; \
	done;

remove-git:
	cd ${WRKSRC} && ${RM} -rf .git*

# DEPENDS+=  ${RUBY_PKGPREFIX}-rubygems>=2.0.10:../../misc/rubygems
BUILD_DEPENDS+=  ${RUBY_PKGPREFIX}-bundler>=1.3.5:../../misc/ruby-bundler

.include "../../lang/ruby/buildlink3.mk"

.endif