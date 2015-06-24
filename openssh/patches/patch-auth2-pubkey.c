$NetBSD$

--- auth2-pubkey.c.orig	2013-02-14 23:28:56.000000000 +0000
+++ auth2-pubkey.c
@@ -428,6 +428,116 @@ user_cert_trusted_ca(struct passwd *pw,
 	return ret;
 }
 
+/* check to see if the script specified by file can authorize the key
+ *
+ * the script will have the key written to STDIN, which is identical
+ * to the normal public key format.
+ *
+ * the script must exit with either 0 for success or 1 for failure.
+ * the script can print login options (if any) to STDOUT. No whitepace should be added
+ * to the output.
+ *
+ * Use with caution: the script can hang sshd. It is recommended you code the script
+ * with a timeout set if it cannot determine authenication quickly.
+ */
+static int
+user_key_found_by_script(struct passwd *pw, Key *key, char *file)
+{
+ pid_t pid;
+ char line[SSH_MAX_PUBKEY_BYTES];
+ int pipe_in[2];
+ int pipe_out[2];
+ int pipe_err[2];
+ int exit_code = 1;
+ int success = 0;
+ FILE *f;
+ //mysig_t oldsig;
+ 
+ pipe(pipe_in);
+ pipe(pipe_out);
+ pipe(pipe_err);
+ //oldsig = signal(SIGCHLD, SIG_IGN);
+ temporarily_use_uid(pw);
+ debug("user_key_found_by_script: executing %s", file);
+ switch ((pid = fork())) {
+ case -1:
+   error("fork(): %s", strerror(errno));
+   restore_uid();
+   return (-1);
+ case 0:
+   /* setup input pipe */
+   close(pipe_in[1]);
+   dup2(pipe_in[0], 0);
+   close(pipe_in[0]);
+
+   /* setup output pipe */
+   close(pipe_out[0]);
+   dup2(pipe_out[1], 1);
+   close(pipe_out[1]);
+
+	 /* setup error pipe */
+   close(pipe_err[0]);
+   dup2(pipe_err[1], 2);
+   close(pipe_err[1]);
+   
+   execl(file, file, NULL);
+
+   /* exec failed */
+   error("execl(): %s", strerror(errno));
+   _exit(1);
+ default:
+   debug("user_key_found_by_script: script pid %d", pid);
+
+
+   close(pipe_in[0]);
+   close(pipe_out[1]);
+   close(pipe_err[1]);
+
+   f = fdopen(pipe_in[1], "w");
+   fprintf(f, "%s\n", pw->pw_name);
+   key_write(key, f);
+   fclose(f);
+
+   while(waitpid(pid, &exit_code, 0) < 0) {
+     switch(errno) {
+     case EINTR:
+       debug3("user_key_found_by_script: waitpid() EINTR, continuing");
+       continue;
+     default:
+       error("waitpid(): %s", strerror(errno));
+       goto waitpid_error;
+     }
+   }
+   if (WIFEXITED(exit_code) && WEXITSTATUS(exit_code) == 0) {
+     int amt_read = read(pipe_out[0], line, sizeof(line) - 1);
+     line[amt_read] = ' ';
+     line[amt_read + 1] = 0;
+     debug("user_key_found_by_script: options: %s", line);
+     if (auth_parse_options(pw, line, file, 0) == 1)
+       success = 1;
+   }
+	else {
+		debug("user_key_found_by_script: exit_code: %d", exit_code);
+    int amt_read = read(pipe_out[0], line, sizeof(line) - 1);
+    line[amt_read] = ' ';
+    line[amt_read + 1] = 0;
+    debug("user_key_found_by_script: stdout: %s", line);
+    amt_read = read(pipe_err[0], line, sizeof(line) - 1);
+    line[amt_read] = ' ';
+    line[amt_read + 1] = 0;
+    debug("user_key_found_by_script: stderr: %s", line);
+	}
+  waitpid_error:
+   close(pipe_out[0]);
+   close(pipe_err[0]);
+ }
+
+ restore_uid();
+ //signal(SIGCHLD, oldsig);
+ 
+ return success;
+}
+
 /*
  * Checks whether key is allowed in file.
  * returns 1 if the key is allowed or 0 otherwise.
@@ -621,6 +731,15 @@ user_key_allowed(struct passwd *pw, Key
 	if (success > 0)
 		return success;
 
+	debug("try the script");
+  if ((file = authorized_keys_script(pw))) {
+		debug("file has been found");
+    success = user_key_found_by_script(pw, key, file);
+    xfree(file);
+	}
+	if (success)
+		return success;
+
 	for (i = 0; !success && i < options.num_authkeys_files; i++) {
 
 		if (strcasecmp(options.authorized_keys_files[i], "none") == 0)
