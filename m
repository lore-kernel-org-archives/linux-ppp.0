From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 09 Jul 2008 15:22:38 +0000
Subject: Re: net_mask 255.255.255.255
Message-Id: <18548.55230.496756.727435@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nicholas Hickman writes:
> What is the reason for the lines 2362 & 2363 in sys-linux.c?  Why not
> just accept the netmask option from the peer config?

Netmask doesn't really mean anything for a point-to-point link.  A
point-to-point link (unlike broadcast or NBMA) has just two peers --
the local system and the one at the other end.  There's no "subnet"
involved, nor any "broadcast" address, nor any L2-related way to talk
about any other nodes on the "local network."

For users who insist on setting up PtP links as though they were
Ethernet interfaces, pppd accepts (and ignores) the netmask option.
:-/

In most cases where you 'want' to set up a netmask, what you actually
need is a static route pointing to a remote network reachable through
the peer node or (better yet) a dynamic routing protocol.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
