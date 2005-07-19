From: David Corbin <dcorbin@machturtle.com>
Date: Tue, 19 Jul 2005 11:13:53 +0000
Subject: auth eap
Message-Id: <200507190713.53851.dcorbin@machturtle.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm trying to get a PPTP tunnel running (on a gentoo client).  The tunnel 
tries to start, but then fails.  At the end is my output from attempting to 
diagnose the failure.

From the "No auth is possible", and the "auth eap", I assume there is a 
problem with the way something is built on my system, but I can find very 
little useful information about 'eap'.

Can anyone point me in the right direction?  
Thanks
David


Connect: ppp0 <--> /dev/pts/4
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
rcvd [LCP ConfReq id=0x0 <mru 1400> <auth eap> <magic 0x110e0fd3> <pcomp> 
<accomp> <callback CBCP> <mrru 1614> <endpoint 
[local:ca.14.8c.08.a1.f5.4f.e5.82.f7.00.db.32.c5.73.48.00.00.00.00]> < 17 04 
00 24>]
No auth is possible
sent [LCP ConfRej id=0x0 <auth eap> <callback CBCP> <mrru 1614> < 17 04 00 
24>]
rcvd [LCP ConfAck id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
rcvd [LCP TermReq id=0x1 11 0e 0f d3 00 3c cd 74 00 00 03 97]
sent [LCP TermAck id=0x1]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0xe7f43b5b> <pcomp> 
<accomp>]
Script pptp vpn.enttek.net --nolaunchpppd finished (pid 7810), status = 0x0
Modem hangup
Connection terminated.
