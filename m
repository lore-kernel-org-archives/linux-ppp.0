From: "Joakim Wennergren" <jokedst@gmail.com>
Date: Wed, 17 Sep 2008 19:23:10 +0000
Subject: pppd creates route without "gateway" flag
Message-Id: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I just looked at my routing table, and the route pppd created does not
have the "G" flag like I'm used to, is there a reason for this?

This is output from route:

# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.64.64.64     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.2.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 br0
0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0

It seems to work, I'm just wondering why? And can it affect something
in the future?
