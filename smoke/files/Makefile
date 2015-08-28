# $NetBSD$
# requires GNU make
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

DEST=$(DESTDIR)$(PREFIX)

package:
	$(BSD_INSTALL_PROGRAM_DIR) ${DEST}/sbin
	$(BSD_INSTALL_SCRIPT) ${SMOKE_PATH}/rel/smoke/bin/smoke ${DEST}/sbin/smoke
	sed "/APP_VERSION/s/=/=${VERSIONSTRING}/" ${SMOKE_PATH}/rel/smoke/lib/env.sh \
		> ${SMOKE_PATH}/rel/smoke/lib/env.sh.tmp
	mv ${SMOKE_PATH}/rel/smoke/lib/env.sh.tmp ${SMOKE_PATH}/rel/smoke/lib/env.sh
	$(BSD_INSTALL_DATA_DIR) ${DEST}/share/examples/smoke
	$(BSD_INSTALL_DATA) ${SMOKE_PATH}/rel/smoke/etc/smoke.conf ${DEST}/share/examples/smoke
	$(BSD_INSTALL_PROGRAM_DIR) ${DEST}/smoke
	cp -Rp ${SMOKE_PATH}/rel/smoke/erts* ${DEST}/smoke
	cp -Rp ${SMOKE_PATH}/rel/smoke/lib ${DEST}/smoke
	cp -Rp ${SMOKE_PATH}/rel/smoke/releases ${DEST}/smoke
