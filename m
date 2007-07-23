From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 23 Jul 2007 12:28:55 +0000
Subject: Re: Can we run a PPP server & client simultaneously???
Message-Id: <18084.40711.654049.717785@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <11741524.post@talk.nabble.com>
In-Reply-To: <11741524.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christopher Fowler writes:
> On Mon, 2007-07-23 at 07:59 -0400, James Carlson wrote:
> > On the Annex communications server, we wrote special demand-dial
> > management code to look up a dormant interface by address and bring it
> > to life when the peer called us.  That way, the return traffic (reply
> > packets) wouldn't trigger an outbound attempt that would fail.
> > 
> > On Linux, you may be able to get away with it if both links have
> > different sets of IP addresses. 
> 
> You can do it on Linux.  I have hundreds doing this. Yes you do have 2
> interfaces.  I'm curious as to details on how you solved it on the
> Annex.

The advantages of having a single address space unobstructed by an
MMU -- we simply had a global table of demand links and matched
inbound links against that table before creating a new interface.  If
it matched, then we'd attach to the interface in that table, otherwise
create a new one.

The internal design of the Annex is really quite different from Linux.
The PPP code there wasn't based on pppd.

>  They way we solved it is via if-down and if-up.  That is a C
> program on our device.  When pppd calls that program it looks for an
> interface that is in the UP state  but not our own.  It places that
> interface in the DOWN state.  When if-down is called it looks for an
> interface that is DOWN but not our own and it places that in UP.  The
> effect is that you'll end up with 2 ppp interfaces with the same
> address.  Only one is UP.  

Interesting.

> I've had this working for a couple years now and I've not had any
> problems.  I think the only problem I could see is if pppd died and
> never called if-down.  You would end up with a PPP interface in the DOWN
> state and the remote could never call home. Calling from the server
> would rectify the situation.

I think that process may have race conditions, given that if-up is
triggered after the interface is marked 'UP', and nothing in the
system actually waits for that script to complete.  For that reason, I
wouldn't suggest that as a design for a new feature in the pppd code
base.

Otherwise, though, it seems like a somewhat reasonable solution for a
pppd user.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
