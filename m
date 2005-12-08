From: Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 08 Dec 2005 14:52:34 +0000
Subject: 'devfd' fd leak in pppd
Message-Id: <439848B2.1050408@tls.msk.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020001000103080403060907"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------020001000103080403060907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

All recent versions of pppd have a filedescriptor leak -
pppd leaks a filedescriptor to the (serial/pty/whatever)
underlying device on each "redial".

The global `devfd' variable that holds this filedescriptor
is initialized to -1 at the start of the main loop, before
each redial.

The filedescriptor is opened in auth.c:link_required(),
calling the_channel->connect() routine.

Later, again in auth.c, in link_terminated() routine,
there's the following code:

    /*
     * Run disconnector script, if requested.
     * XXX we may not be able to do this if the line has hung up!
     */
    if (devfd >= 0 && the_channel->disconnect) {
        the_channel->disconnect();
        devfd = -1;
    }

For a tty device, there's a tty.c:disconnect_tty() used as
the_channel->disconnect; but it does not *close* any files.
For that, there's the_channel->close field.  Which is only
used in safe_fork() routine when running a child process...

Again, connect_tty() is used (from the_channel->connect())
to start new connection cycle, and that routine starts with

        pty_master = -1;
        pty_slave = -1;
        real_ttyfd = -1;

which, together with devfd = -1 assignment at the beginning
of the main loop effectively leaks the filedescriptor...

Should pppd call the_channel->close() routine in
auth.c:link_terminated(), at the same place where it calls
the_channel->disconnect() ?

Or should the_channel->disconnect() (disconnect_tty() etc)
call corresponding close() routine automagically?  (It seems
the former is better; but there are so many different small
functions out there...)

The attached patch goes the first route above, and it fixes
the problem for me.

Thanks.

/mjt

--------------020001000103080403060907
Content-Type: text/x-patch;
 name="ppp-2.4.3-devfdleak.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppp-2.4.3-devfdleak.patch"

--- auth.c.orig	2004-11-12 13:30:51.000000000 +0300
+++ auth.c	2005-12-08 17:50:44.000000000 +0300
@@ -638,8 +638,13 @@ link_terminated(unit)
      * Run disconnector script, if requested.
      * XXX we may not be able to do this if the line has hung up!
      */
-    if (devfd >= 0 && the_channel->disconnect) {
-	the_channel->disconnect();
+    if (devfd >= 0) {
+	if (the_channel->disconnect)
+	    the_channel->disconnect();
+	if (the_channel->close)
+	    the_channel->close();
+	else
+	    close(devfd);
 	devfd = -1;
     }
 

--------------020001000103080403060907--
