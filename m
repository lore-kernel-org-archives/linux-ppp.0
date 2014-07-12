From: Daniel Borkmann <dborkman@redhat.com>
Date: Sat, 12 Jul 2014 15:23:59 +0000
Subject: Re: [PATCH net-next] net: filter: sk_chk_filter() no longer mangles filter
Message-Id: <53C1530F.7020603@redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <53BF8DEC.4000307@kristov.de>  <CAADnVQLQR9fYVGfxfnwpirXt4CwBUzr36tJL+aEoo0err7cppw@mail.gmail.com>  <53C10C8A.70706@redhat.com> <1405172956.3515.41.camel@edumazet-glaptop2.roam.corp.google.com>
In-Reply-To: <1405172956.3515.41.camel@edumazet-glaptop2.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: David Miller <davem@davemloft.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christoph Schulz <develop@kristov.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, isdn@linux-pingi.de

On 07/12/2014 03:49 PM, Eric Dumazet wrote:
> From: Eric Dumazet <edumazet@google.com>
>
> Add const attribute to filter argument to make clear it is no
> longer modified.
>
> Signed-off-by: Eric Dumazet <edumazet@google.com>

Good point, thanks Eric.

Acked-by: Daniel Borkmann <dborkman@redhat.com>
