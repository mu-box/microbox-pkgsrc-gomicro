$NetBSD$

--- luvit.gyp.orig	2014-09-03 19:56:03.000000000 +0000
+++ luvit.gyp
@@ -214,7 +214,7 @@
               {
                 'destination': '<(luvit_prefix)/bin',
                 'files': [
-                  'out/Debug/luvit'
+                  'out/${BUILDTYPE}/luvit'
                 ]
               },
               {
