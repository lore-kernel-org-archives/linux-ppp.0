From: Jochen Roedenbeck <roe@spl-spindel.de>
Date: Sun, 30 Jan 2005 10:53:10 +0000
Subject: Re: proxyarp, pppd does not remove the arp entries
Message-Id: <41FCBC96.8010206@spl-spindel.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <41F24B8E.2020600@spl-spindel.de>
In-Reply-To: <41F24B8E.2020600@spl-spindel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I tested PPP 2.4.3 now, and I must say, compiling the sources was easier
than I expected. However, the behavior is the same.

So I made some tests with the arp utility and tried to set up and delete
entries with it. And I had to experience that it was not possible to
delete entries which were created using the "pub" flag. It now
seems to me a problem of the arp cache handling software, not pppd.

Jochen


Ray Van Dolson schrieb:
> I use proxyarp and have not seen this problem myself.  When users disconn=
ect,
> the arp entry is properly cleared.  However, I am using PPP 2.4.3 -- 2.4.=
1 is
> a bit old; have you considered upgrading?
>=20
> Ray
>=20
> On Sat, Jan 22, 2005 at 01:48:14PM +0100, Jochen Roedenbeck wrote:
>=20
>>I set up a dialin server with mgetty and pppd. It works in general,
>>but there is a strange problem.
>>
>>I use the option "proxyarp". When the connection is opened, an arp
>>entry is created with the address of the remote client, for example
>>192.168.76.72, which I checked using "arp -n". All works fine.
>>
>>When the connection gets closed, the arp entry is not removed, as
>>it should. Instead the first number of the IP address, 192, is
>>changed to 191.
>>
>>The arp chache gets longer and longer, and after some time it does not
>>work any more.
>>
>>It is version 2.4.1 of pppd, and Linux kernel version 2.4.21. The
>>distribution is Suse.
>>
>>What can I do?
>>
>>Jochen Roedenbeck
>=20
>=20
>=20
>=20


--=20

SPL Spindel und Pr=E4zisionslager GmbH
Feldstra=DFe 5, D-04720 D=F6beln

Telefon:  +49 3431 610200
Fax:      +49 3431 610205
Internet: http://www.spl-spindel.de
