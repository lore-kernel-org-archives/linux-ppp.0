From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 12 Aug 2010 13:20:10 +0000
Subject: Re: Intervening IPCP Configure Requests
Message-Id: <4C63F50A.3070303@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <29408130.post@talk.nabble.com>
In-Reply-To: <29408130.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jouko Nikula wrote:
> Second use case is when client does not specify an IP-address. Then I would
> want to acquire a dynamic address, again outside pppd. If I found out that
> dynamic addresses are not allowed I would terminate the ppp connection,
> otherwise I would want to NAK the IPCP configure request with the acquired
> IP-address.
> 
> I have looked into pppd plugin interface, but if I understand correctly the
> current interface only provides the address given on the command line or
> options file, not the ip-address requested by the other end. The ip-up or
> ip-pre-up scripts don't seem to work for me because they are called when the
> IPCP negotiation has already ended.

The existing allowed_address_hook() will allow you to filter IP
addresses for acceptability.  The argument is the address the peer
requested, and if you return -1 and there are no other addresses
allowable, then the link will be torn down.

And the existing ip_choose_hook() will allow you to set up an address
that you want the peer to use.  You can use the allowed_address_hook()
to determine if that address actually was used.

The existing code, though, doesn't really allow you to get into the
middle of negotiation as you're suggesting.  And, arguably, the
interfaces are not as flexible as they could be.

Getting the on-the-wire behavior right (in general) requires mechanisms
that can be run synchronously and without undue delay.  That's why the
existing code keeps those hooks out of the main line -- those external
functions are sometimes (and all too often) written to make calls to
RADIUS or DHCP servers, or other sorts of things that can block for
arbitrary periods of time.

To put in a supportable set of hooks for what you're suggesting would (I
believe) require either a set of non-blocking primitives plus completion
callbacks and interfaces into the existing event handling structure or
(gasp!) similar multithreaded mechanisms.  I might be missing something,
but it doesn't look quite simple to me.

Of course, you've got the source, so if you just want to hack something
into the middle of ipcp_reqci() in pppd/ipcp.c, go ahead.  Depending on
how your "validation" functions work, you might produce odd results on
the wire, including possibly non-converging behavior with some peers.
But if you're not worried about that or if it works for you, then go for it.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
