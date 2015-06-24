$NetBSD$

--- hookyd.lua.orig	2015-06-17 15:07:00.000000000 +0000
+++ hookyd.lua
@@ -78,9 +78,9 @@ function run_hook(req,res)
     last_job = {code = 0, hook = '', body = ''}
 
     -- attach to a job
-    Job.attach(lever.user.hooky,req.env.hook_id,payload,function(code,body)
+    Job.attach(lever.user.hookit,req.env.hook_id,payload,function(code,body)
 
-      -- check if the hooky script ran out of memory
+      -- check if the hookit script ran out of memory
       if str.match(body, 'ENOMEM') or str.match(body, 'out of memory') then
         code = 3
       end
@@ -156,13 +156,13 @@ lever:add_middleware(logger)
 function validate(config)
   local passed = true
 
-  if not config.hooky then
-    print("'hooky' parameter is missing in config file")
+  if not config.hookit then
+    print("'hookit' parameter is missing in config file")
     passed = false
   end
 
-  if not config.hook_dir then
-    print("'hooky_dir' parameter is missing in config file")
+  if not config.hookit_dir then
+    print("'hookit_dir' parameter is missing in config file")
     passed = false
   end
 
@@ -174,7 +174,7 @@ function validate(config)
   return passed
 end
 
-fs.readFile("/opt/local/etc/hookyd/hookyd.conf",function(err,data)
+fs.readFile("/opt/gonano/etc/hookyd/hookyd.conf",function(err,data)
   if not err then
     lever.user = JSON.parse(data)
 
@@ -190,4 +190,4 @@ fs.readFile("/opt/local/etc/hookyd/hooky
   else
     p("unable to read config file",err)
   end
-end)
\ No newline at end of file
+end)
