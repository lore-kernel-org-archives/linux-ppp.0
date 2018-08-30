From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Aug 2018 11:47:37 +0000
Subject: Re: [PATCH net-next 5/5] ppp: handle PPPIOCGIDLE for 64-bit time_t
Message-Id: <CAK8P3a0B0u7dRajmTKZwXnuxjAiARJJTQguB1RUsEASDbq7TkA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180829140409.833488-1-arnd@arndb.de> <20180829140409.833488-5-arnd@arndb.de>
 <20180830110601.GA19534@alphalink.fr>
In-Reply-To: <20180830110601.GA19534@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: g.nault@alphalink.fr
Cc: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Karsten Keil <isdn@linux-pingi.de>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

On Thu, Aug 30, 2018 at 1:06 PM Guillaume Nault <g.nault@alphalink.fr> wrote:
> On Wed, Aug 29, 2018 at 04:03:30PM +0200, Arnd Bergmann wrote:

> > @@ -743,10 +744,17 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >               err = 0;
> >               break;
> >
> > -     case PPPIOCGIDLE:
> > -             idle.xmit_idle = (jiffies - ppp->last_xmit) / HZ;
> > -             idle.recv_idle = (jiffies - ppp->last_recv) / HZ;
> > -             if (copy_to_user(argp, &idle, sizeof(idle)))
> > +     case PPPIOCGIDLE32:
> > +                idle32.xmit_idle = (jiffies - ppp->last_xmit) / HZ;
> > +                idle32.recv_idle = (jiffies - ppp->last_recv) / HZ;
> > +                if (copy_to_user(argp, &idle32, sizeof(idle32)))
> >
> Missing 'break;'
>
> > +             err = 0;
> > +             break;
> > +
> > +     case PPPIOCGIDLE64:
> > +             idle64.xmit_idle = (jiffies - ppp->last_xmit) / HZ;
> > +             idle64.recv_idle = (jiffies - ppp->last_recv) / HZ;
> > +             if (copy_to_user(argp, &idle32, sizeof(idle32)))
> >
> I guess you meant 'idle64' instead of 'idle32'.

Good catch, fixing up both now.

Thanks for the review!

     Arnd
