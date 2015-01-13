From: Matthias-Christian Ott <ott@mirix.org>
Date: Tue, 13 Jan 2015 17:33:04 +0000
Subject: ppp_async: ioctl to set MTU needed
Message-Id: <54B556D0.5090204@mirix.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Some months ago I filed the following bug report (with some sentences
corrected) on the Kernel Bug Tracker but have received no reaction
reaction so far:

Summary: ppp_async: ioctl to set MTU needed

The MTU of a channel of a Multilink PPP link is set from the MRU of a
Configure-Ack LCP packet. However, just because the is able to receive
packets of a certain size it doesn't mean that the link or the sender
are able to transmit packets of that size, so the received MTU of the
channel should not be set to the MRU of the peer.

A practical example is PPP encapsulated in GRE or L2TP over IPv6
(without fragmentation). Peer A sets its MRU to the link MTU minus
maximum IP header length minus GRE/L2TP header length to be able to
receive packets of maximum length over PPP. Peer B connects to peer A
and the maximum payload size, which is derived from the Path MTU, of the
tunnel between peers A and B is lower than the MRU of peer A. If peer B
sends a packet P smaller than the MRU of peer A and larger than the
maximum payload size of the IP packet encapsulating P, it will exceed
the Path MTU and thus will be rejected and never arrive at peer A. Such
scenario is common for VPNs that use PPP or to transport PPP sessions of
broadband/Internet subscribers (e.g. if one ISP manages the physical
network and another ISP provides Internet access and is the endpoint of
the PPP session that runs over the physical network and the PPP session
is transported over IPv6). IPv4 was able to fragment IP packets larger
than the Path MTU, so setting the MTU to the MRU of peer a worked. With
IPv6 (without fragmentation) this no longer works.

As a workaround I patched pppd and sent a Configure-Nak with the correct
MRU in the options of the packet in the hope that the remote peer would
adjust its MRU to the MRU suggested in the Configure-Nak and that the
PPP driver would in turn set the MTU of the channel correctly. However,
this didn't work because the remote peer simply sent the original
Configure-Request again and again without adjusting its MRU.
Unfortunately, I don't know which PPP implementation the remote peer uses.


I understand that PPP is not as interesting as in the 1990s any longer.
Nonetheless I would like to have this issue fixed and I would be happy
to create a provide for the kernel module and pppd if I'm certain that
the patch would get accepted (with minor modifications). So it would
help if somebody in charge of pppd or the kernel module comment on my
proposal to introduce an ioctl for this. Thanks!

Regards,
Matthias-Christian

[1] https://bugzilla.kernel.org/show_bug.cgi?id=88101
