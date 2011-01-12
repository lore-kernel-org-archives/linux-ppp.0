From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 14:57:19 +0000
Subject: Re: ppp / open vpn
Message-Id: <4D2DC14F.5050903@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W90767349010091294791641@webmail30>
In-Reply-To: <W90767349010091294791641@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/11/11 19:20, tony.chamberlain@lemko.com wrote:
> For our customers I have to set up an openvpn server and client.
> Our cell software creates Linux tunnels (e.g. tun0, tun1) when a cell
> phone wants to do a data session.  Subsequently on startup our software
> kills all the tunnels.  Unfortunately, it then kills the VPN client (this
> on the client side).

Why not fix your software so that it doesn't kill all the tunnels?
Isn't that the root of the problem you're facing?

> So to get around this, a person at work changed in the ovpn file
> dev tun0  to  dev ppp0 so it would not get killed.  As far as I understand
> though, openvpn is not ppp.  I am wondering whether this will cause any
> problems in CentOS, calling a tunnel ppp?

I don't know that anyone uses or tests the software in that way, so
you'll have to let us know whether it works.  If you have problems,
though, you're probably on your own.

> Through eth0 just
> 0.0.0.0         192.168.5.1     0.0.0.0         UG    0      0        0 eth0
> 
> I could remove the 0.0.0.0 with netmask 0.0.0.0 when routing through the
> VPN but I don't want to forget what the original router (192.168.5.1) is.

One way to handle it would be to save it in a file.  I realize that's
less than optimal.

> So a question is, what has precedence, 0.0.0.0 with netmask 0.0.0.0 or
> 0.0.0.0 and 128.0.0.0 with a netmask of 128.0.0.0?  They bothe appear to
> cover every address (not specifically specified in a previous route which I did not show).

In IP forwarding, longer netmask = higher precedence.

So, yes, you could have a default 0.0.0.0/0 route pointing to the old
destination, and then cover it with two new routes to 0.0.0.0/1 and
128.0.0.0/1.  Those new routes would take precedence over the 0.0.0.0/0
route, because each has a longer netmask (1 > 0).

(For what it's worth, I find CIDR notation a little easier to grok than
explicit netmasks ... but express it whatever way makes sense to you.)

>           inet addr:10.1.0.6  P-t-P:10.1.0.6  Mask:255.0.0.0

That doesn't look happy.  Why would both the local and remote address be
equal?  (I wouldn't expect a functioning system to allow a configuration
like that.)

The whole point of a point-to-point interface (of any type; PPP, tunnel,
or otherwise) is that it connects two distinct IP nodes.  Distinct.  Not
one IP node to itself!

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
