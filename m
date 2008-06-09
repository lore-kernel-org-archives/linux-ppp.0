From: Alan Cox <alan@redhat.com>
Date: Mon, 09 Jun 2008 21:03:11 +0000
Subject: Re: possible bug on ppp_async
Message-Id: <20080609210311.GC4009@devserv.devel.redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
In-Reply-To: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Jun 09, 2008 at 03:23:33PM -0300, Gustavo Fernando Padovan wrote:
> The problem occurs when the execution enters on switch's default case
> and call tty_mode_ioctl() and the cmd is not TCGETS or cmd is not
> TCGETA. I don't know why this happens, but happens. On kernel 2.6.23

Which ioctl is making it go silly ?

> tty_mode_ioctl(). This is the unique real change between the two
> versions, the others are only code restructuring. Then I made this
> patch to revert part of changes and make modem works again. I don't
> know if this is correct. I just put the modem to work.

It's very useful as we now know what change has had the effect, but not
what your pppd is doing which is breaking it (and thus where the real bug
may lie)

> --- a/drivers/net/ppp_async.c.     2008-06-09 13:12:25.000000000 -0300
> +++ b/drivers/net/ppp_async.c      2008-06-09 13:15:57.000000000 -0300
> @@ -309,6 +309,11 @@
>                 err = 0;
>                 break;
> 
> +       case TCGETS:
> +       case TCGETA:
> +               err = tty_mode_ioctl(tty, file, cmd, arg);
> +               break;
> +
>         case TCFLSH:
>                 /* flush our buffers and the serial port's buffer */
>                 if (arg = TCIOFLUSH || arg = TCOFLUSH)
> @@ -324,8 +329,7 @@
>                 break;
> 
>         default:
> -               /* Try the various mode ioctls */
> -               err = tty_mode_ioctl(tty, file, cmd, arg);
> +               err = -ENOIOCTLCMD;

Can you add a printk to log which ioctl calls end up here and what they
return (both with/without the patch). That should give the needed info to
identify what is being done and returned which then breaks it.

From that I can work out what is going on and what the right fix may be.

Alan

