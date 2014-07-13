From: Christoph Schulz <develop@kristov.de>
Date: Sun, 13 Jul 2014 13:06:34 +0000
Subject: Re: [PATCH net-next] net: ppp: don't call sk_chk_filter twice
Message-Id: <53C2845A.3080009@kristov.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <53BF8DEC.4000307@kristov.de> <CAADnVQLQR9fYVGfxfnwpirXt4CwBUzr36tJL+aEoo0err7cppw@mail.gmail.com> <20140712231126.103531fxfrk9sola@kristov.noip.me> <53C25EF9.7030909@redhat.com>
In-Reply-To: <53C25EF9.7030909@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Borkmann <dborkman@redhat.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, isdn@linux-pingi.de

Hello!

Am 13.07.2014 12:27, schrieb Daniel Borkmann:

> I think the patch makes sense, and you could submit it against net tree
> (so 'PATCH net' in subject) with a slightly different commit log at the
> beginning, but the rest could stay explaining that that's the case for
> 3.15. By that, this could then be picked up into the net tree and thus
> Dave can queue it for stable inclusion. If you need any help, let me know.

I have just resubmitted the patch and hope I did it better this time.
Please let me know whether the commit log is correct now.


Thank you,

Christoph Schulz

