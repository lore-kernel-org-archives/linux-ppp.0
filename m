From: Philipp Kolmann <philipp@kolmann.at>
Date: Wed, 07 Jul 2004 11:37:01 +0000
Subject: Re: pppd with radius-plugin seems to have troubles with traffic counter
Message-Id: <20040707113701.GA21148@kolmann.at>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622154645.GA12959@kolmann.at>
In-Reply-To: <20040622154645.GA12959@kolmann.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

No reply at all....=20

Maybe someone could point out where to look at.
Or if more information is needed, please ask.

On Tue, Jun 22, 2004 at 05:46:45PM +0200, Philipp Kolmann wrote:
> Here is the relevant part of my mysql log file (I use a radiusd that
> logs the acct-requests into a mysql db, interim accounting is done every
> 10 minutes):
>=20
> 040622 14:30:14   17953 Query       UPDATE calls SET
> 		acct_session_time=16203,acct_input_octets=92129211,
> 		acct_output_octetsB58766205,
> 		framed_ip_address=3D'193.170.XX.XX',timestamp=3DNOW()=20
> 		WHERE user_name=3D'eXXXXXXX@student.tuwien.ac.at' AND=20
> 		status=3D 1 AND acct_session_id=3D'40D7E70949C7'
> 040622 14:40:14   17953 Query       UPDATE calls SET
> 		acct_session_time=16803,acct_input_octets=95118037,
> 		acct_output_octets=110195513,
> 		framed_ip_address=3D'193.170.XX.XX',timestamp=3DNOW()=20
> 		WHERE user_name=3D'eXXXXXXX@student.tuwien.ac.at' AND
> 		status=3D 1 AND acct_session_id=3D'40D7E70949C7'
>=20
> As you can see in theis session the acct_output_octets drops from over
> 4GB to around 100MB within 10 minutes (possible in our local lan).

Thanks
Philipp

--=20
Life is not fair,
but the root password helps!
