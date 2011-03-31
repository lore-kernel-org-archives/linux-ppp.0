From: Jiri Slaby <jslaby@suse.cz>
Date: Thu, 31 Mar 2011 20:53:59 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and
Message-Id: <4D94E9E7.2050600@suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq>	<4D864A82.4090104@fastmail.fm>	<20110320215826.79cadfe2@lxorguk.ukuu.org.uk>	<4D87173D.50906@suse.cz> <20110321110214.5174f1b2@lxorguk.ukuu.org.uk>
In-Reply-To: <20110321110214.5174f1b2@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jack Stone <jwjstone@fastmail.fm>, Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Jiri Slaby <jirislaby@gmail.com>

On 03/21/2011 12:02 PM, Alan Cox wrote:
>> Anyway is the test needed at all? I.e. could
>> tty->ops->write/chars_in_buffer/ntty_write_room be called with
>> port->port.count = 0 at all?
> 
> I'm not entirely sure what the Nozomi driver is trying to do. Generally
> any case a driver is looking at port->port.count it's a bug and should
> not matter with the tty krefs. However the chances are it should be
> testing *something* instead in this case.

Well, I looked into the history of the driver and into the driver
itself. What I've found out is:

* tty_sem is useless now. It was used to protect port->tty_open_count
which was later switched to port->port.count. The lock should have been
switched to port->lock at that time too.

* the port->port.count = 0 tests are an illusion of protection against
race with hup.

IOW both of them are crap nowadays. The former doesn't protect anything,
the latter is not protected by anything.

What is the proper way to avoid a race with HUP in tty->ops->write,
chars_in_buffer, ntty_write_room and possibly others?

I looked into the drivers, moxa tests tty->driver_data (why? [1]), mxser
does nothing as well as rocket and many others. What is the reference
driver I should look into?

[1] Perhaps leftover from when moxa_shutdown used to NULL it.

I don't see why the driver should care at all. It has a tty,
tty->driver_data and thus all the HW info. So it should ignore the race,
i.e. test nothing, right?

thanks,
-- 
js
suse labs
