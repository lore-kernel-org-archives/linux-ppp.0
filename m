From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 21 Mar 2011 11:02:14 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and
Message-Id: <20110321110214.5174f1b2@lxorguk.ukuu.org.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq>
	<4D864A82.4090104@fastmail.fm>
	<20110320215826.79cadfe2@lxorguk.ukuu.org.uk>
	<4D87173D.50906@suse.cz>
In-Reply-To: <4D87173D.50906@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: Jack Stone <jwjstone@fastmail.fm>, Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Jiri Slaby <jirislaby@gmail.com>

> Anyway is the test needed at all? I.e. could
> tty->ops->write/chars_in_buffer/ntty_write_room be called with
> port->port.count = 0 at all?

I'm not entirely sure what the Nozomi driver is trying to do. Generally
any case a driver is looking at port->port.count it's a bug and should
not matter with the tty krefs. However the chances are it should be
testing *something* instead in this case.

Alan
