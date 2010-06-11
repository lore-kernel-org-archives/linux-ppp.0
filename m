From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 11 Jun 2010 12:03:32 +0000
Subject: Re: PPPoE mutiple session issue.
Message-Id: <4C122614.3020407@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTik_K8aDmuoNjCkKNWoS5bx6kokZCagmzzw5pxcW@mail.gmail.com>
In-Reply-To: <AANLkTik_K8aDmuoNjCkKNWoS5bx6kokZCagmzzw5pxcW@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 06/11/10 03:53, arun b wrote:
> All,
> I am running pppd (PPPoE mode).  when i create mutiple
> session(interfac) (ppp0 /ppp1..). I am unable to communicate over
> ppp1(ping test) only ppp0 is comunicable..
> 
> Iis it a valid behaviour  or Is this a know issue, if so pls know the fix  ?

There's not a lot of information here, so it's a little hard to guess.
It would usually help matters to include packet traces on the Ethernet
(not text, but raw traces) and/or some hints about how the interfaces
are configured and what routes you have.

There is, though, one possibility that comes immediately to mind.  PPPoE
is not a standards-track protocol, and was not subjected to the sort of
review that standard protocols are.  It has some substantial defects.

One of those defects is that only a single session ID is established for
a session.  Normal tunneling protocols establish a separate ID in each
direction so that each side can demux properly, but PPPoE does not.
This means that when packets go from PPPoE access server back to the
client, there's no real guarantee that the client can successfully
demultiplex the traffic, because the server chose the ID.  The protocol
just "assumes" that "normal" clients won't run more than one instance of
PPPoE, so the ID doesn't matter.

On the Solaris implementation of PPPoE that I wrote, I added special
code to detect conflicting IDs on the client side and then demux based
on Ethernet address.  That makes it work with multiple clients as long
as the servers have different addresses.  That's not specified in the
RFC, so it's possible that not every implementation is able to do that.

On an implementation lacking that feature, you might be able to get away
with using multiple Ethernet interfaces.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
