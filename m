From: Charlie Brady <charlieb-linux-ppp@e-smith.com>
Date: Wed, 22 Nov 2006 00:24:55 +0000
Subject: chap_passwd_hook() not used in server mode - why?
Message-Id: <Pine.LNX.4.64.0611211913060.15007@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


get_secret() in auth.c has this code:

...
     } else if (!am_server && chap_passwd_hook) {
         if ( (*chap_passwd_hook)(client, secbuf) < 0) {
             error("Unable to obtain CHAP password for %s on %s from plugin",
                   client, server);
             return 0;
         }
     } else {
...

I'm curious as to the reason for not enabling the hook to be used when 
pppd is running in server mode. When authenticating PPTP connections using 
MSCHAPv2, it would be useful to read NT hashes from smbpasswd or from 
ldap. The current hook structure doesn't facilitate that, however, and as 
a result, a number of plugin authors have duplicated large parts of 
chap_ms.c in their plugin's chap_verify function.

The only plugin I've found which implements a chap_passwd_hook function is 
passwordfd, and I doubt that that would ever be used in server mode.

Would anyone object to this patch?

--- ppp-2.4.4.orig/pppd/auth.c  2006-06-18 07:26:00.000000000 -0400
+++ ppp-2.4.4/pppd/auth.c       2006-11-21 19:12:25.000000000 -0500
@@ -1938,7 +1938,7 @@

      if (!am_server && passwd[0] != 0) {
         strlcpy(secbuf, passwd, sizeof(secbuf));
-    } else if (!am_server && chap_passwd_hook) {
+    } else if (chap_passwd_hook) {
         if ( (*chap_passwd_hook)(client, secbuf) < 0) {
             error("Unable to obtain CHAP password for %s on %s from plugin",
                   client, server);

