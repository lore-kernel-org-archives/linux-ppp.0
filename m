From: Nicolas Olivier <nolivier@alphalink.fr>
Date: Wed, 15 Sep 2004 12:52:54 +0000
Subject: Multiple I/O on a serial device
Message-Id: <41483B26.7040708@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hello,

I'm trying to setup multiple instances of locals ppp in order to test a L2TP daemon.
The problem, is that once ppp sets up the line discipline nothing can be read from or
written to the associated serial device. So I was wondering if there was an easy way
to do multiple I/O on a serial, or maybe "link" I/O of two serials.
If anyone has suggestions, it would be greatly appreciated.

Nicolas Olivier
