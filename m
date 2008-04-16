From: "Sascha Kiefer" <sk@intertivity.com>
Date: Wed, 16 Apr 2008 16:28:31 +0000
Subject: Install ppp modules
Message-Id: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I have a v-server; godaddy.com ist my provider

Linux ip-xxx-xxx-xxx-xxx.ip.secureserver.net 2.6.9-023stab043.1-smp #1 SMP
Mon Mar 5 16:35:19 MSK 2007 i686 i686 i386 GNU/Linux

Ppp is not in the kernel

/usr/sbin/pppd says:

/usr/sbin/pppd: This system lacks kernel support for PPP.  This could be
because
the PPP kernel module could not be loaded, or because PPP was not
included in the kernel configuration.  If PPP was included as a
module, try `/sbin/modprobe -v ppp'.  If that fails, check that
ppp.o exists in /lib/modules/`uname -r`/net.
See README.linux file in the ppp distribution for more details.

/sbin/modprobe -v ppp says:
FATAL: Module ppp not found.

Ok. I guess i can not rebuild the kernel.
What other options do i have?
I'm not that fmiliar with linux so please be gentle! ;)

Regards,
Sascha


