From: "F.H" <shred_man@gmx.de>
Date: Mon, 02 Feb 2004 00:03:58 +0000
Subject: not allocating divert_blk for non-ethernet device ppp0 ?
Message-Id: <000b01c3e920$0eacb250$1e01a8c0@apollo.local>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi

I have some problems with my adsl connection. Since I changed the eth1 NIC,
that connects to my dsl modem, the following errormessage is wrote to my
syslog and sometimes, resolving internet hostnames are very slow ? I don't
know what this error mean ? "kernel: divert: not allocating divert_blk for
non-ethernet device ppp0" Can anyone help me to solve this problem ?

I use Redhat 8.0 with a self generated 2.4.21 kernel.

/var/log/firewall

Feb  2 00:46:35 homer kernel: divert: no divert_blk to free, ppp0 not
ethernet
Feb  2 00:46:39 homer kernel: divert: not allocating divert_blk for
non-ethernet device ppp0
Feb  2 00:47:15 homer kernel: divert: no divert_blk to free, ppp0 not
ethernet
Feb  2 00:48:07 homer kernel: divert: not allocating divert_blk for
non-ethernet device ppp0
Feb  2 00:48:56 homer kernel: divert: no divert_blk to free, ppp0 not
ethernet
Feb 02  0:49:10 ** Starting Arno's IPTABLES firewall v1.8.2 **
Feb 02  0:49:11 ** All firewall rules applied **
Feb  2 00:49:14 homer kernel: divert: not allocating divert_blk for
non-ethernet device ppp0

Thank you in advance
Frank


