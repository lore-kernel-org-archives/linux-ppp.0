From: Frank Cusack <fcusack@fcusack.com>
Date: Mon, 02 Feb 2004 09:27:03 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040202012703.A1937@google.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Sat, Jan 17, 2004 at 12:45:18PM +0200, Pasi K?rkk?inen wrote:
> On Sat, Jan 17, 2004 at 10:18:24AM +1100, Paul Mackerras wrote:
> > Pasi K=E4rkk=E4inen writes:
> >=20
> > > There's still the MTU bug (with MPPE) left..

What bug is that?

> > Well, somehow we have to allow for the extra 4 bytes that MPPE adds -
> > and it is reasonable and valid to have the network interface MTU be
> > smaller than the PPP mtu/mru values.  Arguably the code that reduces
> > the MTU isn't expressed as well as it could be, but I'm not yet
> > convinced it's actually wrong.
> >=20
>=20
> Hmm.. I'm not very familiar with MPPE internals, but anyway this seems to
> cause problems in PMTUD with many web sites.. blocking access to them
> entirely.
>=20
> Are there any other opensource ppp/mppe packages that could be used to ch=
eck
> how this in handled in them..

Everyone else ignores MTU and requires the user to manually set it.  If
the user does not set it, the peer sends frames which are too large, and
just expects that the receiver will handle it.

> > Frank, what is your opinion?

One choice would be to require MPP and send frags when we PPP frame
would be too large.  Reducing the interface MTU seems better.

How does this create a PMTU-D problem?

/fc
