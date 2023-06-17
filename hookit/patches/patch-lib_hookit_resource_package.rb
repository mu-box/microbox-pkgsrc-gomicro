$NetBSD$

--- lib/hookit/resource/package.rb.orig	2016-08-30 21:40:10.290892390 +0000
+++ lib/hookit/resource/package.rb
@@ -46,11 +46,9 @@ module Hookit
       def pkgin
         case scope
         when :default
-          "/opt/local/bin/pkgin"
-        when :gomicro
-          "/opt/gomicro/bin/pkgin"
-        when :gomicro
           "/opt/gomicro/bin/pkgin"
+        when :microbox
+          "/data/bin/pkgin"
         end
       end

