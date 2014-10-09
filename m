From: Michael Richardson <mcr@sandelman.ca>
Date: Thu, 09 Oct 2014 14:20:04 +0000
Subject: Re: PPP connection corruption with Windows client, MPPE, and RDP
Message-Id: <16672.1412864404@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <CALas-ij41eAabeTrq+VVPoBc2eZwnPyj0vdKPDBvWKQ5LU0NPQ@mail.gmail.com>
In-Reply-To: <CALas-ij41eAabeTrq+VVPoBc2eZwnPyj0vdKPDBvWKQ5LU0NPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Francesco Pretto <ceztko@gmail.com> wrote:
    >> I suspect that RDP triggers it with a full-sized TCP packet.
    > [...]
    >> Do you have appropriate patches/things-enabled, so that the
    >> esp/l2tp/ppp packets all stay in the kernel?  If not, then you might
    >> also get some debug from xl2tp.
    >>

    > I am not sure what esp is. PPP and MPPE are in the kernel. xl2tpd log

ESP is IPsec.

    >> MPPE and IPsec are not related. AFAIK, MPPE provides for encryption
    >> within PPP.  you would be double encrypting.

    > Yes, I knew. In fact I was more than satisfied with the reliability I
    > get with "nomppe". But maybe MS-CHAP v2 use MPPE for authentication
    > encryption? I don't know.

No.

    >> Does other traffic continue to function?  Is one end Windows?

    > No, other traffic stops as well. VPN traffic is Windows-Windows.
    > ipsec-ppp-l2tp endpoints are Windows-Linux.

Do you continue to see raw packets transmitted in both directions, if you
tcpdump the wire?  I'm wondering if one end is broken and does not transmit,
or if one is broken, and receives incorrectly.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [

