From: Christoph Schulz <develop@kristov.de>
Date: Tue, 13 Jan 2015 21:56:33 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <20150113225633.17486bmcnrxa4osx@berry.schulz.ip-v6.eu>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello!

James Carlson schrieb am Tue, 13 Jan 2015 16:31:29 -0500:

> Not so much "wrong" as "pointless."  Why bother to ask for less?  You
> don't have to pad the packets out to the full MRU, so why do you care
> what the peer has advertised as a maximum?  All that matters is that (by
> acking the value) you've promised not to send anything bigger.  By
> adhering to a smaller limit, you're certainly in compliance with the
> peer's limitations.

Yes. However, the problem lies in the mechanism the Linux kernel  
determines the MTU of a link in a multilink bundle: It simply takes  
the peer's MRU we ACKed. Obviously this is not correct if we are bound  
to use a smaller (channel) MTU due to other constraints (tunnel  
overhead). But there is currently no possibility to tell the Linux  
kernel what channel MTU to use.


Regards,

Christoph Schulz

