From: "Eble, Dan" <DanE@aiinet.com>
Date: Wed, 31 Dec 2003 16:12:05 +0000
Subject: RE: LCP packet priority
Message-Id: <AD59566A9D83864F871AE2E52503064001663CEE@aimail.aiinet.priv>
List-Id: <linux-ppp.vger.kernel.org>
References: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
In-Reply-To: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson wrote,
> On thinking about it more, I guess I do like the priority scheme.

Bill Unruh replied to me privately and pointed out some shortcomings of the
drivers I'm using: no flow control, and no link state monitoring (which is
why I am using LCP echo).

I am under some time constraints that make it difficult for me to make the
drivers work "the" right way, so I will have to make them work "a" right
way.  I just now modified the serial device driver to examine skb->priority
and reserve a few slots in its transmit ring for TC_PRIO_CONTROL packets.
This is a very comfortable 5-line change.

I have also added a line to ppp_write() to set skb->priority to
TC_PRIO_CONTROL unconditionally.  This appears to work--the daemon no longer
croaks when I run 3 flood pings across the link--but I would like to know if
any kind of packets other than control packets can pass through ppp_write().
Does this change hand out a high priority too liberally?

Thanks.
-- 
Dan Eble <dane@aiinet.com>  _____  .
                           |  _  |/|
Applied Innovation Inc.    | |_| | |    "All Protocols MUST be odd"
http://www.aiinet.com/     |__/|_|_|      -- RFC 1661 (PPP)
