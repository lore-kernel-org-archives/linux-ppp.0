From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 11 Jul 2005 17:10:59 +0000
Subject: Re: frozen ppp
Message-Id: <17106.43043.533468.40489@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <440a9a95050711081730710cc3@mail.gmail.com>
In-Reply-To: <440a9a95050711081730710cc3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Sasha Shipka writes:
> I'm trying to use wireless pppoe connection to my ISP from linux.
> I'm using rp-pppoe and pppd 2.4.3. Kernel is 2.4.23 with mppe patch
> from pptp site.

I'd recommend going back to the supplier of that patch and asking
there.  The symptoms you're reporting are consistent with a broken
decryption module.

> ul 11 14:56:02 duat pppd[7741]: rcvd [proto=0xcba5] 69 73 df e1 5f ed
> 4c cb a0 3f ae 62 eb e6 0b 95 42 3b ef 7f f6 8d ea b3 18 9d c1 6d f9
> 35 2c 70 ...
> Jul 11 14:56:02 duat pppd[7741]: Unsupported protocol 0xcba5 received

That's what you'd expect if encryption/compression or decryption/
decompression falls apart.

> Pattern is id, which is increased every time.

That's normal and isn't really a symptom of anything.  LCP uses those
ID numbers when it relates request/reply pairs.

> Things I tried:
> * to reduce or increase mtu on ppp interface.
> * to add following line to iptables:
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
> --clamp-mss-to-pmtu
> * to disable mru decrease in ccp.c code (I saw that in archives of this list)
> * to add nomppe-128 (or nomppe-40) to pppd options

If you're able to run MPPE in historyless mode, that might be
something worth trying.

But you still should report this as a bug in the 'mppe' module you're
using.

-- 
James Carlson                                 <carlsonj@workingcode.com>
