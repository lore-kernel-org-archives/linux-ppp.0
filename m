From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 27 Apr 2020 20:08:42 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200427200842.GA3210@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, Apr 27, 2020 at 09:43:06AM -0400, James Carlson wrote:
> On 2020-04-26 15:03, David Bala=C5=BEic wrote:
> > tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
> > 262144 bytes
> > 17:34:34.805424 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> > (oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
> > ethertype PPPoE D, PPPoE PADT [ses 0x1]
> > 17:34:34.815673 c4:3d:c7:90:ce:ed (oui Unknown) > a4:7b:2c:9e:c7:44
> > (oui Unknown), ethertype 802.1Q (0x8100), length 52: vlan 3902, p 0,
> > ethertype PPPoE D, PPPoE PADT [ses 0x1] [Host-Uniq 0x00003003]
> > [AC-Cookie 0xED****************************75]
> > tcpdump: pcap_loop: The interface went down
> [...]
> > Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
> > c4:XX:XX:XX:XX:ed  src a4:XX:XX:XX:XX:44
>=20
> That's really good evidence right there.  It certainly looks like the
> Roaring Penguin PPPoE kernel driver is blindly accepting a bad PADT
> packet meant for someone else.  Your peer probably shouldn't have sent
> this down the line to you, but that's another matter.
>=20
From what I remember of the rp-pppoe and pppd code, once the PPPoE
session is established, rp-pppoe gives control to pppd.
Therefore it has no chance to receive a PADT, since it can't read the
file descriptor used for PPPoE discovery anymore.

That means that the kernel needs to have some ugly code to snoop PADT
messages and kill the affected channel, so that pppd terminates without
waiting for an LCP time out.

What's certain, is that the kernel will shut down the PPP channel
attached to a PPPoE session that receives a PADT. Matching is done on
the source MAC address, the input interface and the session Id.
Delivering the PADT to the interface follows the normal rules. So, in
non-promiscuous mode, a non-multicast frame must have the correct
destination MAC address. In promiscuous mode, all frames are accepted.

Note that, as I already said in a previous message, actions on the
network interface used by PPPoE can also unregister the PPP channel
(passing the interface down, changing the MTU, etc.). That's why I
proposed to check the evolution of the PPPoE interface with rtmon.

> I don't maintain the RP software, but I have a guess.  Either something
> on the system is keeping the Ethernet driver itself in promiscuous mode,
> or some defect in the driver allows non-matching non-multicast
> destinations to be sent up the receive pipe.
>=20
I guess it was just because of the concurrent tcpdump running without
the -p option.

> Either way, it's usually responsibility of the receiving protocol
> software after ethertype demux (in this case, the PPPoE implementation,
> and NOT the PPP code) to validate that the addresses are correct when
> necessary.  It's not the driver's problem.
>=20
> I think the PPPoE code may be missing a check here.  This looks like a
> bug to me.
>=20
> > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
> > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
> > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
> > sending Config-Requests
>=20
> I don't think this is causing the problem, but it's interesting evidence
> nonetheless.  If the peer you're talking to actually implemented PPP in
> a reasonable manner, it would send LCP Protocol-Reject in response to
> your attempt to negotiate IPV6CP rather than just ignoring you.  The
> peer isn't healthy.  Not much you can do about it at this point (other
> than disabling IPv6 on your side with "noipv6"), but still interesting.
>=20
> > The strange part is in the tcpdump there is a PADT sent to an
> > "unknown" MAC and my pppd responds. At least that is how I see it.
>=20
> Yes, EXCEPT that pppd isn't involved at all.  PADT is part of the PPPoE
> protocol, not PPP.  pppd doesn't know anything about this.  It's the
> rp-pppoe software that's responding improperly.  As I suggested
> previously in a private message, I think you should discuss the problem
> with the maintainers of the PPPoE stuff.
>=20
> --=20
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>=20
