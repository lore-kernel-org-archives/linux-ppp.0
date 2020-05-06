From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Wed, 06 May 2020 15:54:02 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc8pQ+1D=kNJT0OxTMWUqw7U30uMoFUr1vekA9tmkm2UhQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, 6 May 2020 at 17:02, Guillaume Nault <gnault@redhat.com> wrote:
>
> On Mon, May 04, 2020 at 08:43:26PM +0200, David Bala=C5=BEic wrote:
> > On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> > >
> > > Also, what's the driver of your NIC (ethtool -i eth1)?
> >
> > # ethtool  -i eth1
> > driver: ag71xx

This seems to be a driver from the openwrt project :
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dtree;f=3Dtarget/linux/=
ar71xx/files/drivers/net/ethernet/atheros/ag71xx;h=3D3ced45e853aca454e8f745=
a686834ea1cce259f2;hb=3D33732f4a9c17921b782167a0dcaba9703d4e6753
(hopefully still readable)

The official kernel has a driver for this hardware since kernel 5.3.x
(and not before).
(linux-x.y.z/drivers/net/ethernet/atheros/ag71xx.c)

Maybe that one is better and openwrt will use it eventually.
