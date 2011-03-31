From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 31 Mar 2011 21:39:14 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and
Message-Id: <20110331223914.458a36b7@lxorguk.ukuu.org.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq>
	<4D864A82.4090104@fastmail.fm>
	<20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
	<4D87173D.50906@suse.cz>
	<20110321110214.5174f1b2@lxorguk.ukuu.org.uk>
	<4D94E9E7.2050600@suse.cz>
In-Reply-To: <4D94E9E7.2050600@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: Jack Stone <jwjstone@fastmail.fm>, Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Jiri Slaby <jirislaby@gmail.com>

> What is the proper way to avoid a race with HUP in tty->ops->write,
> chars_in_buffer, ntty_write_room and possibly others?

You shouldn't need to do anything in those cases as tty and
tty->driver_data won't be going anywhere. port->tty may go NULL and the
IRQ handlers etc need to get the refs properly and keep refs when needed
so the tty isn't freed under them, but that *should* be all that is
needed if the logic is right.

> I looked into the drivers, moxa tests tty->driver_data (why? [1]), mxser
> does nothing as well as rocket and many others. What is the reference
> driver I should look into?

I think its a delusion from early drivers that never got sorted

> 
> [1] Perhaps leftover from when moxa_shutdown used to NULL it.
> 
> I don't see why the driver should care at all. It has a tty,
> tty->driver_data and thus all the HW info. So it should ignore the race,
> i.e. test nothing, right?

Yes

