From: Markus.Reichert@devolo.de
Date: Tue, 30 Aug 2005 16:38:54 +0000
Subject: pppd: How to avoid packet loss with dial on demand?
Message-Id: <OF6B6A0111.A598F39B-ONC125706D.0055E4E8-C125706D.005B7416@devolo.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I'm currently working on a fix for the following problem:

If a Linux router does masquerading in combination with dial on demand
and dynamic IP, ICMP and UDP packets get lost as ip_dynaddr works only
for TCP connections (fix uses TCP retransmissions).

The problem is that the PPP gets a packet from IP which is already 
address-
translated, but with the old interface IP address. This packet triggers 
the
dial-in. Thereafter pppd sends out the (unmodified) queued packet using 
the interface
with its new IP address. Result: The answer can't get back as the old IP
of the interface disappeared.

I want to fix the problem within pppd, as I think this is the right place 
to do so. As there
is a function demand_rexmit where obviously all queued packets go through 
after dial-in,
I already patched PPP to replace the old IP by the new one.

But answers to these packets have to be re-translated as well. Can 
somebody tell me
where I find the right place in pppd to do that? I'm currently not sure 
how to tell the kernel
PPP to send the packets to pppd instead of handling the IP traffic 
completely on its own.
I need to see the incoming packets for the IP address re-translation.

Thanks for suggestions,

Markus




