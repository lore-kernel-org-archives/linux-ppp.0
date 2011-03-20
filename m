From: Jack Stone <jwjstone@fastmail.fm>
Date: Sun, 20 Mar 2011 23:05:46 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and 2.6.38
Message-Id: <6627fbdd-cce6-4717-8920-3a0d7526274b@email.android.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq> <4D864A82.4090104@fastmail.fm> <20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
In-Reply-To: <20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

>> +        spin_lock_irqsave(&dc->spin_mutex, flags);
>>           if (port->port.count)
>>               room = kfifo_avail(&port->fifo_ul);
>> -        mutex_unlock(&port->tty_sem);
>> +        spin_unlock_irqrestore(&dc->spin_mutex, flags);
>
>dc->spin_mutex does not protect port->port.count.

Sorry if I'm being stupid here but do you mean that port->port.count is modified outside of dc->spin_mutex or that dc->spin_mutex should not be used to protect port->port.count?

I replaced all instances of the port->tty_sem with dc->spin_mutex and port->port.count is only used if dc is non null.

The only other possible problem I see with the change is that the new locking does not allow sleeping in places where it could sleep and disabled irqs where they were not disabled before.

Thank you for your time,

Jack


-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
