$NetBSD$

--- src/sv.c.orig	2014-08-10 18:22:34.000000000 +0000
+++ src/sv.c
@@ -1,6 +1,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
+#include <stdio.h>
 #include "str.h"
 #include "strerr.h"
 #include "error.h"
@@ -344,12 +345,14 @@ int main(int argc, char **argv) {
     if ((**service != '/') && (**service != '.') && **service &&
         ((*service)[str_len(*service) -1] != '/')) {
       if ((chdir(varservice) == -1) || (chdir(*service) == -1)) {
+        printf("1 check %s and %s\n", varservice, *service);
         fail("unable to change to service directory");
         *service =0;
       }
     }
     else
       if (chdir(*service) == -1) {
+	printf("2 check %s\n", *service);
         fail("unable to change to service directory");
         *service =0;
       }
@@ -366,12 +369,14 @@ int main(int argc, char **argv) {
         if (!*service) continue;
         if ((**service != '/') && (**service != '.')) {
           if ((chdir(varservice) == -1) || (chdir(*service) == -1)) {
+            printf("3 check %s and %s\n", varservice, *service);
             fail("unable to change to service directory");
             *service =0;
           }
         }
         else
           if (chdir(*service) == -1) {
+            printf("4 check %s\n", *service);
             fail("unable to change to service directory");
             *service =0;
           }
