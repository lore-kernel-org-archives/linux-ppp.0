From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:54 +0000
Subject: [patch 14/14] export $CALL_FILE to the link scripts
Message-Id: <20070819014010.151126674@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

--- a/pppd/options.c
+++ b/pppd/options.c
@@ -1449,6 +1449,7 @@ callfile(argv)
     if ((fname = (char *) malloc(l)) = NULL)
 	novm("call file name");
     slprintf(fname, l, "%s%s", _PATH_PEERFILES, arg);
+    script_setenv("CALL_FILE", arg, 0);
 
     ok = options_from_file(fname, 1, 1, 1);
 
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -1608,6 +1608,9 @@ the connection.
 .B LINKNAME
 The logical name of the link, set with the \fIlinkname\fR option.
 .TP
+.B CALL_FILE
+The value of the \fIcall\fR option.
+.TP
 .B DNS1
 If the peer supplies DNS server addresses, this variable is set to the
 first DNS server address supplied.

-- 
ciao,
Marco

