From: Michael Richardson <mcr@sandelman.ca>
Date: Wed, 08 Oct 2014 22:53:24 +0000
Subject: Re: PPP connection corruption with Windows client, MPPE, and RDP
Message-Id: <8077.1412808804@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <CALas-ij41eAabeTrq+VVPoBc2eZwnPyj0vdKPDBvWKQ5LU0NPQ@mail.gmail.com>
In-Reply-To: <CALas-ij41eAabeTrq+VVPoBc2eZwnPyj0vdKPDBvWKQ5LU0NPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Francesco Pretto <ceztko@gmail.com> wrote:
    > I configured an IPsec-L2TP VPN on my work network. The VPN has both
    > endpoints on natted networks: ipsec client/server are both NAT enabled

Sadly, I know too much about this stuff, since I forked l2tpd all those years ago.

    > and routers are configured to properly forward IPSEC UPD ports and to
    > passthrough VPN traffic. For some weeks it has worked reliably.
    > Recently it stopped working properly with RDP (Remote Desktop Protocol)
    > seeming to be the most effective trigger that leads the connection to a
    > corrupted state.

Can you tcpdump on the pppX interfaces on both sides?
I suspect that RDP triggers it with a full-sized TCP packet.

    > Enabling the full PPP debug, when the connection is corrupted the log
    > begin to be spammed with plenty of warnings of spurious packets: Oct 1
    > 14:18:55 lanmaster pppd[1977]: rcvd [proto=0xa1] 5f e4 25 5a 19 6b ad
    > 6b b7 0d 60 f7 49 f8 47 f3 5d 87 73 97 12 b2 a7 63 54 21 05 35 43 6a 94
    > 14 ...  Oct 1 14:18:55 lanmaster pppd[1977]: Unsupported protocol 0xa1

In the world of async ppp, if you lose bytes, etc. the framing breaks and you
get lots of stuff like that.  With sync ppp, that shouldn't happen.
I also point out that you can't get corruption from the wire, because the ESP
header will take care of that.  Do you have appropriate
patches/things-enabled, so that the esp/l2tp/ppp packets all stay in the
kernel?  If not, then you might also get some debug from xl2tp.

    >                         ...]  Oct 1 14:18:55 lanmaster pppd[1977]: rcvd
    > [proto=0x36f4] 76 df 4c 41 50 1b ad 4 d 5d c6 2e fb c7 77 1d 6f ae b3
    > 6c 55 db 2b 89 94 6c 7b e3 66 1d 2c d2 57 ...  Oct 1 14:18:55 lanmaster

    > This initially seemed to me an IPSEC problem but, after much
    > troubleshooting, removing the ppp option "require-mppe-128" option and
    > adding "nomppe", effectively disabling MPPE, resulted in a extremely
    > reliable connection again.

MPPE and IPsec are not related. AFAIK, MPPE provides for encryption within
PPP.  you would be double encrypting.

    > client-server related: RDP it's just the trigger, after the whole
    > connection TCP/IP connection is corrupted and must be reset; - It's not

Does other traffic continue to function?
Is one end Windows?

    > I'm unable to say if updates on these packages triggered the problem.

    > The workaround is effective for me as I don't need the PPP link to be
    > encrypted but the configuration should be supported with MPPE enabled I
    > offer my help to do further testing if someone notice there could be a
    > problem in PPP (for example the MPPE state could be partially corrupted
    > but PPP is unable to detect it). Also it may be useful for others that
    > may have the same problem.

-- 
]               Never tell me the odds!                 | ipv6 mesh networks [ 
]   Michael Richardson, Sandelman Software Works        | network architect  [ 
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [ 
	
