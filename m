From: Tilman Schmidt <tilman@imap.cc>
Date: Thu, 22 Oct 2009 23:37:50 +0000
Subject: Re: NOHZ: local_softirq_pending 08
Message-Id: <4AE0ECCE.2020407@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigF862EA24A0DD2A624C0B4238"
List-Id: <linux-ppp.vger.kernel.org>
References: <4AD31213.6020006@imap.cc> <20091015114052.GA9870@ff.dom.local> <4AD76184.6030900@gmail.com> <4ADF5710.4030505@imap.cc>
In-Reply-To: <4ADF5710.4030505@imap.cc>
To: Jarek Poplawski <jarkao2@gmail.com>
Cc: David Miller <davem@davemloft.net>, johannes@sipsolutions.net, hidave.darkstar@gmail.com, linux-kernel@vger.kernel.org, tglx@linutronix.de, linux-wireless@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, isdn4linux <isdn4linux@listserv.isdn4linux.de>, i4ldeveloper <i4ldeveloper@listserv.isdn4linux.de>, Karsten Keil <isdn@linux-pingi.de>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF862EA24A0DD2A624C0B4238
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 21.10.2009 20:46, /me wrote:
>>>> I have encountered the message in the subject during a test of
>>>> the Gigaset CAPI driver, and would like to determine whether
>>>> it's a bug in the driver, a bug somewhere else, or no bug at
>>>> all. The test scenario was PPP over ISDN with pppd+capiplugin.
>>>> In an alternative scenario, also PPP over ISDN but with
>>>> smpppd+capidrv, the message did not occur.
>=20
> I'm sorry, I had confused the two cases. The message occurs in
> the smpppd+capidrv scenario, not with pppd+capiplugin.
>=20
>>>> Johannes' answer pointed me to the netif_rx() function.
>>>> The Gigaset driver itself doesn't call that function at all.
>>>> In the scenario where I saw the message, it was the SYNC_PPP
>>>> line discipline that did.
>=20
> This analysis was therefore wrong. It would be the netif_rx()
> call towards the end of isdn_ppp_push_higher() in
> drivers/isdn/i4l/isdn_ppp.c L1177.

Having noticed that, I cooked up the following patch which fixed
the messages for me. Comments? (Adding i4l people to the already
impressive CC list.)

--- a/drivers/isdn/i4l/isdn_ppp.c
+++ b/drivers/isdn/i4l/isdn_ppp.c
@@ -1174,7 +1174,10 @@ isdn_ppp_push_higher(isdn_net_dev * net_dev, isdn_=
net_local * lp, struct sk_buff
 #endif /* CONFIG_IPPP_FILTER */
 	skb->dev =3D dev;
 	skb_reset_mac_header(skb);
-	netif_rx(skb);
+	if (in_interrupt())
+		netif_rx(skb);
+	else
+		netif_rx_ni(skb);
 	/* net_dev->local->stats.rx_packets++; done in isdn_net.c */
 	return;
=20


--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enigF862EA24A0DD2A624C0B4238
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFK4OzYQ3+did9BuFsRAkYFAJ9p0uXB1gzluEYm8YBmtGTABgKAXwCfUglT
B4aCF7nlk1CbzDVbizivdeI=
=8zJK
-----END PGP SIGNATURE-----

--------------enigF862EA24A0DD2A624C0B4238--
