From: "Matthew N. Dodd" <mdodd@patton.com>
Date: Fri, 16 Jul 2004 16:22:30 +0000
Subject: RE: ppp MULTILINK issue / problem
Message-Id: <001e01c46b51$24916d50$67160a0a@ATLANTIC>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCBD226C.57C%tchen@on-go.com>
In-Reply-To: <BCBD226C.57C%tchen@on-go.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

linux-ppp-owner@vger.kernel.org wrote:
> Subject: ppp MULTILINK issue / problem
...
> now i am testing "UNBUNDLING" of the link.... if i unplug
> the one of the modem (not the master link), i do not see
> the IP traffic anymore, though i do see data on the serial
> link (i put a serial line monitor on the serial port),
> but no more IP packets coming out of PPP
...

I just ran into this and discovered that PPPIOCDISCONN is never being
called when pppd brings the link down.

This causes the MP fragmentation queue to stall.

Calling this IOCTL in sys-linux.c:generic_disestablish_ppp() fixes the
problem for me.

 void generic_disestablish_ppp(int dev_fd)
 {
     if (new_style_driver) {
+       if (ioctl(ppp_fd, PPPIOCDISCONN) < 0)
+           error("Couldn't detach from PPP unit %d: %m", ifunit);
        close(ppp_fd);
        ppp_fd = -1;
        if (demand) {

--
Matthew N. Dodd <mdodd@patton.com>
Software Engineer, Patton Electronics
7622 Rickenbacker Dr., Gaithersburg,  MD 20879
(301) 975-1000x184

