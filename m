From: Stephan Scholz <sscholz@astaro.com>
Date: Mon, 08 Nov 2004 09:50:54 +0000
Subject: Re: ppp_mppe osize issue
Message-Id: <418F417E.5080107@astaro.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041106000351.3d60f2ba@emach>
In-Reply-To: <20041106000351.3d60f2ba@emach>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PPPD reduces the MTU of the interface, because MPPE encryption needs
additional 4 bytes. Windows clients do not see if that way, however.
This leads to problems, because the Windows client sends a TCP MSS
of 4 bytes too large for PPPD.
What you can do is change the PPPD, so that it does not reduce the MTU anymore.
See the patch below.

Alternatively, set the MTU of the PPP interface in the ip-up script.

Stephan


diff -u -r1.1.1.1 -r1.1.1.1.4.1
--- sources/p/pppd/pppd/ccp.c	2004/01/16 09:47:28	1.1.1.1
+++ sources/p/pppd/pppd/ccp.c	2004/10/15 15:08:50	1.1.1.1.4.1
@@ -1191,7 +1191,12 @@
  		     */
  		    mtu = netif_get_mtu(f->unit);
  		    if (mtu)
-			netif_set_mtu(f->unit, mtu - MPPE_PAD);
+		    {
+			// Removed the lowering of the MTU, because it causes
+			// problems with routing (TCP/MSS: Windows clients
+			// do not care about this reduced packet size)
+			//netif_set_mtu(f->unit, mtu - MPPE_PAD);
+		    }
  		    else
  			newret = CONFREJ;
  		}


Guy Rouillier wrote:
> (I sent this earlier this week under the subject "osize too small" and
> now realize that most spam filters probably kicked it out.  Resending...
> 
> I'm using ppp with pptp to connect to a MS server at work.  Kernel is
> 2.6.3 AMD64 on Mandrake 10.0, ppp 2.4.2.  I built this kernel myself to
> fix the 64-bit issues with ppp (fix previously reported.)   When I have
> VPN up and run a browser, it will retrieve a particular page fine the
> first time.  However, if I click the submit button on that page again
> (which transmits a bunch of data - I authored this page so know all
> about it) the browser just goes into continuous wait and never actually
> transmits anything.  I see the following in dmesg:
> 
> PPP generic driver version 2.4.2
> ppp_mppe: module license 'BSD without advertisement clause' taints
> kernel.
> PPP MPPE Compression module registered
> Module ppp_mppe cannot be unloaded due to unsafe usage in
> include/linux/module.h:503
> mppe_compress[0]: osize too small! (have: 1400 need: 1404)
> ppp: compressor dropped pkt
> mppe_compress[0]: osize too small! (have: 1400 need: 1404)
> ppp: compressor dropped pkt
> 
> What is the appropriate fix for this? ifconfig shows an MTU of 1396 for
> ppp0.  I tried specifying mtu 1500 when starting pppd, but it still ends
> up 1396.  I suppose the server end is constraining it.  Appreciate all
> suggestions - I can rebuild the kernel if necessary.
> 


-- 
Stephan Scholz <sscholz@astaro.com> | Development
Astaro AG | www.astaro.com | Phone +49-721-490069-0 | Fax -55

Documentation: http://docs.astaro.org
User Bulletin Board: http://www.astaro.org

- Certified by ICSA labs - June 2004
- Computer Reseller News: "CRN Certified Program" - June 2004
- Linux Pro Italy: Best Rating 10 out of 10 points - May 2004
- Linux Enterprise Readers' Choice Award: Best Firewall - October 2003

