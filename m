From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 13 Dec 2008 19:39:50 +0000
Subject: Re: pptpd
Message-Id: <18756.3974.980572.482257@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9548217129274771229195924@webmail26>
In-Reply-To: <W9548217129274771229195924@webmail26>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson writes:
> tony.chamberlain@lemko.com writes:
> > and then in CHAP secrets I put logins and passwords.
> > Thing is, people need their own IP address (need to count
> > on it each time they connect).  For instance, if I have
> > something in chap secrets like

One other thing I should have noted: this controls only the address
negotiated by IPCP.

The user can use any source address he wants into the packets he
sends, regardless of what was actually negotiated by IPCP.  This is
normal and expected -- it's how routing works -- so don't think of the
negotiation as any sort of "security."  It's a parameter assignment
mechanism, and nothing else.  Think if it as advisory information.

If you need to restrict the usage of the link (e.g., limit the set of
source addresses that the remote peer may use), then you'll need to
set up packet filters on your end.  These are independent of PPP.

The very same issue shows up with all types of links, including
Ethernet: if you want to restrict what you allow, then you need to
configure filters.  Link protocols generally don't do that for you,
and the restrictions you use will depend on the exact needs of the
deployment.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
