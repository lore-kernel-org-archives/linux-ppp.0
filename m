From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 30 Jan 2009 23:05:23 +0000
Subject: Re: Routing
Message-Id: <18819.34739.618937.247680@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W3133827767292401233331800@webmail16>
In-Reply-To: <W3133827767292401233331800@webmail16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com writes:
> I have a machine, accessible from outside our company, running PPP.
> It's local IP address is 10.0.1.29 (the address it gets from PPP).
> I also have another machine whose IP address is 10.0.1.3 and also has
> an IP address of 192.168.5.88 connected to our local network.
> 
> I can get to the 10.0.1.29 machine through an external IP address (which
> I won't list here, for security reasons) and from there ssh to 10.0.1.3
> and from 10.0.1.3 to the 192 network.

Unless that external IP address is actually a system routed on the
inside of some corporate network (where there's an overlay for the RFC
1918 ranges), what you're describing sounds very odd.

Typically, systems with RFC 1918 are accessible from the Internet only
through a NAT device that does some sort of static address and/or port
translation -- meaning that you use a _different_ address to reach it,
not the RFC 1918 address.

Are you perhaps misstating the addresses in use as some sort of
security measure, or is there more going on here than you're telling
us about?

> I would like to be able to get right from 10.0.1.29 to the 192 network.
> On 10.0.1.3 I set the ip_forard (I forgot exaclty what it is called) to 1
> and restarted the network.

You'll also need routes on the 192 network to point back to the 10
network.

>      ssh -l root 192.168.5.191
> 
> it wouldn't let me and couldn't connect (though it would work from 10.0.1.3).
> 
> Did I miss something, or what else do I need to do?

You likely missed the reverse routes I described above.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
