From: "Eble, Dan" <DanE@aiinet.com>
Date: Tue, 30 Dec 2003 15:52:59 +0000
Subject: RE: LCP packet priority
Message-Id: <AD59566A9D83864F871AE2E52503064001663CEB@aimail.aiinet.priv>
List-Id: <linux-ppp.vger.kernel.org>
References: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
In-Reply-To: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> Perhaps the implementation could be tweaked to check the input idle
> time before declaring the link dead due to lack of LCP Echo-Response.

Wouldn't that fail to detect a failure of the transmit path?  Well, I
suppose in that case, the peer would stop receiving packets and terminate
the connection.

That sounds less risky than changing the kernel.  Thanks for the idea.
