From: "Gerianne McC" <geriannemcc@gmail.com>
Date: Tue, 15 Apr 2008 13:52:35 +0000
Subject: Re: What are the correct NETMASKs for multiple PPPoE interfaces in a StaticIP block?
Message-Id: <b510d0250804150652v466048a2n41cf8453eda7a3ae@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
In-Reply-To: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

>  >        ppp0:5, IP address = x.x.x.237
>
>  That should work, though it's perhaps not how I'd handle it.

I'm definitely in 'learning mode' -- how *would* you handle it?

>  > What should be the NETMASK for the primary 'ppp0'? /29 or /32?
>  > And for each of the aliases?
>
>  They're all /32 -- individual IP addresses.
>
>  PPP creates point-to-point interfaces.  It's not a broadcast-type
>  medium, like Ethernet.  There's no "subnet" as far as the interface is
>  concerned, but rather just two arbitrary IP nodes connected together.
>
>  That's why the link has a "local" address and a "remote" address, and
>  no "broadcast" address.  It's not a subnet.

"point to point".  You know, that simply never hit home.  Thanks for a
simple/clear explanation!

and, of course, you're right ... @ ifconfig, I see,

 for eth# interfaces, e.g.

	inet addr:10.0.0.100  Bcast:10.0.0.255  Mask:255.255.255.0
	UP BROADCAST RUNNING MULTICAST  MTU:1492  Metric:1
	
 whereas for ppp# interfaces,

	ppp0:5      Link encap:Point-to-Point Protocol
	inet addr:x.x.x.227  P-t-P:y.y.y.y  Mask:255.255.255.255
	UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1

i.e., no BROADCAST

>  Setting a /29 on a PPP interface should have no effect.  The system
>  should be smart enough to know that the right answer is /32.

The system maybe was ... as for me ;-)

Thanks again!

Geri :-)
