From: David Miller <davem@davemloft.net>
Date: Tue, 01 Jun 2010 22:15:10 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP
Message-Id: <20100601.151510.137832050.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTil7fk_ikrSPiZnqcJSLGCrzcCrCwbeuUMY5Yu5v@mail.gmail.com>
	<4C04ECA3.1080905@netservers.co.uk>
	<AANLkTinpsIs7qMSpQ78fWCTHh03iLBIwRlsU7sqJau08@mail.gmail.com>
In-Reply-To: <AANLkTinpsIs7qMSpQ78fWCTHh03iLBIwRlsU7sqJau08@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richih.mailinglist@gmail.com
Cc: ben@netservers.co.uk, paulus@samba.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, alan@lxorguk.ukuu.org.uk, patrakov@gmail.com, linux-kernel@vger.kernel.org

From: Richard Hartmann <richih.mailinglist@gmail.com>
Date: Tue, 1 Jun 2010 13:28:59 +0200

> Maybe not a bug in the Linux kernel itself, but certainly in the real world
> that exists around Linux. Similar to how a change to a device driver that
> is needed to work around broken hardware is a bug fix, imo.

It's not the same situation at all.

It is easier to fix misconfigured products that exist because of
software and configurations than it is to fix a physical piece of
hardware.

So you could work around it if you wanted to.

I definitely don't see this as -stable material, as a result.  We will
push it to net-next-2.6 and it will thus hit 2.6.36 as previously
mentioned.
