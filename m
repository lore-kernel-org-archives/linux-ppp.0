From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Mon, 23 Jul 2007 12:08:45 +0000
Subject: Re: Can we run a PPP server & client simultaneously???
Message-Id: <1185192525.29974.3.camel@shuttle.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <11741524.post@talk.nabble.com>
In-Reply-To: <11741524.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 2007-07-23 at 07:59 -0400, James Carlson wrote:
> On the Annex communications server, we wrote special demand-dial
> management code to look up a dormant interface by address and bring it
> to life when the peer called us.  That way, the return traffic (reply
> packets) wouldn't trigger an outbound attempt that would fail.
> 
> On Linux, you may be able to get away with it if both links have
> different sets of IP addresses. 

You can do it on Linux.  I have hundreds doing this. Yes you do have 2
interfaces.  I'm curious as to details on how you solved it on the
Annex.  They way we solved it is via if-down and if-up.  That is a C
program on our device.  When pppd calls that program it looks for an
interface that is in the UP state  but not our own.  It places that
interface in the DOWN state.  When if-down is called it looks for an
interface that is DOWN but not our own and it places that in UP.  The
effect is that you'll end up with 2 ppp interfaces with the same
address.  Only one is UP.  

I've had this working for a couple years now and I've not had any
problems.  I think the only problem I could see is if pppd died and
never called if-down.  You would end up with a PPP interface in the DOWN
state and the remote could never call home. Calling from the server
would rectify the situation.



