From: Petr Slansky <slansky@usa.net>
Date: Tue, 14 Dec 2004 20:16:16 +0000
Subject: Re: No xon/xoff support in Linux ppp driver?
Message-Id: <853iLNuqq8480S01.1103055376@uwdvg001.cms.usa.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
In-Reply-To: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill,

from my point of view, it is not important where the code for XON/XOFF is
coded, it is important for me if it works or not. So, do you have any
configuartion in that pppd (or kppp or whatever) handles xonxoff mode
correctly?

I guess problem is in n_tty.c:

static inline void n_tty_receive_char(struct tty_struct *tty, unsigned char
c)
{
        unsigned long flags;
 
         if (tty->raw) {
                 put_tty_queue(c, tty);
                 return;
         }

This is reason why no xon/xoff is in ppp as ppp works in raw mode (is this
true?)... This is just a guess, no prove for it. But I have prove taht XOFF
from mobile is ignored by Linux

I use pppd with parameters like this:
/dev/ttyS0 57600 local lock xonxoff asyncmap a0000

With regards,
Petr

------ Original Message ------
Received: Tue, 14 Dec 2004 08:39:02 PM CET
From: Bill Unruh <unruh@physics.ubc.ca>
To: Petr Slansky <slansky@usa.net>Cc: linux-ppp@vger.kernel.org
Subject: Re: No xon/xoff support in Linux ppp driver?

> On Tue, 14 Dec 2004, Petr Slansky wrote:
> > 
> > do you know why no xon/xoff support is in Linux ppp kernel driver?
> 
> That is usually something for the low level hardware driver not for ppp.
> Eg the serial port driver under \linux certainly does have xon/xoff
> support. How do you connect to your phone?
> 
> > 
> > http://www.ussg.iu.edu/hypermail/linux/kernel/0307.3/0739.html
> > http://www.cs.helsinki.fi/linux/linux-kernel/2003-23/0103.html
> > 
> > It was big supprise for me yesterday when I found that Windows ppp client
has
> > significantly better performance when I connect over GSM. I use Siemens
mobile
> > and it has no wires for RTS/CTS handshaking and software data flow
control
> > have to be used. Later I found with serial line analyser that Linux
ignores
> > xoff characters send by mobile even pppd is configured to xonxoff mode.
> > 
> > I beleive this is a serious issue. Do you know why this feature is ignored
in
> > Linux ppp driver for ages? I checked sources and cannot find xon/xoff
support
> > in 2.4.27 and 2.6.9 kernels. Do you know why? Many mobile GSM phones have
to
> > use software data flow control (only rx, tx and gnd wires, no rts and
cts). I
> > found some patches on the internet but I cannot find those submited in
the
> > kernel...
> > 
> > Thanks for your help,
> > Petr
> > 
> > 
> > ---------------------------------
> >   Petr Slansky, slansky@usa.net
> > ---------------------------------
> > 
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 
> -- 
> William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
> Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
> UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
> Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
> 



---------------------------------
  Petr Slansky, slansky@usa.net
---------------------------------


