From: Guillaume Nault <gnault@redhat.com>
Date: Wed, 06 May 2020 20:20:18 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200506202018.GA29247@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, May 06, 2020 at 11:15:46AM -0400, James Carlson wrote:
> On 2020-05-06 10:26, Guillaume Nault wrote:
> > On Wed, May 06, 2020 at 11:52:48AM +0200, David Bala=C5=BEic wrote:
> >> (the last line is from my fix, the connection is now not dropped when
> >> the PADT is not for us; works fine, my connection stays up and
> >> working)
> >>
> > Looks like a more fundamental issue. This frame shouldn't have been
> > accepted in the first place. Can you also print the packet class
> > ("... pkt_type %u", ..., skb->pkt_type)?
> >=20
> > Testing the destination MAC here is likely to just paper over the
> > problem.
>=20
> Having either sketchy (e.g., CRC hash filter based) or just absent
> hardware filtering of unicast addresses isn't an unknown property for
> some Ethernet devices.  Relying on exact match from the underlying
> hardware seems like a bad idea.  (Some, for instance, can either receive
> "all multicast" or can filter using the low N bits of the CRC to index
> into a 2^N-bit hash table, but can't really exclude a unicast packet
> that happens to match the low N bits of a selectively enabled multicast
> address.  See, for example, the PowerQUICC implementation.  But there
> are quite a few that work like this.  It wouldn't surprise me in the
> least that 'ar71xx' [Atheros/Qualcomm?] is like this.)
>=20
Yes, but that's just a limitation of the chip. I'm not a driver guy,
but I'd expect the driver to do whatever is need, in software, to fix
such limitations.

> I agree that having to test the MAC address right here is a bit lame and
> that the driver itself ought to assist the hardware in doing the Right
> Thing.
>=20
Yes, we shouldn't have to check the destination MAC address in all
ethertype handlers. The Ethernet layer has to do its job.

But looking at the openwrt code, it seems that the driver properly
calls eth_type_trans(). So skb->pkt_type should be correctly set and we
could use it to know if the frame was for us. It'd still be good to
verify that skb->pkt_type =3D PACKET_OTHERHOST when the original problem
happens.

Testing if ->pkt_type =3D PACKET_HOST in the PPPoE discovery handler
would be a good thing anyway, to avoid processing packets just because
someone started tcpdump. That might also "fix" David's problem as a
side effect.

> --=20
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>=20
