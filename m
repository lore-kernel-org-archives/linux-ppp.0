From: Alan Hourihane <alanh@fairlite.demon.co.uk>
Date: Mon, 24 May 2004 19:53:00 +0000
Subject: pppd passes plugin fd's onto child processes
Message-Id: <20040524195300.GL2149@fairlite.demon.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Trying to find out why my connection would never re-establish itself
and reported 'Address already in use' got me plugging into the pppd code.

I've found a problem with plugins that don't implement the close()
function.

When run_program() is called it tries to close the file descriptor down
with the code...

	if (the_channel->close)
		(*the_channel->close)();

The problem is, that certainly the pppoatm plugin and from what I can
tell the rp-pppoe plugin do not implement this and therefore the child
processes inherit these file descriptors.

The patch below does the simplest thing of closing the fd returned
by the connect() call, being devfd in pppd's main process.

This fixes the problem, so I thought I'd submit it here.

Hope this helps others,

Alan.

diff -ur ppp-2.4.2.old/pppd/main.c ppp-2.4.2/pppd/main.c
--- ppp-2.4.2.old/pppd/main.c	2004-01-13 04:00:34.000000000 +0000
+++ ppp-2.4.2/pppd/main.c	2004-05-24 19:05:34.000000000 +0100
@@ -1662,8 +1648,11 @@
 
     /* Ensure that nothing of our device environment is inherited. */
     closelog();
+    /* Some plugins dont have a close function, so just close the devfd */
     if (the_channel->close)
 	(*the_channel->close)();
+    else
+	close(devfd);
 
     /* Don't pass handles to the PPP device, even by accident. */
     dup2(fd_devnull, 0);


