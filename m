From: Jiri Slaby <jslaby@suse.cz>
Date: Mon, 21 Mar 2011 09:15:41 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and
Message-Id: <4D87173D.50906@suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq>	<4D864A82.4090104@fastmail.fm> <20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
In-Reply-To: <20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jack Stone <jwjstone@fastmail.fm>, Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Jiri Slaby <jirislaby@gmail.com>

On 03/20/2011 10:58 PM, Alan Cox wrote:
>> +        spin_lock_irqsave(&dc->spin_mutex, flags);
>>           if (port->port.count)
>>               room = kfifo_avail(&port->fifo_ul);
>> -        mutex_unlock(&port->tty_sem);
>> +        spin_unlock_irqrestore(&dc->spin_mutex, flags);
> 
> dc->spin_mutex does not protect port->port.count.

Neither port->tty_sem did.

Anyway is the test needed at all? I.e. could
tty->ops->write/chars_in_buffer/ntty_write_room be called with
port->port.count = 0 at all?

And the lock should not as well be needed. Kfifo assures atomicity where
there is only one reader and one writer which should be the case here.
Unless tty->ops->write can be called in parallel. And it should not,
that's what's tty->atomic_write_lock for.

thanks,
-- 
js
suse labs
