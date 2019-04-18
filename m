From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Apr 2019 15:14:21 +0000
Subject: Re: [PATCH v3 02/26] compat_ioctl: move simple ppp command handling into driver
Message-Id: <CAK8P3a06NdTDVpDn-KWmdc4_562Ge=hYe2Zw39mx5s0FP+KD6Q@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de> <20190416202013.4034148-3-arnd@arndb.de>
 <20190417211303.GU2217@ZenIV.linux.org.uk> <CAK8P3a1tiRew6uqegUXsKbNQG7=sPVFMY3yXf0M7OjJdkxM=_g@mail.gmail.com>
 <20190417235300.GB2217@ZenIV.linux.org.uk>
In-Reply-To: <20190417235300.GB2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Michal Ostrowski <mostrows@earthlink.net>, Dmitry Kozlov <xeb@mail.ru>, James Chapman <jchapman@katalix.com>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>

On Thu, Apr 18, 2019 at 1:53 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Thu, Apr 18, 2019 at 12:03:07AM +0200, Arnd Bergmann wrote:
> > On Wed, Apr 17, 2019 at 11:13 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > On Tue, Apr 16, 2019 at 10:19:40PM +0200, Arnd Bergmann wrote:
> > > > diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> > > > index c708400fff4a..04252c3492ee 100644
_ptr(arg) to ppp_ioctl() and be done with that
> > > }
> > >
> > > with BPF-related bits (both compat and native) taken to e.g. net/core/bpf-ppp.c,
> > > picked by both generic and isdn?  IDGI...
> >
> > I was trying to unify the native and compat code paths as much
> > as possible here. Handling the four PPPIO*32 commands in
> > compat_ppp_ioctl would either require duplicating large chunks
> > of ppp_ioctl, or keeping the extra compat_alloc_user_space()
> > copy from the existing implementation.
> >
> > I'll try to come up with a different way to structure the patches.
>
> Huh?  Instead of
>         case PPPIOCSCOMPRESS:
>                 err = ppp_set_compress(ppp, arg);
>                 break;
> in native, have
>         struct ppp_option_data data;
> ...
>         case PPPIOCSCOMPRESS:
>                 if (copy_from_user(&data, argp, sizeof(data)))
>                         err = -EFAULT;
>                 else
>                         err = ppp_set_compress(ppp, &data);
>                 break;

Right, I ended up with something similar before I saw your message.

> in native and similar in compat, with get_bpf_ppp() replaced
> with call of compat_get_bpf_ppp() and ioctl numbers obviously
> adjusted.  All there is to it...  Helpers obviously shared
> with isdn and yes, all crap gone from fs/compat_ioctl.c...

I would still leave the ISDN side alone, aside from adding
the 64-bit time_t support.

> Why would you want to duplicate large chunks of anything?
> The above is not even compile-tested, but...  I can put
> together a patch if you wish.  Or am I missing something
> here?

I expected that the ppp_compat_ioctl() function would end up
fairly complex, to duplicate the logic before the switch()/case.

What I have now is

static long ppp_compat_ioctl(struct file *file, unsigned int cmd,
unsigned long arg)
{
        struct ppp_file *pf;
        struct ppp *ppp;
        int err = -ENOIOCTLCMD;
        struct ppp_option_data32 data32;
        struct ppp_option_data data;
        void __user *argp = compat_ptr(arg);

        mutex_lock(&ppp_mutex);

        pf = file->private_data;
        if (!pf || pf->kind != INTERFACE)
                goto out;

        ppp = PF_TO_PPP(pf);
        switch (cmd) {
        case PPPIOCSCOMPRESS32:
                if (copy_from_user(&data32, argp, sizeof(data32))) {
                        err = -EFAULT;
                        goto out;
                }

                data.ptr = compat_ptr(data32.ptr);
                data.length = data32.length;
                data.transmit = data32.transmit;

                err = ppp_set_compress(ppp, &data);
                break;

#ifdef CONFIG_PPP_FILTER
        case PPPIOCSPASS32:
                err = compat_get_sock_fprog(&uprog, argp);
                if (err)
                        break;
                err = ppp_set_filter(ppp, &uprog, &ppp->pass_filter);
                break;

        case PPPIOCSACTIVE32:
                err = compat_get_sock_fprog(&uprog, argp);
                if (err)
                        break;
                err = ppp_set_filter(ppp, &uprog, &ppp->active_filter);
                break;
#endif /* CONFIG_PPP_FILTER */

        default:
                break;
        }

out:
        mutex_unlock(&ppp_mutex);

        if (err = -ENOIOCTLCMD)
                err = ppp_ioctl(file, cmd, (unsigned long)compat_ptr(arg));

        return err;
}

Which doesn't look nearly as bad as I had feared, but still is
a larger change to the existing code than what I had before,
so there is a bigger risk that I screwed up somewhere new.

       Arnd
