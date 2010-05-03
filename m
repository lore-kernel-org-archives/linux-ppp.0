From: David Miller <davem@davemloft.net>
Date: Mon, 03 May 2010 20:27:09 +0000
Subject: Re: [PATCH v2 1/2] ppp_generic: pull 2 bytes so that
Message-Id: <20100503.132709.266105694.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <4BDF2FD5.2030509@simon.arlott.org.uk>
In-Reply-To: <4BDF2FD5.2030509@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: simon@fire.lp0.eu
Cc: netdev@vger.kernel.org, paulus@samba.org, linux-ppp@vger.kernel.org

From: Simon Arlott <simon@fire.lp0.eu>
Date: Mon, 03 May 2010 21:19:33 +0100

> In ppp_input(), PPP_PROTO(skb) may refer to invalid data in the skb.
> 
> If this happens and (proto >= 0xc000 || proto = PPP_CCPFRAG) then
> the packet is passed directly to pppd.
> 
> This occurs frequently when using PPPoE with an interface MTU
> greater than 1500 because the skb is more likely to be non-linear.
> 
> The next 2 bytes need to be pulled in ppp_input(). The pull of 2
> bytes in ppp_receive_frame() has been removed as it is no longer
> required.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>

Applied.
