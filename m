From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Wed, 04 Feb 2004 12:58:38 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040204125838.GO1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 07:13:39AM -0800, Frank Cusack wrote:
> On Tue, Feb 03, 2004 at 06:33:23AM -0800, Frank Cusack wrote:
> > When doing PMTU-D, one must not clamp the segment size to the MSS.
>=20
> Excuse me.  Of course, one must always clamp segment size to MSS.  What
> I meant was that during the course of an existing session, the stack
> must be able to REDUCE the segment size below the MSS.
>=20
> > > So either pppd is broken, or www.yle.fi tcp/ip stack is broken..
> >=20
> > The latter.
>=20
> Even more -- if it's receiving the frag-needed messages and not caching
> them, it sounds broken.  ie, even if it is "ignoring" or mishandling them
> for the current session, it should be caching the result and for the next
> connection within some reasonable time window -- certainly within the amo=
unt
> of time a user would hit 'reload' -- use a smaller MSS.
>=20
> Is www.yle.fi behind a load balancer?  The worst problems I've seen with
> MSS is when load balancers are involved.
>

I think so.. netcraft says the OS is unknown, but it's running Apache on
Unix..=20
=20
> (I have spent a lot of time debugging PMTU-D in the past. ;))
>=20

Heh.. well at least you learn well how things _should_ work :)

I'll contact www.yle.fi admins and ask about the pmtud problem.

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
