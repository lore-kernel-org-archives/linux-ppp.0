From: carlsonj@workingcode.com
Date: Mon, 19 Jul 2004 12:25:43 +0000
Subject: Re: Can reach remote server, but not beyond
Message-Id: <16635.48583.693235.996613@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <37173.192.168.0.150.1090205104.squirrel@www.powerpull.net>
In-Reply-To: <37173.192.168.0.150.1090205104.squirrel@www.powerpull.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jason S. Friedman writes:
> name eprime\\jfriedman          # (from
> /etc/ppp/peers/xemkt)

Generally, if you're a "client" rather than a "server", then you want
to use the pppd 'user' option rather than the 'name' option.  (This
has nothing to do with the problems, though.)

> Sent 409591244 bytes, received 50 bytes.
> 
> That last line comes after I hit CTRL-C.  A lot of bytes
> in very little time.

I suspect that's just a red herring.  It looks like a bug in the
statistics.

> $ route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags
> Metric Ref    Use Iface
> 63.85.19.5      0.0.0.0         255.255.255.255 UH    0   
>   0        0 ppp0
> 63.231.91.152   0.0.0.0         255.255.255.248 U     0   
>   0        0 eth2
> 192.168.0.0     0.0.0.0         255.255.255.0   U     0   
>   0        0 eth0
> 169.254.0.0     0.0.0.0         255.255.0.0     U     0   
>   0        0 eth2
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0   
>   0        0 lo
> 0.0.0.0         63.231.91.158   0.0.0.0         UG    0   
>   0        0 eth2
> 
> I can ping 10.105.30.1, but I cannot ping 63.85.19.5.

That ought to work.  If it doesn't, then it means that the link itself
is broken.  This doesn't actually look like a PPP problem to me -- it
looks like something's wrong with PPTP.

>  I
> also cannot ping any machines on the LAN of the PPP host.

That's exactly how your routing table is configured -- look at the
last entry.  "0.0.0.0" says "all packets that don't match one of the
addresses above are sent to eth2."

That's probably not what you want.  It's not clear, though, exactly
what you need.

-- 
James Carlson                                 <carlsonj@workingcode.com>
