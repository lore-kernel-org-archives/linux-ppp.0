From: Gaoyan <gao.yanB@h3c.com>
Date: Tue, 05 Jan 2021 07:14:21 +0000
Subject: Re: [PATCH] [v2]net:ppp: remove disc_data_lock in ppp line discipline
Message-Id: <1eb0a5f2eb524fbe83eac2349132e09d@h3c.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <gregkh@linuxfoundation.org>, "kuba@kernel.org" <kuba@kernel.org>
Cc: "jirislaby@kernel.org" <jirislaby@kernel.org>, "paulus@samba.org" <paulus@samba.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

Hi Greg KH:

On Fri, 1 Jan 2021 09:18:48 +0100, Greg KH wrote:
>On Fri, Jan 01, 2021 at 11:37:18AM +0800, Gao Yan wrote:
>> In tty layer, it provides tty->ldisc_sem to protect all tty_ldisc_ops
>> including ppp_sync_ldisc. So I think tty->ldisc_sem can also protect
>> tty->disc_data, and the disc_data_lock is not necessary.
>>
>> Signed-off-by: Gao Yan <gao.yanB@h3c.com>
>> ---
>>  drivers/net/ppp/ppp_async.c   | 11 ++---------
>>  drivers/net/ppp/ppp_synctty.c | 12 ++----------
>>  2 files changed, 4 insertions(+), 19 deletions(-)
>
>What changed from v1?

just change some description.

>And how did you test this?  Why remove this lock, is it causing problems s=
omewhere for it to be here?

Somedays ago, There is a problem of 4.14 kernel in n_tty line discipline. S=
pecific description is here:
Link: https://lkml.org/lkml/2020/12/9/339

At the beginning I tried to add a lock in the layer of n_tty, until I find =
the patch that helps me a lot.
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?h=3Dv5.9-rc4&id=83d817f41070c48bc3eb7ec18e43000a548fca5c
About the patch, Specific description is here:
Link: https://lkml.org/lkml/2018/8/29/555

So after referring to the previous patch, it is unnecessary to add a lock t=
o protect disc_data in n_tty_close and n_tty_flush_buffer. And=20
I think it is the same with ppp line discipline.

More detailed explanation:
We have a potential race on dereferencing tty->disc_data, so we should use =
some locks to avoid the competition.
In the current version, it defines disc_data_lock to protect the race of pp=
p_asynctty_receive and ppp_asynctty_close.
However, I think when cpu A is running ppp_asynctty_receive, another cpu B =
will not run ppp_asynctty_close at the same time.
The reasons are as follows:

Cpu A will hold tty->ldisc_sem before running ppp_asynctty_receive. If cpu =
B wants to run ppp_asynctty_close,
it must wait until cpu A release tty->ldisc_sem after ppp_asynctty_receive.

So I think tty->ldisc_sem already can protect the tty->disc_data in ppp lin=
e discipline just like n_tty line discipline.

Thanks.
Gao Yan

>Signed-off-by: Gao Yan <gao.yanB@h3c.com>
>---
> drivers/net/ppp/ppp_async.c   | 11 ++---------
> drivers/net/ppp/ppp_synctty.c | 12 ++----------
> 2 files changed, 4 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
>index 29a0917a8..20b50facd 100644
>--- a/drivers/net/ppp/ppp_async.c
>+++ b/drivers/net/ppp/ppp_async.c
>@@ -127,17 +127,13 @@ static const struct ppp_channel_ops async_ops =3D {
>  * FIXME: this is no longer true. The _close path for the ldisc is
>  * now guaranteed to be sane.
>  */
>-static DEFINE_RWLOCK(disc_data_lock);
>
> static struct asyncppp *ap_get(struct tty_struct *tty)
> {
>-   struct asyncppp *ap;
>+   struct asyncppp *ap =3D tty->disc_data;
>
>-   read_lock(&disc_data_lock);
>-   ap =3D tty->disc_data;
>    if (ap !=3D NULL)
>        refcount_inc(&ap->refcnt);
>-   read_unlock(&disc_data_lock);
>    return ap;
> }
>
>@@ -214,12 +210,9 @@ ppp_asynctty_open(struct tty_struct *tty)
> static void
> ppp_asynctty_close(struct tty_struct *tty)
> {
>-   struct asyncppp *ap;
>+   struct asyncppp *ap =3D tty->disc_data;
>
>-   write_lock_irq(&disc_data_lock);
>-   ap =3D tty->disc_data;
>    tty->disc_data =3D NULL;
>-   write_unlock_irq(&disc_data_lock);
>    if (!ap)
>        return;
>
>diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
>index 0f338752c..53fb68e29 100644
>--- a/drivers/net/ppp/ppp_synctty.c
>+++ b/drivers/net/ppp/ppp_synctty.c
>@@ -129,17 +129,12 @@ ppp_print_buffer (const char *name, const __u8 *buf,=
 int count)
>  *
>  * FIXME: Fixed in tty_io nowadays.
>  */
>-static DEFINE_RWLOCK(disc_data_lock);
>-
> static struct syncppp *sp_get(struct tty_struct *tty)
> {
>-   struct syncppp *ap;
>+   struct syncppp *ap =3D tty->disc_data;
>
>-   read_lock(&disc_data_lock);
>-   ap =3D tty->disc_data;
>    if (ap !=3D NULL)
>        refcount_inc(&ap->refcnt);
>-   read_unlock(&disc_data_lock);
>    return ap;
> }
>
>@@ -213,12 +208,9 @@ ppp_sync_open(struct tty_struct *tty)
> static void
> ppp_sync_close(struct tty_struct *tty)
> {
>-   struct syncppp *ap;
>+   struct syncppp *ap =3D tty->disc_data;
>
>-   write_lock_irq(&disc_data_lock);
>-   ap =3D tty->disc_data;
>    tty->disc_data =3D NULL;
>-   write_unlock_irq(&disc_data_lock);
>    if (!ap)
>        return;
>
>--
>2.17.1
>
