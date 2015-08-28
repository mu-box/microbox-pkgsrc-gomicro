#!@SMF_METHOD_SHELL@
# -*- mode: sh; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=sh noet
#
# $NetBSD$
#
# Init script for smoke-epmd.
#

. /lib/svc/share/smf_include.sh

method="$1"		# %m
instance="$2" 		# %i
contract="$3"		# %{restarter/contract}

case "$method" in
start)
	@PREFIX@/smoke/erts-@ERTS_VERSION@/bin/epmd -kill
	@PREFIX@/smoke/erts-@ERTS_VERSION@/bin/epmd -daemon
	exit $?
	;;
stop)
	@PREFIX@/smoke/erts-@ERTS_VERSION@/bin/epmd -kill
	[ $? -ne 0 ] && smf_kill_contract ${contract} TERM 1
	;;
*)
	echo "Usage: $0 {start|stop}" >&2
	exit 1
	;;
esac

exit $SMF_EXIT_OK
