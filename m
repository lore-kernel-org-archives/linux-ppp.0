From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 04 May 2020 18:11:59 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200504181159.GA7717@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, May 04, 2020 at 06:36:48PM +0200, David Bala=C5=BEic wrote:
> On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> > to have information about promisc mode:
> >   "dev %s, flags: %#x, promiscuity %u",
> >   dev->name, dev->flags, dev->promiscuity,
>=20
> "ifdown wan" triggers a PADT response from the server, and then this
> code prints:
>=20
>  dev eth1.3902, flags: 0x1003, promiscuity 0
>=20
I'm not sure what "ifdown wan" is supposed to do. Assuming "wan" is the
name of your ppp interface (wasn't it "pppoe-wan" in your previous
logs?) and that ifdown works like on Debian, then it makes sense that
the peer disconnects the PPPoE session by sending a PADT. At least now
the device isn't in promisc mode.

> I'll report later values printed when a stray PADT appears.
>=20
Okay, but please keep printing the destination MAC address of the
packet. I was providing the flags/promiscuity string just to get extra
information, not to replace your original log.

Also, what's the driver of your NIC (ethtool -i eth1)?

> Regards,
> David
>=20
