From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 12 Dec 2007 21:29:53 +0000
Subject: Re: IPCP-Nak doesn't do anything
Message-Id: <Pine.LNX.4.64.0712121324020.26507@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <14303969.post@talk.nabble.com>
In-Reply-To: <14303969.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 12 Dec 2007, ipcpblues wrote:

>
> Hi,
>
> I'm trying to get two PPP devices to work together to setup a PPP
> connection.  I have control over one of them - meaning I can set whatever
> options I please - but I can't control the other device, it's options are
> hard-wired.
>
> I think I've almost got them working because they pass the LCP request - ack
> stage and enter the IPCP stage.  In the IPCP stage, my IPCP-Req is Ack'd, so
> I'm halfway there.  Their IPCP-Req is received by me with IP-addr=0.0.0.0
> and I respond with IPCP-Nak IP-addr2.168.20.50.  All this seems correct
> to me, but then the device doesn't accept my Nak and either re-sends its
> original IPCP-Req or goes back to the LCP-Req stage.
>
> Does any have ideas on why this could happen or something I can try?
>
> My log is below, Thanks for reading :)
>
> # pppd file options.pppBCM nodetach
> pppd options in effect:
> debug           # (from options.pppBCM)
> nodetach                # (from command line)

Why dump?

> dump            # (from options.pppBCM)
> noauth          # (from options.pppBCM)

You do not require athentication from the other side. That is the default.

> /dev/ttyUSB1            # (from options.pppBCM)
> 9600            # (from options.pppBCM)

That is really slow

> lock            # (from options.pppBCM)
> nocrtscts               # (from options.pppBCM)

Dangerous. does your modem really have no hardware flow control?


> asyncmap ffffffff               # (from options.pppBCM)
> 192.168.30.1:192.168.30.50              # (from options.pppBCM)

These are the IP addresses you want your self and them to have.

> nobsdcomp               # (from options.pppBCM)
> nodeflate               # (from options.pppBCM)
> using channel 21
> Using interface ppp0
> Connect: ppp0 <--> /dev/ttyUSB1
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]

The above all mean that you are talking to yourself. You are sending out
and receiving the same thing (that is what the magic numbr is all about)
there is not communication with the remote side.


> rcvd [LCP ConfReq id=0x25 <asyncmap 0x0> <magic 0xa5a44a5a>]
> sent [LCP ConfAck id=0x25 <asyncmap 0x0> <magic 0xa5a44a5a>]
They send you something.
and you respond.

> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]

They agree to your address.

> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfReq id=0x27 <addr 0.0.0.0>]
> sent [IPCP ConfNak id=0x27 <addr 192.168.30.50>]
> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfReq id=0x28 <addr 0.0.0.0>]
> sent [IPCP ConfNak id=0x28 <addr 192.168.30.50>]

It looks to me like the other side is hardly every receiving your
communication. What is the thing that you are trying to connect to?


> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfReq id=0x2a <addr 0.0.0.0>]
> sent [IPCP ConfNak id=0x2a <addr 192.168.30.50>]
> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [LCP ConfReq id=0x2c <asyncmap 0x0> <magic 0xa5a44a5a>]
> sent [LCP ConfReq id=0x2 <magic 0xae75be4b> <pcomp> <accomp>]
> sent [LCP ConfAck id=0x2c <asyncmap 0x0> <magic 0xa5a44a5a>]
> rcvd [LCP ConfAck id=0x2 <magic 0xae75be4b> <pcomp> <accomp>]
> sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
> sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfReq id=0x2d <addr 0.0.0.0>]
> sent [IPCP ConfNak id=0x2d <addr 192.168.30.50>]
> sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
> sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]

I think that he is not hearing you most of the time.

More information about what it is you are trying to do, and what is on the
other side of the link would be useful. (Cell phone, windows machine,
embedded computer,...

>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
