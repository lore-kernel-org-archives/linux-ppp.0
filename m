From: James Cameron <james.cameron@hp.com>
Date: Thu, 25 Oct 2007 00:07:17 +0000
Subject: Re: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <20071025000717.GC2687@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
In-Reply-To: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Rajkumar,

I had this same problem persistently on a CDMA USB modem, two or three
years ago, and when I had the problem many other people had the same
problem at the same time.

I too noticed that the default route had something to do with it, as I
was running the system with multiple interfaces.  So I used pppdump and
tcpdump to capture information about the packets being sent by my
system.  

I found that I could reliably crash the remote PPP by emitting a packet
that originated from one of the other IP addresses my system had before
the connection was established or the route was switched.  Within a
second or two of the packet being sent, the LCP ConfReq arrived to
restart PPP.

It was particularly annoying because every time it happened, it cost me
another $0.50.

The fix I made to prevent it happening was to filter the packets that my
system was sending.  I added several iptables rules.  I don't have the
exact list of rules that worked, but you can derive them from examining
the packets that trigger the problem.

The simplest rule might be to drop all packets that do not come from the
IP address assigned to you by the connection.

My /etc/ppp/ip-up.d/cdma script has the following remnant rules:

        # drop anything untoward
        iptables --insert OUTPUT 1 --source 192.168.0.0/255.255.0.0 \
            --destination 0.0.0.0/0.0.0.0 --jump DROP \
            --out-interface ${PPP_IFACE}

        iptables --insert OUTPUT 1 --source 10.0.0.0/255.255.0.0 \
            --destination 0.0.0.0/0.0.0.0 --jump DROP \
            --out-interface ${PPP_IFACE}

        iptables --insert OUTPUT 1 --protocol GRE --jump DROP \
            --out-interface ${PPP_IFACE}

(192.168/16 was a satellite service, 10.0/16 was a local area network,
and the GRE packets were from prior instances of pptp that may not have
terminated cleanly.)

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
