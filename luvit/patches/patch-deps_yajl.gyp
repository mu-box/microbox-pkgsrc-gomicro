$NetBSD$

--- deps/yajl.gyp.orig	2014-09-03 19:56:03.000000000 +0000
+++ deps/yajl.gyp
@@ -29,6 +29,11 @@
         'yajl/src',
         '<(SHARED_INTERMEDIATE_DIR)',
       ],
+      'conditions': [
+        ['OS=="solaris"', {
+          'cflags': [ '--std=c99' ]
+        }]
+      ]
     }, # end libyajl
   {
     'target_name': 'copy_headers',
