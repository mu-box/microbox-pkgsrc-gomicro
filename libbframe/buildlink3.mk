# $NetBSD: buildlink3.mk,v 1.35 2013/04/06 11:06:52 rodent Exp $

BUILDLINK_TREE+=  libbframe

.if !defined(LIBBFRAME_BUILDLINK3_MK)
LIBBFRAME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libbframe+= libbframe>=0.0.0
BUILDLINK_PKGSRCDIR.libbframe?= ../../gonano/libbframe

.endif # LIBBFRAME_BUILDLINK3_MK

BUILDLINK_TREE+=  -libbframe
