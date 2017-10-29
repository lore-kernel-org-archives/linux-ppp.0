From: David Miller <davem@davemloft.net>
Date: Sun, 29 Oct 2017 02:56:05 +0000
Subject: Re: [PATCH] ppp: allow usage in namespaces
Message-Id: <20171029.115605.2002054524331305665.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20171027180823.31144-1-mcroce@redhat.com>
In-Reply-To: <20171027180823.31144-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mcroce@redhat.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Matteo Croce <mcroce@redhat.com>
Date: Fri, 27 Oct 2017 20:08:23 +0200

> Check for CAP_NET_ADMIN with ns_capable() instead of capable()
> to allow usage of ppp in user namespace other than the init one.
> 
> Signed-off-by: Matteo Croce <mcroce@redhat.com>

Ok, applied to net-next.
