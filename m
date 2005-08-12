From: James Cameron <james.cameron@hp.com>
Date: Fri, 12 Aug 2005 23:32:27 +0000
Subject: Re: Spontaneous LCP ConfReq after connection made
Message-Id: <20050812233227.GB1140@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
List-Id: <linux-ppp.vger.kernel.org>
References: <20050812073342.GL28862@hp.com>
In-Reply-To: <20050812073342.GL28862@hp.com>
To: linux-ppp@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

James Carlson wrote:
> I'd strongly suggest finding a different service provider.  Giving
> your money to a "service" provider that won't even accept a valid bug
> report doesn't strike me as a good plan.

Unfortunately, there is no other service provider; all transmission
towers within radio range are owned by the one provider, and no
comparable service is available.  DSL is not available, and copper pairs
can only do about 24kbit/sec.  It's a 24-month contract, I'm up to the
ninth month, and the contract terms include a "supported software"
clause.  It was working reasonably well before now.

> In reading this log, it looks to me like the peer just wanted to
> renegotiate the link.
>=20
> How do you know that's not what it wanted to do?  Does this behavior
> happen with other PPP implementations?  If not, then what's different
> with them?

Apart from the IP address change, there doesn't seem to be any reason
for the renegotiation.  These renegotiations happen in the middle of the
cell phone call; the cell call is not terminated.  But the provider
charges based on their PPP records, not their cell call records.  As a
result of the renegotiation, a new call record is placed in the service
provider's billing system, costing me $USD 0.385 each renegotiation.
I've had it renegotiate 30 times in a minute, before I added an if-down
script to SIGHUP it.  The service provider has reversed these charges,
admitting a fault condition exists, but they haven't been able to
progress the fault since Feb '05, so I thought to seek additional help.

You raise an excellent point with regard to other PPP implementations.
Perhaps there is something negotiated or implied that isn't being done
by Linux PPP.  (Nor should it do so, of course).

I've not tried the PPP implementation that has been provided by the
modem manufacturer, because it is Windows specific, I don't run Windows
here, and as the modem is USB connected instead of serial port connected
I don't know a way to catch the stream for analysis.  But thanks for the
idea, I'll see if I can get the manufacturer to provide information.
(So far they have been silent since I told them I am using Linux).

> Getting to the bottom of such issues is essentially debugging that
> remote peer from afar.  It's not easy at all.

Agreed.  So in addition to whinging I could try to find what innocuous
behaviour Linux PPP is doing that apparently causes the peer to
renegotiate.  Have you any suggestions for options to try blindly in
case they have an effect?

I've tried "asyncmap ffffffff" and "escape
00,01,02,03,04,05,06,07,08,09,0a,0b,0c,0d,0e,0f,10,11,12,13,14,15,16,17,
18,19,1a,1b,1c,1d,1e,1f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,90,=
91,92
,93,94,95,96,97,98,99,9a,9b,9c,9d,9e,9f" so far, with no apparent
change.

Have you any suggestions for things to look for in the data sent to the
peer that seems to trigger the event?

--=20
James Cameron
http://ftp.hp.com.au/sigs/jc/

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC/TGKIiWKUhK+Mj4RAj5UAJ486RjSi56kqNCKDZn84SnbRB52zwCeIqGb
dSw2g4sZE1GVO1WOElNECYA=
=8f5G
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
