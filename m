From: rketcham <Rich.Ketcham@gmail.com>
Date: Fri, 09 May 2008 18:34:08 +0000
Subject: Re: PPPd ioctl, please help!
Message-Id: <17154119.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <17153241.post@talk.nabble.com>
In-Reply-To: <17153241.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hey James,

Yea, this SPI driver was my first adventure into linux drivers so I may need
you to lead me through some of this. When I first started I thought that a
char driver would be exactly what I needed. Now it seems that I should have
created a tty driver instead but I would rather try to get around that if
it's possible and not too hard.

Given my limited experience in driver design would you recommend rewriting
the driver as a tty driver (I'm guessing this would involve interfacing with
tty_io.c) or is there another way? I was hoping to handle the ioctl myself.
Would I need to include if_ppp.h?

Thanks,
Rich



James Carlson-2 wrote:
> 
> That last one looks to me like PPPIOCGCHAN.  You're getting this
> because the TIOCSETD ioctl before it didn't set N_PPP mode.
> 
> Did you implement your new device on tty_io.c, or did you just break
> out in your own direction?  If it's the latter (which is consistent
> with your other problems with ioctls), you might want to reconsider
> doing that.
> 
> But if not, then read through the tty subsystem and figure out what
> TIOCSETD does.  You need to do the same.
> 
> -- 
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://www.nabble.com/PPPd-ioctl%2C-please-help%21-tp17153241p17154119.html
Sent from the linux-ppp mailing list archive at Nabble.com.

