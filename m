From: Christoph Schulz <develop@kristov.de>
Date: Tue, 13 Jan 2015 22:56:25 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <20150113235625.442050ugwhi2l121@berry.schulz.ip-v6.eu>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello!

James Carlson schrieb am Tue, 13 Jan 2015 17:22:47 -0500:

> Ah, ok.  Are you referring to the individual link MTU rather than the
> bundle's overall MTU?

Yes.

>
> If so, then, yes, that does look like a problem.  It should be possible
> to limit individual link MTU values as desired, but I don't see a good
> way to do it.

Me neither, at least without introducing a system-specific ioctl that  
would have to be explicitly called by pppd. However, perhaps anyone  
has a better idea...

By the way, how does Solaris solve this problem? I see that PPPIO_MTU  
is sent in tty_send_config() in sys-solaris.c for setting the link  
MTU. Is that used when doing multilink PPP? The corresponding function  
in sys-linux.c does not send the link MTU to the kernel, it only saves  
the value in a global static variable "link_mtu" (line 1250) which is  
not used anywhere else.

>
> But, for what it's worth, running MP over a tunneled link sounds like
> extreme weirdness to me.  Unless you're trying to set new records for
> packet loss and link latency, why would you do that?

Don't ask me, ask Matthias-Christian ;-)

But nevertheless there is no obvious reason why it should be  
impossible to make it work.


Regards,

Christoph

