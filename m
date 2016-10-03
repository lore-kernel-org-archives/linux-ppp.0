From: Manish Kambdur <manish.kambdur@gmail.com>
Date: Mon, 03 Oct 2016 16:51:12 +0000
Subject: Re: Problem: How to force(?) pcomp and accomp
Message-Id: <CAAAUBLT2Scup_ZjZQNo2fLPvqJFiNH61jEt5iTYnmOJVSg-fSg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
In-Reply-To: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I wasn't sure my diagnosis was right till you confirmed it was, thanks a lot.

I was able to get the setup working!

> Assuming you can't find those options present in /etc/ppp/options

I had misunderstood how the command line option "file" works as I was
thinking that it override all other options.

I was starting pppd as `pppd call gprs` (with gprs in /etc/ppp/peers/)
and didn't think that pppd reads both the /etc/ppp/options and gprs
file.

> For what it's worth, I think the peer you're talking to is garbage.  At
> a minimum, any reasonable implementation of PPP should accept the
> defaults, which means that dropping the link just because your end
> doesn't want to do ACFC and PFC is pure nonsense.  How could any
> competent implementation fail to operate without header compression?
> How much do you trust that peer if they can't get the basics of PPP right?

The "peer" here refers to the serial modem or the remote server?
pppd succeeds when I use a modem from a different brand, with the same
SIM and with 'noaccomp' and 'nopcomp'
