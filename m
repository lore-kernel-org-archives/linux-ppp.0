From: "Philip Ross" <psr@warwickcompsoc.co.uk>
Date: Sun, 29 Feb 2004 19:43:20 +0000
Subject: PPP 2.4.2 not logging username
Message-Id: <c1tfco$9hd$1@sea.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am using PPP 2.4.2 with Poptop (MSCHAP-v2 + MPPE-128) and I am finding
that the username only gets logged when authentication fails.  Unless I
switch on debug logging and look for the CHAP Response packet, there is no
way of seeing who has logged in successfully.  Is it possible to get pppd to
log the username for all authentication attempts instead of just for failed
ones (I'm fairly certain it used to do this in previous 2.4.2 betas)?

Thanks,

Phil


A successful login:

Feb 29 19:25:59 hal pptpd[17210]: CTRL: Client aaa.bbb.ccc.ddd control
connection started
Feb 29 19:26:01 hal pptpd[17210]: CTRL: Starting call (launching pppd,
opening GRE)
Feb 29 19:26:01 hal pppd[17211]: pppd 2.4.2 started by root, uid 0
Feb 29 19:26:01 hal pppd[17211]: Using interface ppp2
Feb 29 19:26:01 hal pppd[17211]: Connect: ppp2 <--> /dev/pts/3
Feb 29 19:26:01 hal pptpd[17210]: GRE: Discarding duplicate packet
Feb 29 19:26:03 hal pptpd[17210]: CTRL: Ignored a SET LINK INFO packet with
real ACCMs!
Feb 29 19:26:03 hal pppd[17211]: MPPE 128-bit stateless compression enabled
Feb 29 19:26:06 hal pppd[17211]: local  IP address aaa.bbb.ccc.ddd
Feb 29 19:26:06 hal pppd[17211]: remote IP address aaa.bbb.ccc.ddd


A failed login with username (myuser) logged.

Feb 29 19:26:34 hal pptpd[17227]: CTRL: Client aaa.bbb.ccc.ddd control
connection started
Feb 29 19:26:34 hal pptpd[17227]: CTRL: Starting call (launching pppd,
opening GRE)
Feb 29 19:26:34 hal pppd[17228]: pppd 2.4.2 started by root, uid 0
Feb 29 19:26:34 hal pppd[17228]: Using interface ppp2
Feb 29 19:26:34 hal pppd[17228]: Connect: ppp2 <--> /dev/pts/3
Feb 29 19:26:34 hal pptpd[17227]: GRE: Discarding duplicate packet
Feb 29 19:26:37 hal pptpd[17227]: CTRL: Ignored a SET LINK INFO packet with
real ACCMs!
Feb 29 19:26:37 hal pppd[17228]: Peer myuser failed CHAP authentication
Feb 29 19:26:37 hal pppd[17228]: Connection terminated.
Feb 29 19:26:37 hal pppd[17228]: Exit.



