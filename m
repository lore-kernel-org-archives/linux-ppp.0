From: Jack Stone <jwjstone@fastmail.fm>
Date: Sun, 20 Mar 2011 23:09:56 +0000
Subject: Re: 'scheduling while atomic' during ppp connection on 2.6.37.1 and 2.6.38
Message-Id: <c66d706d-9bb2-441b-9742-4a7eeac0d01e@email.android.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <fuopaigyaypsqveewtjx@pwmq> <4D864A82.4090104@fastmail.fm> <4D867706.5060304@suse.cz>
In-Reply-To: <4D867706.5060304@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: Mac <kmac@poczta.fm>, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Jiri Slaby <jirislaby@gmail.com>

Jiri Slaby <jslaby@suse.cz> wrote:
>FWIW it looks good to me. Note that the very same problem is in rocket.
>And moxa enables bh interrupts unconditionally before it returns. This
>might (and likely will) make the ppp locking unhappy.
>
>Could you fix that too? (If not, I will take a look at what I can do
>about that.)
>
I'll do my best to have a look but don't hold your breath.

Thanks for looking,

Jack


-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
