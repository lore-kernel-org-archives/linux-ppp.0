From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Mon, 26 Sep 2005 10:00:47 +0000
Subject: Re: ppp-2.4.4b1 released
Message-Id: <20050926100047.GI10146@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
In-Reply-To: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Sep 20, 2005 at 08:39:40PM +1000, Paul Mackerras wrote:
> Pasi K=E4rkk=E4inen writes:
>=20
> > I wonder if I am in some kind of blocklist or so..=20
>=20
> No, it's just that ppp is a lower priority for me than some of the
> other things I have to do.
>

OK. Thanks for the reply :)
=20
> > please comment about this
> > patch!
>=20
> I don't like the gratuitous and incorrect whitespace changes.
>=20

Hmm.. I'll remove those.

> You are calling the dns and wins hooks in ipcp_resetci, which means
> they will get called every time ipcp negotiation is started - is this
> what you meant?  Surely they only need to get called once, after the
> user is authenticated?
>=20
> In radius_set_dns and radius_set_wins you compute a return value which
> is then never used - why do you bother?
>=20

I'll fix these and send new patch..=20

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
