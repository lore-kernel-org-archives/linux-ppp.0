From: James Cameron <james.cameron@hp.com>
Date: Mon, 15 Aug 2005 06:57:50 +0000
Subject: Re: Spontaneous LCP ConfReq after connection made
Message-Id: <20050815065750.GQ11613@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7ZAtKRhVyVSsbBD2"
List-Id: <linux-ppp.vger.kernel.org>
References: <20050812073342.GL28862@hp.com>
In-Reply-To: <20050812073342.GL28862@hp.com>
To: linux-ppp@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 13, 2005 at 02:22:10PM -0400, James Carlson wrote:
> If it's not for a mobile station (assuming so, since you mentioned
> DSL), the one means you didn't suggest was cable.  I take it that's
> not an option.

Yes.  I'm six hours drive from the nearest city with cable.  I'm using
satellite too, but it has data limits (500Mb per month) whereas the CDMA
service has none.  They only have a time limit (50 hours per month).

> Here's another possibility: I once saw a bug in a particular embedded
> implementation where they apparently accidentally left a timer running
> after setting LCP to Opened state that caused renegotiation.

I've excluded this based on the apparent random timing, but I will give
"silent" a try.

One thing I've noticed with testing past few days ... the renegotiation
is very probable if a GRE packet for PPTP is sent over the PPP link. =20

The peer provides a NAT service, and supports the use of PPTP.  PPTP
over NAT requires the peer implement stateful inspection and connection
tracking.

Normally a PPTP tunnel runs inside an OpenVPN tunnel over the satellite
service.  When the CDMA service comes up, my if-up scripts change the
route to the PPTP tunnel server so that packets for the active tunnel go
via the link in question.  Breaks the tunnel, of course.

The presumably buggy peer receives a GRE packet out of the blue that it
cannot relate to any active connection.  It might be crashing and
restarting.

It occurs to me that this might be causing problems for other users.
The service provider did say that other users had reported a similar
problem.  If I can reproduce it reliably, I'll let the service provider
know.

Thanks for the suggestion to capture the Windows client negotiation;
first I'll see if I can isolate the problem to orphan PPTP frames.

--=20
James Cameron
http://ftp.hp.com.au/sigs/jc/

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDADzuIiWKUhK+Mj4RAmZcAJ4qIFNHE92E6KI37D05cQraGXzMHwCeIt8U
2U2YMIc79f5KXOao9lp17g4=
=qB2y
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
