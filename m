From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Apr 2019 21:44:38 +0000
Subject: Re: [PATCH v3 04/26] compat_ioctl: move PPPIOCSCOMPRESS32 to ppp-generic.c
Message-Id: <CAK8P3a2a0yHv6njhwQYRC4YPdec25BdUJLU-sx6GQF9xqB95XA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de> <20190416202013.4034148-5-arnd@arndb.de>
 <20190417211637.GV2217@ZenIV.linux.org.uk>
In-Reply-To: <20190417211637.GV2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>

On Wed, Apr 17, 2019 at 11:16 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Apr 16, 2019 at 10:19:42PM +0200, Arnd Bergmann wrote:
> > +#ifdef CONFIG_COMPAT
> > +struct ppp_option_data32 {
> > +     compat_caddr_t  ptr;
>
> Huh?  compat_uptr_t, surely?  I realize that compat_ioctl.c is bogus
> that way right now, but let's not spread that crap into the places
> where it's harder to find...

Ok, done.

> >       err = -EFAULT;
> > -     if (copy_from_user(&data, (void __user *) arg, sizeof(data)))
> > -             goto out;
> > +#ifdef CONFIG_COMPAT
> > +     if (compat) {
> > +             struct ppp_option_data32 data32;
> > +
> > +             if (copy_from_user(&data32, (void __user *) arg,
> > +                                sizeof(data32)))
> > +                     goto out;
> > +
> > +             data.ptr = compat_ptr(data32.ptr);
> > +             data.length = data32.length;
> > +             data.transmit = data32.transmit;
> > +     } else
> > +#endif
> > +     {
> > +             if (copy_from_user(&data, (void __user *) arg, sizeof(data)))
> > +                     goto out;
> > +     }
>
> *UGH*
>
> Do that in caller, please.  And sod the flag argument...

Ack, changed it now.

      Arnd
