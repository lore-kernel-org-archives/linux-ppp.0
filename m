From: Paul Mackerras <paulus@samba.org>
Date: Tue, 14 Dec 2004 22:04:55 +0000
Subject: Re: No xon/xoff support in Linux ppp driver?
Message-Id: <16831.25479.928812.8142@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
In-Reply-To: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Petr Slansky writes:

> do you know why no xon/xoff support is in Linux ppp kernel driver?

The support is in the 2.6 kernel (though not in 2.4 yet) and it should
work.  On the kernel side, look for I_IXON in drivers/net/ppp_async.c.
In pppd, the `crtscts' variable is set to -2 for xonxoff, and
set_up_tty() in sys-linux.c then sets the IXON and IXOFF flags.

If it isn't working, that's a bug and we should fix it.  Running pppd
under strace to check that it is actually setting IXON and IXOFF would
be a start.

Paul.
