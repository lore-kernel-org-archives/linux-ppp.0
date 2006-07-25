From: Jan Just Keijser <jan.just.keijser@gmail.com>
Date: Tue, 25 Jul 2006 10:19:00 +0000
Subject: ppp 2.4.4 eap-tls patch
Message-Id: <44C5F014.40202@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi all,

based on Beniamino Galvani's work ( <bengal@interfree.it 
<mailto:bengal@interfree.it>> ) I have created a patch for ppp 2.44 to 
allow EAP-TLS authentication (RFC2716), both in client and server mode, 
including MPPE 40/128 bit encryption. You can find the patch on
  http://www.nikhef.nl/~janjust/ppp/ppp-2.4.4-eaptls-mppe-0.9.patch 
<http://www.nikhef.nl/%7Ejanjust/ppp/ppp-2.4.4-eaptls-mppe-0.9.patch>
The patched code is marked by #ifdef USE_EAPTLS blocks. This allows me 
to enable or disable it in the Makefiles using
  USE_EAPTLS=y|n
respectively.
I have tested the patch on Linux acting as a server, with Windows 2000 
and XP clients as well as a Linux client with the same patch applied.

share and enjoy,

JJK / Jan Just Keijser
