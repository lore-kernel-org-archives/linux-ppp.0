From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Sat, 06 Nov 2004 05:03:51 +0000
Subject: ppp_mppe osize issue
Message-Id: <20041106000351.3d60f2ba@emach>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

(I sent this earlier this week under the subject "osize too small" and
now realize that most spam filters probably kicked it out.  Resending...

I'm using ppp with pptp to connect to a MS server at work.  Kernel is
2.6.3 AMD64 on Mandrake 10.0, ppp 2.4.2.  I built this kernel myself to
fix the 64-bit issues with ppp (fix previously reported.)   When I have
VPN up and run a browser, it will retrieve a particular page fine the
first time.  However, if I click the submit button on that page again
(which transmits a bunch of data - I authored this page so know all
about it) the browser just goes into continuous wait and never actually
transmits anything.  I see the following in dmesg:

PPP generic driver version 2.4.2
ppp_mppe: module license 'BSD without advertisement clause' taints
kernel.
PPP MPPE Compression module registered
Module ppp_mppe cannot be unloaded due to unsafe usage in
include/linux/module.h:503
mppe_compress[0]: osize too small! (have: 1400 need: 1404)
ppp: compressor dropped pkt
mppe_compress[0]: osize too small! (have: 1400 need: 1404)
ppp: compressor dropped pkt

What is the appropriate fix for this? ifconfig shows an MTU of 1396 for
ppp0.  I tried specifying mtu 1500 when starting pppd, but it still ends
up 1396.  I suppose the server end is constraining it.  Appreciate all
suggestions - I can rebuild the kernel if necessary.

-- 
Guy Rouillier
