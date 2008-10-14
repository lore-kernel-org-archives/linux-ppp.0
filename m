From: "myteron myteron" <myteron@googlemail.com>
Date: Tue, 14 Oct 2008 12:26:37 +0000
Subject: Split dialup how to detect package loss and whats 10.64.64.64
Message-Id: <5153e02f0810140526u78d1345ct9ac28c8ada6e9656@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi there,


I am living in the midlands of Ireland and internet here is somewhat
unreliable so I have 2 connections.

First I would like to know whats 10.64.64.64 as it looks to me as
somekind of generic gateway.
I get this thru wvdial in conjunction with ppp dialing into an 02
network via an E270 gsm modem.
Havent fiubd anything explaining this on the net.

However my main issue with split dialup that I have no elegant way to
detect package loss over one connection so that I can switch over to
the other one.

What basically happens is when there is package loss behind the
gateway and the routers IP stays up it all just hangs there.
So packages hang on the statefull connection until timeout but the
kernel still tries to route thrue that gw.

Surely I could write a script that icmp's the next hop but I don't
like the idea.

Thanks

Helge
