From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Wed, 04 Feb 2004 13:00:16 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040204130016.GP1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 11:24:42AM -0500, Andy Gay wrote:
>=20
>=20
> fcusack@fcusack.com wrote:
>=20
> >On Tue, Feb 03, 2004 at 06:33:23AM -0800, Frank Cusack wrote:
> >
> >Even more -- if it's receiving the frag-needed messages and not caching
> >them, it sounds broken.  ie, even if it is "ignoring" or mishandling them
> >for the current session, it should be caching the result and for the next
> >connection within some reasonable time window -- certainly within the=20
> >amount
> >of time a user would hit 'reload' -- use a smaller MSS.
> >=20
> >
> Maybe the frag-needed messages aren't geting through, as was suggested=20
> in an earlier message. I just tried to ping www.yle.fi, got no response, =

> but I can connect to port 80 on it. Likely someone is blocking all ICMP=20
> to it.
>

At least it reacts to pmtud frag needed icmp packets.. but still doesn't
work right.

I think it's some kind of loadbalanced (netcraft says the OS is unknown),
which is causing the problems.

> A traceroute to its address (194.252.88.100) stops at 194.252.88.68,=20
> which is probably the router at the site. So it's not getting time=20
> exceeded messages out. You may be able to get somewhere by contacting=20
> the site admins (if you can find out who that is) and asking them to=20
> ensure that (at least) ICMP frag-needed is not blocked there.
>=20

Yeah. I'll do this.

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
