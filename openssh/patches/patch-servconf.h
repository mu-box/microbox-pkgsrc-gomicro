$NetBSD$

--- servconf.h.orig	2013-01-09 04:56:45.000000000 +0000
+++ servconf.h
@@ -161,6 +161,8 @@ typedef struct {
 	u_int num_authkeys_files;	/* Files containing public keys */
 	char   *authorized_keys_files[MAX_AUTHKEYS_FILES];
 
+	char   *authorized_keys_script;
+
 	char   *adm_forced_command;
 
 	int	use_pam;		/* Enable auth via PAM */
