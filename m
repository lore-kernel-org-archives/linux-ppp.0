From: Michal Ostrowski <mostrows@earthlink.net>
Date: Thu, 29 Jul 2004 21:44:29 +0000
Subject: Re: PPPoA driver calls ppp_unregister_channel from invalid context
Message-Id: <1091137469.13721.335.camel@brick.watson.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-lGpL+DkRNxLvugLb4uoS"
List-Id: <linux-ppp.vger.kernel.org>
References: <410955FB.8030606@prs.de>
In-Reply-To: <410955FB.8030606@prs.de>
To: linux-ppp@vger.kernel.org


--=-lGpL+DkRNxLvugLb4uoS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This was an issue at one point with the PPPoE driver.  The solution,
IIRC, was to mark the socket connection as having received a PADT and
unregister it next time an operation was performed from process context.


--=20
Michal Ostrowski <mostrows@earthlink.net>

On Thu, 2004-07-29 at 12:54 -0700, Till Immanuel Patzschke wrote:
> Hi,
>=20
> in case a VCC is being closed, pppoatm calls pppoatm_unassign_vcc (from=20
> pppoatm_push), which calls ppp_unregister_channel.  However the context=20
> pppoatm_push is running in is not "process context" as demanded by=20
> ppp_unregister_channel, resulting in (valid) warning messages, like the=20
> one below.
> The kernel is 2.6.7, the ATM card is a Fore HE155 (which shouldn't=20
> matter since pppoatm_push is definitely not "process context".
>=20
> What would be the right way of unregistering the channel in case the VCC=20
> is being closed (or imagine a native PPPoEoA driver [yes, not using=20
> br2684...]) receiving a PADT, so one has to initiate an unregister from=20
> the driver?
>=20
> Rganks for the help,
>=20
> Immanuel
>=20
>=20
> Jul 28 16:09:34 ipat06 kernel: Debug: sleeping function called from=20
> invalid context at include/linux/rwsem.h:66
> Jul 28 16:09:34 ipat06 kernel: in_atomic():1, irqs_disabled():1
> Jul 28 16:09:34 ipat06 kernel:  [dump_stack+30/32] dump_stack+0x1e/0x20
> Jul 28 16:09:34 ipat06 kernel:  [<c01080de>] dump_stack+0x1e/0x20
> Jul 28 16:09:34 ipat06 kernel:  [__might_sleep+199/224]=20
> __might_sleep+0xc7/0xe0
> Jul 28 16:09:34 ipat06 kernel:  [<c011ff57>] __might_sleep+0xc7/0xe0
> Jul 28 16:09:34 ipat06 kernel:  [pg0+945292153/1068032000]=20
> ppp_unregister_channel+0x39/0x3e0 [ppp_generic]
> Jul 28 16:09:34 ipat06 kernel:  [<f8af0379>]=20
> ppp_unregister_channel+0x39/0x3e0 [ppp_generic]
> ...


--=-lGpL+DkRNxLvugLb4uoS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCW+8kWf6oW3k3O0RAlDMAJ9NbRigX7TS0xfylMXVvUUGCCeRHgCfRK6g
UOkL0Utf9TmTcBMaR1pFutQ=
=IZX+
-----END PGP SIGNATURE-----

--=-lGpL+DkRNxLvugLb4uoS--

