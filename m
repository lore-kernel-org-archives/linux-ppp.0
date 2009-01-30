From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 30 Jan 2009 16:38:15 +0000
Subject: Re: Routing
Message-Id: <Pine.LNX.4.64.0901300832430.13074@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <W3133827767292401233331800@webmail16>
In-Reply-To: <W3133827767292401233331800@webmail16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 30 Jan 2009, tony.chamberlain@lemko.com wrote:

> I have a machine, accessible from outside our company, running PPP.
> It's local IP address is 10.0.1.29 (the address it gets from PPP).
> I also have another machine whose IP address is 10.0.1.3 and also has
> an IP address of 192.168.5.88 connected to our local network.
>
> I can get to the 10.0.1.29 machine through an external IP address (which
> I won't list here, for security reasons) and from there ssh to 10.0.1.3
> and from 10.0.1.3 to the 192 network.
>
> I would like to be able to get right from 10.0.1.29 to the 192 network.
> On 10.0.1.3 I set the ip_forard (I forgot exaclty what it is called) to 1
> and restarted the network.

  192.168.x.x addresses are not forwarded by
routers. They are simply thrown away as private addresses. NOw, you could on
the 10.0.1.29 put in a routing table telling it to send all such packets to
10.0.1.3, but if there are any routers in the way, they may well discard it.

>
> On 10.0.1.29 I did an
>
>     ip route add '192.168.5.0/24' via 10.0.1.3 dev ppp0
> and
>     ip route add '192.168.5.0/24' via 10.0.1.3
>
> tried both.  It was entered succesfully and showed up in "route -n" but
> when I tried from 10.0.1.29 to do for example
>
>     ssh -l root 192.168.5.191

Do a traceroute on the ppp0 to see if the packet is going out (are you sure
that 10.0.1.3 is directly connected to 10.0.1.3 via ppp )

Youneed to tell us exactly what the connection topology is.

>
> it wouldn't let me and couldn't connect (though it would work from 10.0.1.3).
>
> Did I miss something, or what else do I need to do?
>
> I somehow got this to work earlier between our 192.168.5 nextwork and
> our 10.0.0.0 network where a machine (10.0.0.215/192.168.5.15) was on
> both networks, and I set its address (192.168.5.15) as default router
> for 192.168.5 networks and 10.0.0.215 for 10 networks.
>
> 192.168.5 mask is 255.255.255.0 and 10 network mask is 255.0.0.0
>
> Tony
