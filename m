From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 19 Jan 2005 17:35:01 +0000
Subject: Re: Disconnecting sockets on PPP interface going down
Message-Id: <16878.39493.219685.576605@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <csm328$qbc$1@sea.gmane.org>
In-Reply-To: <csm328$qbc$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nolan Eakins writes:
> ~  For random reasons (phone cord getting kicked out of the wall,
> incoming call, ISP trouble) I get disconnected. I have KPPP setup to
> automatically redial when this happens, but each time I have to manually
> reconnect Gaim, Psi, ssh, etc. or wait 20 minutes, and it gets annoying.
> 
> This is something Windows has been able to do for God knows how long,
> and I don't want to hear that it's some "feature" of some protocol
> layer. It's annoying and a complete hassle, and I'd like it fixed.

Right.  Many of us with a networking background consider that to be a
Windows *bug*, not a feature.  It makes some rather crude assumptions
about how the system must be used.

> Obviously the solution is to have the applications signaled so they know
> that the socket's interface has died.

First problem: sockets don't have interfaces.  It's perfectly legal
for an interface to go away and a completely different interface to
arrive and take its place.  I know you said you don't want to hear it,
but the "socket" endpoint exists at the transport layer, which knows
nothing about network interfaces.  The network interfaces are at the
network layer -- which generally knows nothing about sockets.

TCP/IP was _intentionally_ designed this way.

> How do I set this up? Can I set
> this up so all of my applications will get notified of the
> disconnection? Or how do I set things up so the connections can live
> through a reconnect and change of IP address, if they can?

Best answer _might_ be to open a PF_ROUTE (routing) socket and listen
for interface changes of interest.  Another possibility is designing
the application so that it automatically disconnects and retries on
error (perhaps with a short timer).  Still another is to switch to
SCTP, which is designed for handling multiple IP addresses and
migrating between them.

That said, and since you're posting to the linux-ppp list, you can
hack the Linux TCP/IP sources so that they snipe sockets out of
existence when the underlying interface goes down.  I sort of doubt
that it'd be acceptable as a general stack "feature," but it sounds
doable.  (And, as that, it's not related to PPP itself, but rather to
the way IP deals with interface transitions.  In other words, you'd
run into the same "problem" if you took down an Ethernet interface.)

-- 
James Carlson                                 <carlsonj@workingcode.com>
