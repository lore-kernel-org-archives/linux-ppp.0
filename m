From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sun, 20 Mar 2011 21:58:26 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and
Message-Id: <20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq>
	<4D864A82.4090104@fastmail.fm>
In-Reply-To: <4D864A82.4090104@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

> +        spin_lock_irqsave(&dc->spin_mutex, flags);
>           if (port->port.count)
>               room = kfifo_avail(&port->fifo_ul);
> -        mutex_unlock(&port->tty_sem);
> +        spin_unlock_irqrestore(&dc->spin_mutex, flags);

dc->spin_mutex does not protect port->port.count.
