From: James Chapman <jchapman@katalix.com>
Date: Thu, 16 Sep 2004 07:45:23 +0000
Subject: Re: Multiple I/O on a serial device
Message-Id: <1095320723.414944932a353@www.katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41483B26.7040708@alphalink.fr>
In-Reply-To: <41483B26.7040708@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Have you looked at OpenL2TP?

http://openl2tp.sourceforge.net/

/james

> I'm trying to setup multiple instances of locals ppp in order to
> test a L2TP daemon.
>
> The problem, is that once ppp sets up the line discipline nothing
> can be read from or written to the associated serial device. So I
> was wondering if there was an easy way to do multiple I/O on a
> serial, or maybe "link" I/O of two serials.
>
> If anyone has suggestions, it would be greatly appreciated.


