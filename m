From: "Eble, Dan" <DanE@aiinet.com>
Date: Tue, 30 Dec 2003 15:37:48 +0000
Subject: LCP packet priority
Message-Id: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

We are using PPPD 2.4.1 and kernel 2.4.21-pre4 (PowerPC).  When we try to
pass more traffic through a link than it can handle, the link goes down.
For now, I am presuming that LCP echo requests or responses are being
dropped, causing the daemon to give up.  (I figured I would ask here first
and investigate more later, since it sometimes takes a while to receive a
response.)

Given a choice, I'd rather have the driver drop network protocol packets
than control packets.  I scanned ppp_generic.c and I did not notice any
priority treatment of LCP packets.  Did I overlook it, or is it not
implemented?

Please copy responses to me, as I am not subscribed to the list.
Thank you for your time.

-- 
Dan Eble <dane@aiinet.com>  _____  .
                           |  _  |/|
Applied Innovation Inc.    | |_| | |    "All Protocols MUST be odd"
http://www.aiinet.com/     |__/|_|_|      -- RFC 1661 (PPP)
