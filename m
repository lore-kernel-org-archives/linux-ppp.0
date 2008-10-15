From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 15 Oct 2008 12:09:02 +0000
Subject: Re: Split dialup how to detect package loss and whats 10.64.64.64
Message-Id: <18677.56670.754166.88090@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <5153e02f0810140526u78d1345ct9ac28c8ada6e9656@mail.gmail.com>
In-Reply-To: <5153e02f0810140526u78d1345ct9ac28c8ada6e9656@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> I've heard and seen that Windows systems show point to point links as if
> they are Ethernet adaptors ... and I shake my head in confusion.  Linux
> point to point links are different: the remote IP address has no use,
> and I find everything works fine without it.

I mostly agree with your rant; for the typical "simple" end-user
connection to an ISP, the remote address is not terribly necessary or
interesting.  But it's not quite accurate that a remote address "has
no use."

The first observation is that if you have a PPP link running IP, then
the termination point must (by definition) support IP.  Devices that
support IP but refuse to reveal an address are fairly boring, because
you usually can't talk directly to them, and they can't be managed.
Rather than being deliberately ornery, those devices ought to reveal
that address.

One obvious use of a remote address is in just testing the link at the
IP level.  If you have a remote address on the link, then you can ping
the peer and isolate IP-level link problems versus routing-related
problems.  If you don't have a usable remote address on the link, then
you can't necessarily directly ping the peer (even though it obviously
is an IP node), and anything you do contact will be at least one extra
hop away -- meaning that isolating problems is a bit harder.

Another use is in routing.  If you run a routing protocol, then the
source address on each peer's message will be local link's IP address,
and any unicast messages demanded by the protocol (e.g., running BGP)
will typically be to the remote address on the link.

Still another is in link monitoring.  Some peers will allow you to do
simple SNMP queries to retrieve link statistics from the remote end,
which can be extremely useful in diagnosing network faults and
tracking usage.

So, while the address isn't all that interesting to some classes of
users, I would maintain that any IPCP deployment that refuses to
reveal at least some address for itself is very poorly done indeed,
reflects a lack of basic networking clue on the part of the operator,
and ought to be repaired or replaced.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
