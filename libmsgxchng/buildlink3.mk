# $NetBSD: buildlink3.mk,v 1.35 2013/04/06 11:06:52 rodent Exp $

BUILDLINK_TREE+=  libmsgxchng

.if !defined(LIBMSGXCHNG_BUILDLINK3_MK)
LIBMSGXCHNG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libmsgxchng+= libmsgxchng>=0.0.0
BUILDLINK_PKGSRCDIR.libmsgxchng?= ../../gonano/libmsgxchng

.endif # LIBMSGXCHNG_BUILDLINK3_MK

BUILDLINK_TREE+=  -libmsgxchng
