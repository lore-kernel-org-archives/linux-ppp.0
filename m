From: Petr Slansky <slansky@usa.net>
Date: Wed, 15 Dec 2004 00:19:00 +0000
Subject: Re: No xon/xoff support in Linux ppp driver?
Message-Id: <170iLoaTa2336S02.1103069940@uwdvg002.cms.usa.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
In-Reply-To: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> > do you know why no xon/xoff support is in Linux ppp kernel driver?
> 
> The support is in the 2.6 kernel (though not in 2.4 yet) and it should
> work.  On the kernel side, look for I_IXON in drivers/net/ppp_async.c.
> In pppd, the `crtscts' variable is set to -2 for xonxoff, and
> set_up_tty() in sys-linux.c then sets the IXON and IXOFF flags.

Thank you Paul, this is perfect answer. I tested it only with 2.4.21 kernel
until now. So I have to upgrade my system to 2.6.x to have this basic fature.
I missed that update in ppp_async.c. Looks good! Is there any reason why it
was not backported to 2.4, 2.2, 2.0 yet? This modification is in 2.6 kernel
for several months now (from 2.6.1?).
 
Thanks for yor help,
Petr


---------------------------------
  Petr Slansky, slansky@usa.net
---------------------------------


