From: Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 04 Jun 2004 23:42:15 +0000
Subject: pppd-auth-hook.patch
Message-Id: <40C108D7.9050901@tls.msk.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The patch below fixes pppd segfault when using auth_hook that sets
options for the user (use-after-free problem).  The problem happens
because auth.c:set_allowed_addrs() saves `opts' argument for further
processing (in `extra_options' global variable), but the auth_hook
code frees this wordlist unconditionally.  This is how the problem
looks like:

....
Jun  5 02:17:03 gate pppd[30757]: rcvd [PAP AuthReq id=0x1 user="Pmjt" password=<hidden>]
Jun  5 02:17:03 gate pppd[30757]: pap_auth_hook addr2.168.1.200
Jun  5 02:17:03 gate pppd[30757]: pap_auth_hook opts=proxyarp
Jun  5 02:17:03 gate pppd[30757]: sent [PAP AuthAck id=0x1 ""]
Jun  5 02:17:03 gate pppd[30757]: PAP peer authentication succeeded for Pmjt
Jun  5 02:17:03 gate pppd[30757]: In secrets file: unrecognized option ''
Jun  5 02:17:03 gate pppd[30757]: Fatal signal 11
Jun  5 02:17:03 gate pppd[30757]: Exit.

The "In secrets file:.." is printed in options.c:options_from_list(),
when called to process extra_options from auth.c (which now points to
already freed memory).

The patch makes auth_hook code path with set_allowed_addresses()
consistent with other usages of this routine in auth.c.

Note this bug is very old, and funny enouth, gcc-2.95 compiles
the code in a way so it "just works" (I use auth_hook for ages
but only noticied the problem now with 2.4.2; and the code did
not change for quite some time).

/mjt

--- pppd/auth.c.orig	Mon Jun 23 18:12:04 2003
+++ pppd/auth.c	Sat Jun  5 03:11:36 2004
@@ -1251,14 +1251,14 @@
      if (pap_auth_hook) {
  	ret = (*pap_auth_hook)(user, passwd, msg, &addrs, &opts);
  	if (ret >= 0) {
+	    /* note: set_allowed_addrs() saves opts (but not addrs): don't free it! */
  	    if (ret)
  		set_allowed_addrs(unit, addrs, opts);
-	    BZERO(passwd, sizeof(passwd));
+	    else if (opts != 0)
+		free_wordlist(opts);
  	    if (addrs != 0)
  		free_wordlist(addrs);
-	    if (opts != 0) {
-		free_wordlist(opts);
-	    }
+	    BZERO(passwd, sizeof(passwd));
  	    return ret? UPAP_AUTHACK: UPAP_AUTHNAK;
  	}
      }
