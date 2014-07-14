From: David Miller <davem@davemloft.net>
Date: Mon, 14 Jul 2014 06:28:14 +0000
Subject: Re: [PATCH net-next] net: filter: sk_chk_filter() no longer mangles filter
Message-Id: <20140713.232814.1618910912826730440.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAADnVQLQR9fYVGfxfnwpirXt4CwBUzr36tJL+aEoo0err7cppw@mail.gmail.com>
	<53C10C8A.70706@redhat.com>
	<1405172956.3515.41.camel@edumazet-glaptop2.roam.corp.google.com>
In-Reply-To: <1405172956.3515.41.camel@edumazet-glaptop2.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric.dumazet@gmail.com
Cc: dborkman@redhat.com, alexei.starovoitov@gmail.com, develop@kristov.de, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, paulus@samba.org, isdn@linux-pingi.de

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sat, 12 Jul 2014 15:49:16 +0200

> From: Eric Dumazet <edumazet@google.com>
> 
> Add const attribute to filter argument to make clear it is no
> longer modified.
> 
> Signed-off-by: Eric Dumazet <edumazet@google.com>

Applied, thanks Eric.
