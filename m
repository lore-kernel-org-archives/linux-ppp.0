From: James Cameron <james.cameron@hp.com>
Date: Sun, 10 Aug 2008 23:21:48 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <20080810232148.GD6024@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Oh, and something else that springs to mind ... when I had this problem
that you report with 1x RTT modems, an analysis of the packet stream
with pppdump and tcpdump resulted in a correlation between certain
packets and a reconfiguration event.

I could force it to occur by emitting packets to the modem with IP
addresses that were incorrect.  The provider's back-end NAT equipment
was closing the session when it saw such invalid packets.

The host was multi-homed, and when the 1x RTT link came up the default
route was swung onto the link.  Existing connections began to emit
packets to the modem link with a source IP corresponding to the previous
default route.  It was these packets which caused the reconfiguration.

In the end what solved the problem for me was filtering the packets
before they reached the modem ... by adding the following to an ip-up
script:

        iptables --insert OUTPUT 1 --source 192.168.0.0/255.255.0.0 \
            --destination 0.0.0.0/0.0.0.0 --jump DROP \
            --out-interface ${PPP_IFACE}

        iptables --insert OUTPUT 1 --source 10.0.0.0/255.255.0.0 \
            --destination 0.0.0.0/0.0.0.0 --jump DROP \
            --out-interface ${PPP_IFACE}

        iptables --insert OUTPUT 1 --protocol GRE --jump DROP \
            --out-interface ${PPP_IFACE}

In my case, 10.0/16 was a local LAN, and 192.168/16 was the satellite
service.

It looks like I've said all this before:

http://osdir.com/ml/linux.ppp/2007-10/msg00011.html

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
