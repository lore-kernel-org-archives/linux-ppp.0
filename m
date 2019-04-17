From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Apr 2019 22:03:07 +0000
Subject: Re: [PATCH v3 02/26] compat_ioctl: move simple ppp command handling into driver
Message-Id: <CAK8P3a1tiRew6uqegUXsKbNQG7=sPVFMY3yXf0M7OjJdkxM=_g@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de> <20190416202013.4034148-3-arnd@arndb.de>
 <20190417211303.GU2217@ZenIV.linux.org.uk>
In-Reply-To: <20190417211303.GU2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Michal Ostrowski <mostrows@earthlink.net>, Dmitry Kozlov <xeb@mail.ru>, James Chapman <jchapman@katalix.com>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>

On Wed, Apr 17, 2019 at 11:13 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Apr 16, 2019 at 10:19:40PM +0200, Arnd Bergmann wrote:
> > diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> > index c708400fff4a..04252c3492ee 100644
> > --- a/drivers/net/ppp/ppp_generic.c
> > +++ b/drivers/net/ppp/ppp_generic.c
> > @@ -899,6 +899,7 @@ static const struct file_operations ppp_device_fops = {
> >       .write          = ppp_write,
> >       .poll           = ppp_poll,
> >       .unlocked_ioctl = ppp_ioctl,
> > +     .compat_ioctl   = ppp_ioctl,
>
> Oh?  What happens on e.g. s390 with something like PPPIOCNEWUNIT?
> Current kernel:
>         * no ->compat_ioctl()
>         * ->unlock_ioctl() is present
>         * found by compat_ioctl_check_table()
>         * pass (unsigned long)compat_ptr(arg) to do_vfs_ioctl()
>         * pass that to ppp_ioctl()
>         * pass that to ppp_unattached_ioctl()
>         * fetch int from (int __user *)compat_ptr(arg)
>
> With your patch:
>         * call ppp_ioctl()
>         * pass arg to ppp_unattached_ioctl()
>         * fetch int from (int __user *)arg
>
> AFAICS, that's broken...

Correct. I had added this patch to the series from an older set of
patches (predating
the compat_ptr_ioctl() series) , and did not check for this issue again. When
I originally created the patch, I assumed that even on s390 it would be no
problem.

> Looking at that ppp_ioctl(),
> pointer to arch-independent type or ignored:
>         PPPIOCNEWUNIT PPPIOCATTACH PPPIOCATTCHAN PPPIOCSMRU PPPIOCSFLAGS
>         PPPIOCGFLAGS PPPIOCGUNIT PPPIOCSDEBUG PPPIOCSMAXCID PPPIOCCONNECT
>         PPPIOCGDEBUG PPPIOCSMAXCID PPPIOCSMRRU
>         PPPIOCDETACH PPPIOCDISCONN
>         PPPIOCGASYNCMAP PPPIOCSASYNCMAP PPPIOCGRASYNCMAP PPPIOCSRASYNCMAP
>         PPPIOCGXASYNCMAP PPPIOCSXASYNCMAP
>         PPPIOCGNPMODE PPPIOCSNPMODE
> pointer to struct ppp_option_data (with further pointer-chasing in it):
>         PPPIOCSCOMPRESS
> pointer to struct ppp_idle:
>         PPPIOCGIDLE
> pointer to struct sock_filter (with hidden pointer-chasing, AFAICS):
>         PPPIOCSPASS PPPIOCSACTIVE
>
> Pretty much all of them take pointers.  What's more, reaction to
> unknown is -ENOTTY, not -ENOIOCTLCM, so that patch will have
> prevent the translated ones from reaching do_ioctl_trans()

Good point, this patch sequence does break bisection.

> What am I missing here?  Why not simply do
>
> compat_ppp_ioctl()
> {
>         PPPIOCSCOMPRESS32 => deal with it
>         PPPIOCGIDLE32 => deal with it
>         PPPIOCSPASS32 / PPPIOCSACTIVE32 => deal with it
>         default: pass compat_ptr(arg) to ppp_ioctl() and be done with that
> }
>
> with BPF-related bits (both compat and native) taken to e.g. net/core/bpf-ppp.c,
> picked by both generic and isdn?  IDGI...

I was trying to unify the native and compat code paths as much
as possible here. Handling the four PPPIO*32 commands in
compat_ppp_ioctl would either require duplicating large chunks
of ppp_ioctl, or keeping the extra compat_alloc_user_space()
copy from the existing implementation.

I'll try to come up with a different way to structure the patches.

      Arnd
