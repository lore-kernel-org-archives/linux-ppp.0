From: Ben Greear <greearb@candelatech.com>
Date: Thu, 20 Jan 2005 22:19:00 +0000
Subject: Multilink-PPP question.
Message-Id: <41F02E54.3040500@candelatech.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello!

I have been running some tests with multi-link PPP and have some questions...

First, I am running one machine on the 2.6.9 kernel one machine, and
2.4.27 on another.  Both are using pppd 2.4.1b2, patched to work with Digium
T1 cards:  http://www.datacanyon.com/pub/telephony/zaptel/misc/

I am using this script to start pppd on each machine, calling it with arguments
'unit 2 1' for one interface, and 'unit 2 25' for the other.
#!/bin/sh
ARGS="-detach noauth debug 172.100.0.2:172.100.0.1 mp lcp-echo-interval 1 lcp-echo-failure 5 persist holdoff 1 plugin zaptel.so"
/usr/sbin/pppd $ARGS $*

The other machine has identical arguments, except that the IP addresses are flipped.

In general, this is working.

I have been seeing an occasional problem when testing link failover.  To do this
test, I start up a UDP traffic stream across the ppp2 interface (bonded over both T1s for
about 2700Kbps throughput).  Then, I yank both cables and wait for the ppp2 interface go
go away, and plug the cables back in.

Normally, the ppp2 interface comes back into existence and I can continue sending
traffic over the link...

But, sometimes I see this error:
sent [LCP EchoRep id=0x2a magic=0xcb4069f5]
sent [LCP EchoReq id=0x2b magic=0xcb4069f5]
rcvd [LCP ConfReq id=0x28 <magic 0x636b978e> <mrru 1500> <endpoint [MAC:00:90:27:65:37:8c]>]
sent [LCP ConfReq id=0x19 <magic 0xf5f0bc78> <mrru 1500> <endpoint [MAC:00:07:e9:1f:97:c8]>]
sent [LCP ConfAck id=0x28 <magic 0x636b978e> <mrru 1500> <endpoint [MAC:00:90:27:65:37:8c]>]
rcvd [LCP ConfAck id=0x19 <magic 0xf5f0bc78> <mrru 1500> <endpoint [MAC:00:07:e9:1f:97:c8]>]
sent [LCP EchoReq id=0x0 magic=0xf5f0bc78]
Couldn't attach to interface unit 2: Inappropriate ioctl for device


Any idea what the problem is?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

