From: James Carlson <carlson@workingcode.com>
Date: Tue, 30 Dec 2003 15:46:11 +0000
Subject: Re: LCP packet priority
Message-Id: <16369.40387.466583.359357@h006008986325.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
In-Reply-To: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Eble, Dan writes:
> Given a choice, I'd rather have the driver drop network protocol packets
> than control packets.  I scanned ppp_generic.c and I did not notice any
> priority treatment of LCP packets.  Did I overlook it, or is it not
> implemented?

I don't think there's any such feature in the kernel, but this brings
up a more fundamental question: if you're receiving traffic from the
peer, should you be sending LCP Echo-Request or expecting replies at
all?  The whole point of that exercise is to detect peers that go dead
silently (e.g., when the DCD wire is broken or doesn't exist).  If
you're receiving traffic, then that's not the case.

Perhaps the implementation could be tweaked to check the input idle
time before declaring the link dead due to lack of LCP Echo-Response.

-- 
James Carlson                                  <carlson@workingcode.com>
