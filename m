From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:44 +0000
Subject: [patch 04/14] chat(8): document the TIMEOUT directive
Message-Id: <20070819014009.117263737@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

--- ppp-2.4.4.orig/chat/chat.8	2006-12-16 12:56:11.000000000 +0100
+++ ppp-2.4.4/chat/chat.8	2006-12-16 13:49:44.000000000 +0100
@@ -35,7 +35,8 @@
 is not received within the time limit then the reply string is not
 sent. An alternate reply may be sent or the script will fail if there
 is no alternate reply string. A failed script will cause the
-\fIchat\fR program to terminate with a non-zero error code.
+\fIchat\fR program to terminate with a non-zero error code. You can
+also use the TIMEOUT string in order to specify the timeout.
 .TP
 .B \-r \fI<report file>
 Set the file for output of the report strings. If you use the keyword
@@ -348,7 +349,7 @@
 .LP
 .SH TIMEOUT
 The initial timeout value is 45 seconds. This may be changed using the \fB\-t\fR
-parameter.
+parameter. You can also specify "TIMEOUT 0".
 .LP
 To change the timeout value for the next expect string, the following
 example may be used:

-- 
ciao,
Marco

