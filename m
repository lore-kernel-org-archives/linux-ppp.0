From: Jan Dubiec <jdx@slackware.pl>
Date: Sun, 18 Jan 2004 04:10:21 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <87r7xxaocy.fsf@hs001.slackware.pl>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On  Fri, 16 Jan 2004 10:48:47 +0200, Pasi K=E4rkk=E4inen <pasik@iki.fi> wro=
te:
[.....]
> There's still the MTU bug (with MPPE) left..
>=20
> pppd/ccp.c near line 1192:
>=20
> /*
>  * We need to decrease the interface MTU by MPPE_PAD
>  * because MPPE frames **grow**.  The kernel [must]
>  * allocate MPPE_PAD extra bytes in xmit buffers.
>  */
> mtu =3D netif_get_mtu(f->unit);
> if (mtu)
>     netif_set_mtu(f->unit, mtu - MPPE_PAD);
> else
>     newret =3D CONFREJ;
[.....]
> This does not happen with all web sites.. anyway, this should be fixed si=
nce
> it's really annoying. When I remove the "- MPPE_PAD" code, everything see=
ms
> to be fine.
>=20
> Also if I change the MTU of the ppp interface (in the server) during
> ppp session (with ifconfig/ip), connections start to work well.
Quite interesting problem. IMO the code you quoted should be just
removed because according to RFC1547 MTU is only information for
higher level protocols about "the maximum allowable length for a
packet (q.v.) transmitted over a point-to-point link without incurring
network layer fragmentation." Of course a PPP implementation should be
able to handle overhead added by MPPE - in our case apropriate code is
located in drivers/net/ppp_generic.c in the kernel sources.

According to RFC1661:
 - when negotiated MRU is less than 1500 octets, a PPP implementation
   must still be able to receive at least 1500 octets,
 - when PFC is negotiated, a PPP implementation is still required to
   receive frames with uncompressed protocol field.

So why not to handle MPPE overhead without changing MTU value? I am
sure that RFC3078, unfortunately silently, assumes that.

Regards,
/J.D.
--=20
Jan Dubiec, jdx@slackware.pl, mobile: +48 602 101787

G=B3=EAboka wiara wymaga p=B3ytkiego rozumu i nik=B3ej wiedzy.
