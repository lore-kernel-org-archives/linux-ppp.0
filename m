From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 27 Apr 2020 13:43:06 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <92e78022-55ca-862c-fcda-3f728be89774@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 2020-04-26 15:03, David Bala=C5=BEic wrote:
> tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
> 262144 bytes
> 17:34:34.805424 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADT [ses 0x1]
> 17:34:34.815673 c4:3d:c7:90:ce:ed (oui Unknown) > a4:7b:2c:9e:c7:44
> (oui Unknown), ethertype 802.1Q (0x8100), length 52: vlan 3902, p 0,
> ethertype PPPoE D, PPPoE PADT [ses 0x1] [Host-Uniq 0x00003003]
> [AC-Cookie 0xED****************************75]
> tcpdump: pcap_loop: The interface went down
[...]
> Sun Apr 26 17:34:35 2020 daemon.debug pppd[20289]:  dst
> c4:XX:XX:XX:XX:ed  src a4:XX:XX:XX:XX:44

That's really good evidence right there.  It certainly looks like the
Roaring Penguin PPPoE kernel driver is blindly accepting a bad PADT
packet meant for someone else.  Your peer probably shouldn't have sent
this down the line to you, but that's another matter.

I don't maintain the RP software, but I have a guess.  Either something
on the system is keeping the Ethernet driver itself in promiscuous mode,
or some defect in the driver allows non-matching non-multicast
destinations to be sent up the receive pipe.

Either way, it's usually responsibility of the receiving protocol
software after ethertype demux (in this case, the PPPoE implementation,
and NOT the PPP code) to validate that the addresses are correct when
necessary.  It's not the driver's problem.

I think the PPPoE code may be missing a check here.  This looks like a
bug to me.

> Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
> ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
> Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
> sending Config-Requests

I don't think this is causing the problem, but it's interesting evidence
nonetheless.  If the peer you're talking to actually implemented PPP in
a reasonable manner, it would send LCP Protocol-Reject in response to
your attempt to negotiate IPV6CP rather than just ignoring you.  The
peer isn't healthy.  Not much you can do about it at this point (other
than disabling IPv6 on your side with "noipv6"), but still interesting.

> The strange part is in the tcpdump there is a PADT sent to an
> "unknown" MAC and my pppd responds. At least that is how I see it.

Yes, EXCEPT that pppd isn't involved at all.  PADT is part of the PPPoE
protocol, not PPP.  pppd doesn't know anything about this.  It's the
rp-pppoe software that's responding improperly.  As I suggested
previously in a private message, I think you should discuss the problem
with the maintainers of the PPPoE stuff.

--=20
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
