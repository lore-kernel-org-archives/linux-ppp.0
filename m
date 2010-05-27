From: Alexey Mahotkin <squadette@gmail.com>
Date: Thu, 27 May 2010 18:21:35 +0000
Subject: [PATCH 2/6] Fix typos, add hints from Debian to README.pppoe
Message-Id: <1274984499-9633-2-git-send-email-squadette@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This patch is composed from:

1. Debian patch zzz_man_typos to fix some typos in man pages. By A. Costa.
(Closes Debian bugs: #301928, #302674)

2. Configuration hints (taken from Debian patch pppoe_readme)

3. Fix formatting reported by Peter Lyall Easthope
---
 README.pppoe |   13 ++++++++++++-
 chat/chat.8  |    8 ++++----
 pppd/pppd.8  |    7 ++++---
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/README.pppoe b/README.pppoe
index 5284e4d..90c9bd5 100644
--- a/README.pppoe
+++ b/README.pppoe
@@ -33,7 +33,7 @@ received from the PPPoE layer just as if the link was a serial line
 
 With this in mind, the goal of the implementation of PPPoE support in
 Linux is to allow users to simply specify that the device they intend
-to use for the PPP connection is an ethernet device (i.e. "eth0") and
+to use for the PPP connection is an ethernet device (e.g. "eth0") and
 the rest of the system should function as usual.
 
 2. Using PPPoE
@@ -91,3 +91,14 @@ The PPPoE plugin included in this package is a component of the
 Roaring Penguin PPPoE package, included in this package courtesy of
 Roaring Penguin Software. (http://www.roaringpenguin.com).
 
+5. Hints
+--------
+
+- For setting up the connection and debugging problems if it does not
+  work at once, the userspace PPPoE implementation is more useful, as
+  the kernel module does not help with access concentrator problems.
+
+- If your machine acts as a gateway for other machines, a line like 
+  iptables -A FORWARD -o ppp0 -p tcp -m tcp --tcp-flags SYN,RST SYN -j
+  TCPMSS --clamp-mss-to-pmtu in your firewall configuration and reading
+  the iptables man-page might help.
diff --git a/chat/chat.8 b/chat/chat.8
index b532292..1ed9df3 100644
--- a/chat/chat.8
+++ b/chat/chat.8
@@ -50,7 +50,7 @@ keyword. When echoing is enabled, all output from the modem is echoed
 to \fIstderr\fR.
 .TP
 .B \-E
-Enables environment variable substituion within chat scripts using the
+Enables environment variable substitution within chat scripts using the
 standard \fI$xxx\fR syntax.
 .TP
 .B \-v
@@ -77,7 +77,7 @@ SYSLOG.  The use of \-S will prevent both log messages from '\-v' and
 error messages from being sent to the SYSLOG.
 .TP
 .B \-T \fI<phone number>
-Pass in an arbitary string, usually a phone number, that will be
+Pass in an arbitrary string, usually a phone number, that will be
 substituted for the \\T substitution metacharacter in a send string.
 .TP
 .B \-U \fI<phone number 2>
@@ -204,7 +204,7 @@ terminal), standard error will normally be redirected to the file
 .LP
 \fBSAY\fR strings must be enclosed in single or double quotes. If
 carriage return and line feed are needed in the string to be output,
-you must explicitely add them to your string.
+you must explicitly add them to your string.
 .LP
 The SAY strings could be used to give progress messages in sections of
 the script where you want to have 'ECHO OFF' but still let the user
@@ -457,7 +457,7 @@ For example, the character DC1 (17) is shown as \^^Q.
 Environment variables are available within chat scripts, if  the \fI\-E\fR
 option was specified in the command line. The metacharacter \fI$\fR is used
 to introduce the name of the environment variable to substitute. If the
-substition fails, because the requested environment variable is not set,
+substitution fails, because the requested environment variable is not set,
 \fInothing\fR is replaced for the variable.
 .SH TERMINATION CODES
 The \fIchat\fR program will terminate with the following completion
diff --git a/pppd/pppd.8 b/pppd/pppd.8
index b7adc77..e75d2dd 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -331,7 +331,7 @@ When this is completed, pppd will commence passing data packets
 The \fIdemand\fR option implies the \fIpersist\fR option.  If this
 behaviour is not desired, use the \fInopersist\fR option after the
 \fIdemand\fR option.  The \fIidle\fR and \fIholdoff\fR
-options are also useful in conjuction with the \fIdemand\fR option.
+options are also useful in conjunction with the \fIdemand\fR option.
 .TP
 .B domain \fId
 Append the domain name \fId\fR to the local host name for authentication
@@ -937,7 +937,7 @@ pseudo-tty master/slave pair and use the slave as its terminal
 device.  The \fIscript\fR will be run in a child process with the
 pseudo-tty master as its standard input and output.  An explicit
 device name may not be given if this option is used.  (Note: if the
-\fIrecord\fR option is used in conjuction with the \fIpty\fR option,
+\fIrecord\fR option is used in conjunction with the \fIpty\fR option,
 the child process will have pipes on its standard input and output.)
 .TP
 .B receive\-all
@@ -1045,7 +1045,7 @@ in the pseudonym.
 .TP
 .B srp\-use\-pseudonym
 When operating as an EAP SRP\-SHA1 client, attempt to use the pseudonym
-stored in ~/.ppp_psuedonym first as the identity, and save in this
+stored in ~/.ppp_pseudonym first as the identity, and save in this
 file any pseudonym offered by the peer during authentication.
 .TP
 .B sync
@@ -1721,6 +1721,7 @@ links, used for matching links to bundles in multilink operation.  May
 be examined by external programs to obtain information about running
 pppd instances, the interfaces and devices they are using, IP address
 assignments, etc.
+.TP
 .B /etc/ppp/pap\-secrets
 Usernames, passwords and IP addresses for PAP authentication.  This
 file should be owned by root and not readable or writable by any other
-- 
1.6.2.5

