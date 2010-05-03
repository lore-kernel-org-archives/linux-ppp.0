From: David Miller <davem@davemloft.net>
Date: Mon, 03 May 2010 20:27:14 +0000
Subject: Re: [PATCH v2 2/2] ppp_generic: handle non-linear skbs when
Message-Id: <20100503.132714.09765870.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <4BDF2FD5.2030509@simon.arlott.org.uk>
	<4BDF300B.1040103@simon.arlott.org.uk>
In-Reply-To: <4BDF300B.1040103@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: simon@fire.lp0.eu
Cc: netdev@vger.kernel.org, paulus@samba.org, linux-ppp@vger.kernel.org

From: Simon Arlott <simon@fire.lp0.eu>
Date: Mon, 03 May 2010 21:20:27 +0100

> Frequently when using PPPoE with an interface MTU greater than 1500,
> the skb is likely to be non-linear. If the skb needs to be passed to
> pppd then the skb data must be read correctly.
> 
> The previous commit fixes an issue with accidentally sending skbs
> to pppd based on an invalid read of the protocol type. When that
> error occurred pppd was reading invalid skb data too.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>

Applied.
