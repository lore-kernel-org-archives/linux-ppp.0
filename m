From: Michael Richardson <mcr@sandelman.ca>
Date: Tue, 08 Dec 2015 22:12:05 +0000
Subject: Re: MTU strategies
Message-Id: <1708.1449612725@dooku.sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <5665C351.3020500@seiner.com>
In-Reply-To: <5665C351.3020500@seiner.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Yan Seiner <yan@seiner.com> wrote:
    > I have a question on MTU size strategies.

    > I have a router that terminates a VPN.  The router connects via ppp to
    > my ISP.  I have a physical interface, with a virtual interface for
    > pppoe, and a tun interface for the VPN that runs over the pppoe
    > interface.

    > The physical interface (eth0) has a MTU of 1500.

    > The pppoe interface has an MTU of 1492.

    > The vpn interface has an MTU of 1452, a figure I picked somewhat
    > arbitrarily, assuming a 40 byte overhead for the vpn.

    > My question is then for the other interfaces on the router that face
    > the LAN and the DMZ.  Should these be set to 1492 or 1500?

If the VPN won't be involved, then 1492 is the best bet.
PMTU is *supposed* to take care of all of this, but...

    > And my other question is for the DHCP clients.  Should they be set to
    > 1492 (and the one host that uses the VPN should be set to 1452)?

The DHCP client should receive 1492 from the server, and set it on the
interface.

