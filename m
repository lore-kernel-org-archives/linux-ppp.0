From: Andy <fs@globalnetit.com>
Date: Sun, 21 Mar 2004 07:59:16 +0000
Subject: pppd 2.4.2b3 IPCP converge failure
Message-Id: <1079855955.1133.48.camel@dell.tranquilitynj.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Can anyone suggest what might have caused this to happen:

Mar 20 18:39:55 pppd[24048]: sent [IPCP ConfReq id=0xae <addrs
68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
Mar 20 18:39:55 pppd[24048]: rcvd [IPCP ConfRej id=0xae <addrs
68.244.143.67 0.0.0.0>]
Mar 20 18:39:55 pppd[24048]: sent [IPCP ConfReq id=0xaf <addrs
68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
Mar 20 18:39:55 pppd[24048]: rcvd [IPCP ConfRej id=0xaf <addrs
68.244.143.67 0.0.0.0>]
Mar 20 18:39:55 pppd[24048]: sent [IPCP ConfReq id=0xb0 <addrs
68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
Mar 20 18:39:55 pppd[24048]: rcvd [IPCP ConfRej id=0xb0 <addrs
68.244.143.67 0.0.0.0>]
Mar 20 18:39:55 pppd[24048]: sent [IPCP ConfReq id=0xb1 <addrs
68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
Mar 20 18:39:55 pppd[24048]: rcvd [IPCP ConfRej id=0xb1 <addrs
68.244.143.67 0.0.0.0>]
Mar 20 18:39:55 pppd[24048]: sent [IPCP ConfReq id=0xb2 <addrs
68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
Mar 20 18:39:56 pppd[24048]: rcvd [IPCP ConfRej id=0xb2 <addrs
68.244.143.67 0.0.0.0>]
Mar 20 18:39:56 pppd[24048]: sent [IPCP ConfReq id=0xb3 <addrs
68.244.143.67 0.0.0.0> <ms-dns1 68.28.178.11> <ms-dns3 68.28.186.11>]
Mar 20 18:39:56 pppd[24048]: rcvd [IPCP ConfRej id=0xb3 <addrs
68.244.143.67 0.0.0.0>]

etc ad infinitum

this appears in the logs of a remote embedded system that connects thru
ppp over a wireless link, it went off the air for about an hour today
and when it came back its logs were full of this stuff. There's about 5
IPCP ConfReq/ConfRej messages each second. Every 3 seconds there are
these additional messages:

Mar 20 18:39:45 pppd[24048]: rcvd [IPCP ConfReq id=0xff <addr
68.28.165.192>]
Mar 20 18:39:45 pppd[24048]: sent [IPCP ConfAck id=0xff <addr
68.28.165.192>]

but although my box acked the new address, it proceeded to ignore it.

Evenually (mercifully!) the peer sent a Term and hung up, my box then
reconnected successfully.

The embedded system has limited space for logs, so I have only the last
5 minutes or so of this event, I can't see what happened to start it
off.

I'm wondering about the ConfReq packets, what is the second address
field doing there (as in addrs 68.244.143.67 0.0.0.0) - that looks wrong
to me. And there certainly seems to be a protocol error here in pppd
handling the ConfRej's - this is from rfc1661, section 5.4:

      Reception of a valid Configure-Reject indicates that when a new
      Configure-Request is sent, it MUST NOT include any of the
      Configuration Options listed in the Configure-Reject.


I don't explicitly set the ipcp-max-configure option, so it should have
defaulted to 10, according to the manpage, which also states that the
ipcp-max-failure option applies to ConfNak's, so presumably the
ConfRej's weren't being counted.

This system is running 2.4.2b3, I see that ipcp.c has been updated in
2.4.2, I wonder if this is a known bug. Apologies if it is, but I
couldn't find a changelog or anything that describes what's been fixed.



