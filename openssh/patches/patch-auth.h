$NetBSD$

--- auth.h.orig	2012-12-02 22:53:20.000000000 +0000
+++ auth.h
@@ -176,6 +176,7 @@ int	allowed_user(struct passwd *);
 struct passwd * getpwnamallow(const char *user);
 
 char	*get_challenge(Authctxt *);
+char *authorized_keys_script(struct passwd *);
 int	verify_response(Authctxt *, const char *);
 void	abandon_challenge_response(Authctxt *);
 
