From: Patrick Mahan <mahan@mahan.org>
Date: Mon, 08 Jun 2020 22:52:49 +0000
Subject: Re: PPP cycling between UP and DOWN
Message-Id: <671a6499-f5f6-1170-e7d3-36a9aaa31486@mahan.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
In-Reply-To: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 6/8/20 2:32 PM, David Bala=C5=BEic wrote:
> On Mon, 8 Jun 2020 at 19:16, James Carlson <carlsonj@workingcode.com> wro=
te:
>> "Modem hangup" means that PPPoE, not PPP, shut down this link.  It would
>> be a completely wild guess -- I know the pppd code fairly well, but I
>> don't know the separate rp-pppoe code too well at all -- but it's
>> possible that this user was bit by the same stray PADT problem that
>> someone reported earlier on this list.  Or maybe not.
>=20
> RP-PPPOE has that bug fixed for quite a while.
>=20
> (I reported that PADT problem)

Okay, well we are moving to the latest RP-PPPOE and PPP versions on our new=
=20
platform which uses the 4.14 kernel.  So that fix will at least be there in=
 the=20
future.

Thanks,

Patrick
