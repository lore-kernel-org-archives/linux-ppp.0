From: "Jeffrey D. Means" <meaje@meanspc.com>
Date: Sun, 16 May 2004 01:16:31 +0000
Subject: has anyone gotten PPP and MPPE working with kernel 2.6.x yet??
Message-Id: <1084670191.4575.151.camel@bast.picotech.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am running kernel 2.6.5 and having a strange error message when I try
to start my ppp daemon about MPPE not available I am trying to use
PopTop 1.1.3 with pppd 2.4.2
 

--- log messages 
pppd options in effect:
debug # (from /etc/ppp/options.pptpd)
logfile /tmp/pptpd.log # (from /etc/ppp/options.pptpd)
dump # (from /etc/ppp/options.pptpd)
plugin radius.so # (from /etc/ppp/options.pptpd)
require-mschap-v2 # (from /etc/ppp/options.pptpd)
-chap # (from /etc/ppp/options.pptpd)
-mschap # (from /etc/ppp/options.pptpd)
name pptpd # (from /etc/ppp/options.pptpd)
115200 # (from command line)
lock # (from /etc/ppp/options.pptpd)
local # (from /etc/ppp/options.pptpd)
asyncmap 0 # (from /etc/ppp/options.pptpd)
lcp-echo-failure 30 # (from /etc/ppp/options.pptpd)
lcp-echo-interval 5 # (from /etc/ppp/options.pptpd)
ipcp-accept-local # (from /etc/ppp/options.pptpd)
ipcp-accept-remote # (from /etc/ppp/options.pptpd)
ms-dns xxx # [don't know how to print value] # (from
/etc/ppp/options.pptpd)
proxyarp # (from /etc/ppp/options.pptpd)
216.17.224.222:192.168.1.1 # (from command line)
require-mppe # (from /etc/ppp/options.pptpd)
using channel 13
Using interface ppp0
Connect: ppp0 <--> /dev/pts/18
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xc3628da3> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xc3628da3> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <magic 0x406705d7> <pcomp> <accomp> <callback
CBCP> <mrru 1614> <endpoint
[local:f4.c1.42.e8.7c.3f.43.b9.a0.bf.a8.c2.e5.19.e3.d5.00.00.00.18]>]
sent [LCP ConfRej id=0x1 <callback CBCP> <mrru 1614>]
rcvd [LCP ConfReq id=0x2 <magic 0x406705d7> <pcomp> <accomp> <endpoint
[local:f4.c1.42.e8.7c.3f.43.b9.a0.bf.a8.c2.e5.19.e3.d5.00.00.00.18]>]
sent [LCP ConfAck id=0x2 <magic 0x406705d7> <pcomp> <accomp> <endpoint
[local:f4.c1.42.e8.7c.3f.43.b9.a0.bf.a8.c2.e5.19.e3.d5.00.00.00.18]>]
sent [LCP EchoReq id=0x0 magic=0xc3628da3]
sent [CHAP Challenge id=0xf1 <133bc3ffcc0ea73869855c3693bd5a71>, name "pptpd"]
rcvd [LCP code=0xc id=0x3 40 67 05 d7 4d 53 52 41 53 56 35 2e 30 30]
sent [LCP CodeRej id=0x2 0c 03 00 12 40 67 05 d7 4d 53 52 41 53 56 35 2e
30 30]
rcvd [LCP code=0xc id=0x4 40 67 05 d7 4d 53 52 41 53 2d 31 2d 4a 45 46
46 2d 57 53]
sent [LCP CodeRej id=0x3 0c 04 00 17 40 67 05 d7 4d 53 52 41 53 2d 31 2d
4a 45 46 46 2d 57 53]
rcvd [LCP EchoRep id=0x0 magic=0x406705d7]
rcvd [CHAP Response id=0xf1
<5d97ca0307364a452172d9d7bf9fd9700000000000000000370446f8b69e40a389f7c215e7650b97671455869bee4c2300>, name = "meaje"]
sent [CHAP Success id=0xf1 "S'686CD047B851E473605718551CC73DA16E58FA"]
MPPE required, but keys are not available. Possible plugin problem?
sent [LCP TermReq id=0x4 "MPPE required but not available"]
rcvd [LCP TermAck id=0x4 "MPPE required but not available"]
Connection terminated.
Connect time 0.1 minutes.
Sent 0 bytes, received 0 bytes.

--- lsmod output
Module             Size           Used by
ppp_deflate  6272 0
bsd_comp         6272 0
ppp_async    12288 0
ppp_mppe       14336 0
ppp_generic 31636 4 ppp_deflate,bsd_comp,ppp_async,ppp_mppe
slhc                     7680 1 ppp_generic
autofs             16640 0
8139too           24704 0
pcnet32             24932 0
mii                          5120 2 8139too,pcnet32
parport_pc   24512 0
parport           40008 1 parport_pc

---
In my mind this looks like a bug with the 2.6 kernel or could it be a
bug with pppd??
--
Jeff Means 
        
        


