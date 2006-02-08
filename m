From: Phil Mayers <p.mayers@imperial.ac.uk>
Date: Wed, 08 Feb 2006 16:16:19 +0000
Subject: Windows mobile 2005 clients
Message-Id: <43EA1953.9000005@imperial.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

All,

Apologies for the cross posting - strictly this is a PPP issue, but I
think given the number of posts the poptop people may want to see it as
well.

We've recently migrated a win2k PPTP service to Linux with poptop. The
vast majority of clients work fine, but windows mobile 2005 clients are
failing.

I've discovered that the problem is the WM2005 PPTP client PPP layer
sets none of the 40, 56 or 128 bit MPPE flags, and pppd instantly
terminates the connection when this happens. A win2k VPN server NAKs
with the preferred keysize.

sent [CHAP Challenge id=0x3e <CHAL>, name = "pptpd"]
rcvd [CHAP Response id=0x3e <RESP>, name = "user"]
sent [CHAP Success id=0x3e "S=BYTES"]
sent [CCP ConfReq id=0x1 <mppe +H -M +S +L -D -C>]
rcvd [CCP ConfReq id=0x0 <mppe -H -M -S -L -D +C>]
sent [LCP TermReq id=0x2 "MPPE required but peer negotiation failed"]
sent [CCP ConfRej id=0x0 <mppe -H -M -S -L -D +C>]

The following patch to pppd seems to fix this, HOWEVER the connection
does not come up correctly - there seems to be a key generation error
because the keys are generated twice in the ppp state machine:

sent [CCP ConfReq id=0x1 <mppe +H -M +S +L -D -C>]
rcvd [CCP ConfReq id=0x0 <mppe -H -M -S -L -D -C>]
sent [CCP ConfNak id=0x0 <mppe -H -M +S -L -D -C>]
rcvd [CCP ConfNak id=0x1 <mppe -H -M +S -L -D -C>]
sent [CCP ConfReq id=0x2 <mppe -H -M +S -L -D -C>]
rcvd [CCP ConfReq id=0x1 <mppe -H -M +S -L -D -C>]
mppe_decomp_init[0]: initialized with 128-bit stateful mode
sent [CCP ConfAck id=0x1 <mppe -H -M +S -L -D -C>]
mppe_decomp_init[0]: keys: master: BYTES1 initial session: BYTES2
rcvd [CCP ConfAck id=0x2 <mppe -H -M +S -L -D -C>]
mppe_comp_init[0]: initialized with 128-bit stateful mode
mppe_comp_init[0]: keys: master: BYTES3 initial session: BYTES4
<SNIP IPCP>
Script /etc/ppp/ip-up started (pid 24653)
Script /etc/ppp/ip-up finished (pid 24653), status = 0x0
decompress[0]: ccount 0
rcvd [proto=0xc7] fe 99 67 83 1b 1a 4d cf cd fb 9c f8 ce e2 6f 9c 1a 07
23 85 25 c2 b9 d8 cc fd 3d 9f 90 ee c4 3f ...
sent [LCP ProtRej id=0x4 00 c7 fe 99 67 83 1b 1a 4d cf cd fb 9c f8 ce e2
6f 9c 1a 07 23 85 25 c2 b9 d8 cc fd 3d 9f 90 ee ...]

Is anyone more knowledgeable than I am about how to fix the next bit? Or
is this approach totally wrong?

--- ppp-2.4.3/pppd/ccp.c        2006-02-08 14:28:03.000000000 +0000
+++ ppp-2.4.3/pppd/ccp.c        2006-02-08 14:30:45.000000000 +0000
@@ -1157,9 +1157,16 @@
                         break;
                     }
                 } else {
-                   /* Neither are set. */
-                   newret = CONFREJ;
-                   break;
+                   /* Neither are set. NAK with the best we support */
+                   if (ao->mppe & MPPE_OPT_128)
+                       ho->mppe |= MPPE_OPT_128;
+                   else if (ao->mppe & MPPE_OPT_40)
+                       ho->mppe |= MPPE_OPT_40;
+                   else {
+                       newret = CONFREJ;
+                       break;
+                   }
+                   newret = CONFNAK;
                 }

                 /* rebuild the opts */

Is anyone more knowledgeable than I am an
