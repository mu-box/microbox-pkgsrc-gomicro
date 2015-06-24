$NetBSD$

--- servconf.c.orig	2013-02-12 00:02:08.000000000 +0000
+++ servconf.c
@@ -127,6 +127,7 @@ initialize_server_options(ServerOptions
 	options->max_startups = -1;
 	options->max_authtries = -1;
 	options->max_sessions = -1;
+	options->authorized_keys_script = NULL;
 	options->banner = NULL;
 	options->use_dns = -1;
 	options->client_alive_interval = -1;
@@ -308,6 +309,7 @@ typedef enum {
 	/* Portable-specific options */
 	sUsePAM,
 	/* Standard Options */
+	sAuthorizedKeysScript,
 	sPort, sHostKeyFile, sServerKeyBits, sLoginGraceTime, sKeyRegenerationTime,
 	sPermitRootLogin, sLogFacility, sLogLevel,
 	sRhostsRSAAuthentication, sRSAAuthentication,
@@ -419,6 +421,7 @@ static struct {
 	{ "xauthlocation", sXAuthLocation, SSHCFG_GLOBAL },
 	{ "strictmodes", sStrictModes, SSHCFG_GLOBAL },
 	{ "permitemptypasswords", sEmptyPasswd, SSHCFG_ALL },
+	{ "authorizedkeysscript", sAuthorizedKeysScript, SSHCFG_GLOBAL },
 	{ "permituserenvironment", sPermitUserEnvironment, SSHCFG_GLOBAL },
 	{ "uselogin", sUseLogin, SSHCFG_GLOBAL },
 	{ "compression", sCompression, SSHCFG_GLOBAL },
@@ -1363,6 +1366,9 @@ process_server_config_line(ServerOptions
 				*intptr = *intptr + 1;
 		}
 		break;
+	case sAuthorizedKeysScript:
+		charptr = &options->authorized_keys_script;
+		goto parse_filename;
 
 	case sClientAliveInterval:
 		intptr = &options->client_alive_interval;
@@ -1892,6 +1898,7 @@ dump_config(ServerOptions *o)
 			else
 				printf("listenaddress %s:%s\n", addr, port);
 		}
+	dump_cfg_string(sAuthorizedKeysScript, o->authorized_keys_script);
 	}
 
 	/* integer arguments */
