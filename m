From: James Carlson <carlson@workingcode.com>
Date: Sun, 21 Mar 2004 18:44:24 +0000
Subject: Re: pppd 2.4.2b3 IPCP converge failure
Message-Id: <16477.57992.472356.143856@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1079855955.1133.48.camel@dell.tranquilitynj.net>
In-Reply-To: <1079855955.1133.48.camel@dell.tranquilitynj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Andy writes:
> Can anyone suggest what might have caused this to happen:
> 
> Mar 20 18:39:55 pppd[24048]: sent [IPCP ConfReq id=0xae <addrs
> 68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
> Mar 20 18:39:55 pppd[24048]: rcvd [IPCP ConfRej id=0xae <addrs
> 68.244.143.67 0.0.0.0>]

You've cut off the important part of this log -- the one where the
peers had initial trouble negotiating IPCP.  You'll need to get that
part of the log and examine it.

> I'm wondering about the ConfReq packets, what is the second address
> field doing there (as in addrs 68.244.143.67 0.0.0.0)

This is the old, obsolete IP-Addresses option (see RFC 1332, section
3.1).  The only time it's used is when the modern IP-Address option
fails.  And, yes, pppd is rather insistent on trying to use it when
all else fails.

It's just a symptom of some other problem, not a cause, and not
necessarily a problem in itself.

At a guess, something went terribly wrong in the initial IPCP
negotiation.  Does that remote peer properly implement the state
machine from RFC 1661?

-- 
James Carlson                                  <carlson@workingcode.com>
