From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Tue, 03 Feb 2004 11:24:27 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203112427.GL1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 10:11:59AM +1100, James Cameron wrote:
> On Mon, Feb 02, 2004 at 12:56:52PM +0200, Pasi K?rkk?inen wrote:
> > Check http://nrg.joroinen.fi/yle.log
> > It's a tcpdump log from pptp server (running pppd 2.4.2).
>=20
> The reason why PMTU-D is not working here is that the ICMP "need to
> frag" message did not change behaviour of www.yle.fi.  The pptp-server
> host is doing the right thing in generating this ICMP response; it's how
> PMTU-D is supposed to work.  The www.yle.fi server should reduce the
> MSS and retransmit a shorter packet.
>=20

The reason why www.yle.fi is not reducing the size, is that the size already
is what the client told (mss+headers). I think so..

> Possible reasons why it isn't working;
>=20
> - the "need to frag" MTU in the ICMP response by pptp-server is wrong,
>   (but it says 1396, data segment was 1360, plus 40, so it seems right
>   to me),
>=20

Yep.=20

> - the ICMP response is not reaching www.yle.fi, (a common problem after
>   that ICMP propogating worm, many admins shut off ICMP blindly),
>=20

ICMP is working well between the sites.. and the fragmentation needed packe=
ts
are going to to the www.yle.fi web server.

> - www.yle.fi is ignoring ICMP responses.
>

Hmm.. I don't think so.=20

btw. the same web site works well with win2k-server's pptp server.
=20

> > why? Because the pptp-server ppp-interface MTU is set to x-4, when
> > pptp-client ppp-interface mtu is set to x.=20
> > x is the value that is defined in the ppp-server config file.
>=20
> What evidence do you have that the pptp-client ppp-interface MTU is set
> to X?  Is your evidence just the MSS in the SYN packet?
>=20

Yep. If I understood the code right, only the MTU of the interface is
changed, but the client get's the MTU specified in the config file.. ?

> > Now, the problem is, that the web-server is already sending packets whi=
ch
> > have *right* size (the size client told), but the pptp-server rejects t=
hem
> > because of the ppp-interface MTU is too low (in the pptp server).=20
>=20
> The client cannot know the right size for the path, so it only suggests
> an MSS of 1360 during the SYN packet.  Where did the client get this
> size from?  (presumably the client isn't running pppd 2.4.2?)
>

The client in this case was winxp. I think it calculates the MSS from the
MTU/MRU of the PPP link.
=20
> So even if the pptp-client host is incorrectly setting the interface
> MTU, and hence the MSS in the SYN packet, PMTU-D should work to sustain
> the connection.
>

I think so too. but www.yle.fi web server doesn't want to go below
mss (told by the client) + headers.
=20
> Note that the www.yle.fi is honouring the MSS in the SYN packet.
>

Yep, it is.
=20
> (While it isn't what you want, there is a hack in iptables that will
> clamp the MSS to the PMTU ... "iptables --append FORWARD --protocol tcp=20
> --tcp-flags SYN,RST SYN --jump TCPMSS --clamp-mss-to-pmtu" or even
> "--set-mss 1346" see http://lartc.org/howto/lartc.cookbook.mtu-mss.html)
>=20

I'll take a look at this. Thanks.

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
