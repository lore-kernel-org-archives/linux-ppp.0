From: Ben McKeegan <ben@netservers.co.uk>
Date: Tue, 01 Jun 2010 11:18:59 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP 	multi-link
Message-Id: <4C04ECA3.1080905@netservers.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>	<20100326160226.0159ac3b@lxorguk.ukuu.org.uk>	<4BACE827.4070006@gmail.com>	<20100326170428.6c1ad66c@lxorguk.ukuu.org.uk>	<4BB31E00.8060204@netservers.co.uk>	<20100529021624.GA2538@brick.ozlabs.ibm.com> <AANLkTil7fk_ikrSPiZnqcJSLGCrzcCrCwbeuUMY5Yu5v@mail.gmail.com>
In-Reply-To: <AANLkTil7fk_ikrSPiZnqcJSLGCrzcCrCwbeuUMY5Yu5v@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, "Alexander E. Patrakov" <patrakov@gmail.com>, linux-kernel@vger.kernel.org

Richard Hartmann wrote:

> As 2.6.35-rc1 is out, does this mean that we are looking at 2.6.36 at the
> earliest? Or could this make it in as it is
> 
> a) a bug fix

This isn't really a bug fix.  Its a behavioural change to work around 
poor quality/mismatched underlying PPP channels.

Regards,
Ben.
