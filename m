From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Tue, 03 Feb 2004 15:10:38 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203151038.GN1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 06:33:23AM -0800, Frank Cusack wrote:
> On Tue, Feb 03, 2004 at 01:17:56PM +0200, Pasi K?rkk?inen wrote:
> > I'm not sure what is the correct behaviour, but www.yle.fi doesn't send
> > shorter packets than mss+headers (mss told by the client).
>=20
> That's incorrect on behalf of www.yle.fi.  The client can never know the
> PMTU in the server->client direction.  Even in the client->server directi=
on,
> it can change during the lifetime of a connection.  Read the RFC I mentio=
ned.
>=20
> When doing PMTU-D, one must not clamp the segment size to the MSS.
>=20

OK.


> > So either pppd is broken, or www.yle.fi tcp/ip stack is broken..
>=20
> The latter.
>=20

OK. The problem is that www.yle.fi is not the only site showing
this problem. There are many others too.

I wonder what the right(tm) solution is.. (this problem does not happen with
microsoft pptp-server also running mppe).

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
