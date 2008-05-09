From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 09 May 2008 19:33:12 +0000
Subject: Re: PPPd ioctl, please help!
Message-Id: <18468.42744.650394.506210@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <17153241.post@talk.nabble.com>
In-Reply-To: <17153241.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

rketcham writes:
> Yea, this SPI driver was my first adventure into linux drivers so I may need
> you to lead me through some of this.

I just diagnosed the problem; you should find someone with much more
Linux tty driver experience to help you out.

> When I first started I thought that a
> char driver would be exactly what I needed. Now it seems that I should have
> created a tty driver instead but I would rather try to get around that if
> it's possible and not too hard.

I doubt that'd be very easy.  You'd have to replicate most of what
tty_io already does, and that seems fairly pointless and fragile.  Any
change to that subsystem will likely blow your driver's duplicate
logic away.

> Given my limited experience in driver design would you recommend rewriting
> the driver as a tty driver (I'm guessing this would involve interfacing with
> tty_io.c) or is there another way? I was hoping to handle the ioctl myself.
> Would I need to include if_ppp.h?

If it were mine, I'd take a look at one of the existing tty hardware
drivers (drivers/serial/21285.c looks simple enough) and use that as a
template.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
