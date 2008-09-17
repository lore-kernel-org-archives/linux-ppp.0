From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 17 Sep 2008 21:15:12 +0000
Subject: Re: pppd creates route without "gateway" flag
Message-Id: <Pine.LNX.4.64.0809171412190.27485@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
In-Reply-To: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 17 Sep 2008, Joakim Wennergren wrote:

> I just looked at my routing table, and the route pppd created does not
> have the "G" flag like I'm used to, is there a reason for this?

PPP is Peer to Peer Protocol. Ie, it is from one peer to another. It has
nothing whatsoever to do with gateways, etc. 
Now you CAN use the peer as your gateway if you wish, but there is no need
to. 
In your output the default route is delivered to the ppp interface and
since there is only one thing, the remote peer, connected to that
interface, all traffic is sent out to that remote peer. 
A gateway says "if you get traffic for this range of addresses send it to
this IP". In your case it says "In the default case just dump it onto the
ppp interface"

>
> This is output from route:
>
> # route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 10.64.64.64     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
> 192.168.2.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
> 192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 br0
> 0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0
>
> It seems to work, I'm just wondering why? And can it affect something
> in the future?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
