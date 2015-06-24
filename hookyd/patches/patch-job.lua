$NetBSD$

--- job.lua.orig	2015-06-17 15:07:00.000000000 +0000
+++ job.lua
@@ -21,12 +21,12 @@ Job.__index = Job
 -- storage of all running jobs
 local jobs = {}
 
-function Job.attach (hooky,hook,payload,cb)
+function Job.attach (hookit,hook,payload,cb)
   local self = jobs[hook]
   if not self then
     -- this is how objects are built in lua
     self = {
-	    hooky = hooky,
+	    hookit = hookit,
       hook = hook,
       payload = payload,
       listeners = Emitter:new()}
@@ -50,7 +50,7 @@ function Job.attach (hooky,hook,payload,
 end
 
 function Job:run()
-  local child = spawn(self.hooky, {self.hook,self.payload})
+  local child = spawn(self.hookit, {self.hook,self.payload})
   local response = {}
 
   -- eat up all chunks of the response
@@ -76,4 +76,4 @@ function Job:run()
 end
 
 
-return Job;
\ No newline at end of file
+return Job;
