From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 14 Oct 2004 16:23:59 +0000
Subject: Re: even after PPP connection established, pings don't work
Message-Id: <Pine.LNX.4.60.0410141221460.22240@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 14 Oct 2004, Clifford Kite wrote:

> On Thu, 14 Oct 2004, Robert P. J. Day wrote:
>
> |  at the moment, i don't have access to the test box (dang, not enough
> |of them to go around), but i'm currently baffled by the fact that
> |connecting from my embedded board running linux with PPP 2.4.1 to
> |another linux system running PPP 2.4.2 seems to work just fine, until
> |i try to ping.  then ... nothing.
> |
> |  we have the embedded system with on-board modem, connected to
> |teltone box, connected to external modem, connected to host.  starting
> |pppd on the embedded system, everything works fine, dialing,
> |connection, *both* systems claim to have established a PPP
> |connection, *both* systems show the PPP connnection in their
> |"ifconfig" output, there are no error messages in the log files ...
> |all in all, you'd think everything was fine.
> |
> |  but running ping on either side just hangs.
> |
> |  now, the one complication is that the host is already on the network
> |and has a configured eth0 and a default gateway.  and we don't want to
> |mess with that so, on the host, we deliberately leave off the
> |"defaultroute" option.  from what i read, this shouldn't cause any
> |problems.  as long as there's a PPP interface, i should be able to
> |directly ping the IP address at the *other* end of that interface,
> |even if my default route in the routing table refers entirely to
> |another interface and gateway, no?
>
> Yes.  A ping that hangs is usually due to one of three things:
>
> 1)  A default route is set wrong.  Not applicable when pinging
>     between the PPP link hosts by IP address.

i would have thought so, but that's exactly what we're trying -- just
pinging the IP address at the other end of the link, nothing more.

> 2)  If pinging by host name then a nameserver is wrong.  Pinging
>     by IP address should work.

i've played it safe by using "ping -n" to deactivate any DNS
resolution, and all we're using is IP addresses.

> 3)  Something is wrong with the serial connection that affects
>     the data being sent.

sadly, as sherlock holmes would say, "watson, once you've eliminated
all of the other possibilities, whatever remains, however improbable,
must be true."  dang.

rday
