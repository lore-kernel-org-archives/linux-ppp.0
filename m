From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Tue, 03 Feb 2004 11:17:56 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203111756.GK1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, Feb 02, 2004 at 10:09:56AM -0800, Frank Cusack wrote:
> On Mon, Feb 02, 2004 at 12:56:52PM +0200, Pasi K?rkk?inen wrote:
> > Check http://nrg.joroinen.fi/yle.log
> >=20
> > It's a tcpdump log from pptp server (running pppd 2.4.2).
> >=20
> > The pptp-client tries to load www.yle.fi in the web browser, but the
> > pptp-server _rejects_ all the packets coming from www.yle.fi web server.
> >=20
> > why? Because the pptp-server ppp-interface MTU is set to x-4, when
> > pptp-client ppp-interface mtu is set to x.=20
> > x is the value that is defined in the ppp-server config file.
>=20
> I see.  So the client is not running pppd?  This client will send frames
> larger than the link MTU. :(
>=20

The client in this case was winxp.

> > Basicly the pptp-server tells to web-server (all the time) that the
> > web-server needs to fragment the packets, because they cannot fit to th=
e=20
> > ppp-tunnel (and the packets have Dont Fragment-bit set). This is part o=
f the
> > PMTUD.
>=20
> Yes, that is correct operation.
>=20

Yep, just like it should be. Except that the pmtud fails and the client
doesn't receive anything.

> > Now, the problem is, that the web-server is already sending packets whi=
ch
> > have *right* size (the size client told), but the pptp-server rejects t=
hem
> > because of the ppp-interface MTU is too low (in the pptp server).=20
>=20
> The right size?  The server is doing PMTU-D (evidenced by DF bit) but
> not handling ICMP frag-needed messages.  This is broken.  Consider that
> *any* link in the path could have a smaller MTU.  The TCP session will
> still have the same MSS because the endpoints don't know about the
> smaller MTU (unless they've already performed and cached PMTU-D data
> between themselves; I think most implementations do this).
>=20

It seems that the www.yle.fi web server doesn't send packets shorter than
mss+headers (=3Dmtu). MSS is determined in the pptp-client from the ppp
MTU/MRU.

www.yle.fi is accepting icmp / fragmentation needed. The problem is not with
icmp. =20

> RFC 2923 is some interesting things to say on this subject.
>=20
> So I'm loathe to "fix" this because pppd is doing the right thing.
> If the site in question isn't going to handle ICMP frag-needed, then
> it shouldn't be setting DF!
>=20
> It wouldn't be hard to add an option mppe-broken-pmtu-for-stupid-sites
> or something equally nasty sounding.  But you will have a problem with
> 1500 MTU links (as oppposed to the 1400 in your example -- does pptpd
> automatically reduce by 100 for some reason?)  And you can't fix the
> case when some other link has a smaller MTU.  I guess there could
> be another option capping the point at which the MTU isn't reduced.
> Now we're talking about ugly workarounds for someone else's problem.
> ugh.
>=20
> I'd really rather not change correct operation.
>=20

I'm not sure what is the correct behaviour, but www.yle.fi doesn't send
shorter packets than mss+headers (mss told by the client).

And the client get's the mss from mtu/mru of the ppp link. So if you specify
mtu/mru as 1400 in the ppp-server config file, the client get's 1400 bytes
mtu/mru. The ppp-server (running mppe) now sets the mtu/mru to 1396.=20

And then when www.yle.fi is sending packets of size 1400 (with DF set), the
server rejects them.=20

The last couple of lines in the log (nrg.joroinen.fi/yle.log) are repeated =
for=20
some time, and then the connection dies. The client receives absolutely=20
nothing (the browser just waits and waits).

So either pppd is broken, or www.yle.fi tcp/ip stack is broken..

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
