From: Simon Chow <simonchow@keytechsys.com.hk>
Date: Wed, 21 Jul 2004 14:33:39 +0000
Subject: pppd and AT+WMUX(Multiplex mode)
Message-Id: <loom.20040721T163210-958@post.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am researching how to handle the AT packets and Data packets offered by
the Wavecom GSM modem in AT+WMUX=1 mode. I want to modify the pppd programme
and I think that the tty.c in pppd may be the key to change. The charshunt
function manipulates both the raw bytes sent from and received by the serial
port. However, I am still in an initial stage.

I wonder if the pppd tool can handle the multiplex mode offered by Wavecom
GSM modem. Thanks.

