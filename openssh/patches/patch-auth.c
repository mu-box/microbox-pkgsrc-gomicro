$NetBSD$

--- auth.c.orig	2013-03-12 00:31:05.000000000 +0000
+++ auth.c
@@ -368,6 +368,15 @@ authorized_principals_file(struct passwd
 	return expand_authorized_keys(options.authorized_principals_file, pw);
 }
 
+char *
+authorized_keys_script(struct passwd *pw)
+{
+ if (options.authorized_keys_script)
+   return expand_authorized_keys(options.authorized_keys_script, pw);
+ else
+   return NULL;
+}
+
 /* return ok if key exists in sysfile or userfile */
 HostStatus
 check_key_in_hostfiles(struct passwd *pw, Key *key, const char *host,
@@ -385,7 +394,7 @@ check_key_in_hostfiles(struct passwd *pw
 		user_hostfile = tilde_expand_filename(userfile, pw->pw_uid);
 		if (options.strict_modes &&
 		    (stat(user_hostfile, &st) == 0) &&
-		    ((st.st_uid != 0 && st.st_uid != pw->pw_uid) ||
+		    ((st.st_uid != ROOTUID && st.st_uid != pw->pw_uid) ||
 		    (st.st_mode & 022) != 0)) {
 			logit("Authentication refused for %.100s: "
 			    "bad owner or modes for %.200s",
