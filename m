From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Wed, 06 May 2020 09:52:48 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc-a4ax_RgYLJT71ukkcPasz+z2dU6bm9yiE+k664JhNqA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
>
> On Mon, May 04, 2020 at 06:36:48PM +0200, David Bala=C5=BEic wrote:
> > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > > You can use "%pM" for printing MAC addresses. Also, it'd be interesti=
ng
> > > to have information about promisc mode:
> > >   "dev %s, flags: %#x, promiscuity %u",
> > >   dev->name, dev->flags, dev->promiscuity,
> >
>
> > I'll report later values printed when a stray PADT appears.
> >
> Okay, but please keep printing the destination MAC address of the
> packet. I was providing the flags/promiscuity string just to get extra
> information, not to replace your original log.

This was logged now:

(all at May  6 05:34:50 2020 UTC)
pppoe_disc_rcv PADT received, sid=3D1, SRC: a4:7b:2c:9e:c7:44, DST:
44:4e:6d:fd:c7:39
pppoe_disc_rcv PADT received, own hw addr: c4:XX:XX:XX:XX:ed
      dev eth1.3902, flags: 0x1003, promiscuity 0
pppoe_disc_rcv PADT received, not four our address, ignoring

(the last line is from my fix, the connection is now not dropped when
the PADT is not for us; works fine, my connection stays up and
working)

I'll clean up and post the patch later.

Regards,
David
