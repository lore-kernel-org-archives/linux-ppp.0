From: Xie He <xie.he.0141@gmail.com>
Date: Fri, 01 Jan 2021 01:37:44 +0000
Subject: Re: [PATCH] net: remove disc_data_lock in ppp line discipline
Message-Id: <20210101013744.72562-1-xie.he.0141@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20201228071550.15745-1-gao.yanB@h3c.com>
In-Reply-To: <20201228071550.15745-1-gao.yanB@h3c.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gao Yan <gao.yanB@h3c.com>
Cc: paulus@samba.org, davem@davemloft.net, kuba@kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

> In tty layer, it use tty->ldisc_sem to proect tty_ldisc_ops.
> So I think tty->ldisc_sem can also protect tty->disc_data;

It might help by CC'ing TTY people, so that we could get this reviewed by
people who are familiar with TTY code.

Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:TTY LAYER)
Jiri Slaby <jirislaby@kernel.org> (supporter:TTY LAYER)

Thanks!

> For examlpe,
> When cpu A is running ppp_synctty_ioctl that hold the tty->ldisc_sem,
> at the same time  if cpu B calls ppp_synctty_close, it will wait until
> cpu A release tty->ldisc_sem. So I think it is unnecessary to have the
> disc_data_lock;
> 
> cpu A                           cpu B
> tty_ioctl                       tty_reopen
>  ->hold tty->ldisc_sem            ->hold tty->ldisc_sem(write), failed
>  ->ld->ops->ioctl                 ->wait...
>  ->release tty->ldisc_sem         ->wait...OK,hold tty->ldisc_sem
>                                     ->tty_ldisc_reinit
>                                       ->tty_ldisc_close
>                                         ->ld->ops->close

IMHO an example might not be necessary. Examples are useful to show
incorrectness. But we cannot show correctness by examples because
examples are not exhaustive.

BTW, there're some typos:
"proect" -> "protect"
"examlpe" -> "example"
"that hold ..." -> "that holds ..."
"cpu A release ..." -> "cpu A releases ..."

>   * FIXME: this is no longer true. The _close path for the ldisc is
>   * now guaranteed to be sane.
>   */

>   *
>   * FIXME: Fixed in tty_io nowadays.
>   */

Since you are removing "disc_data_lock", please update (or remove) these
two comments. Thanks!
