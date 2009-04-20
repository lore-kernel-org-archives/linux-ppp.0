From: littleHeart <chanemouganandam@gmail.com>
Date: Mon, 20 Apr 2009 13:32:36 +0000
Subject: pppd connection timeout in Mesh network
Message-Id: <23136711.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi all,

I have a problem with PPP connection timeout in my 3 nodes mesh networking
system.  Node 1 is wirelessly bridged to ADSL line and wireless mesh
networked to Node 2 and Node 3. Node 1 always stays up connected and ppp,
internet works fine. But node 2 and node 3 has problem with  ppp connection
timeout. Sometimes node 2 or node 3 has ppp vpn connection but lasts for few
minutes and then gets disconnected. Following is the log message when trying
to connect after disconnection.

Jan  1 00:01:09 OpenWrt user.info : using channel 1
Jan  1 00:01:09 OpenWrt user.info : Using interface ppp0
Jan  1 00:01:09 OpenWrt user.info : Connect: ppp0 <--> /dev/pts/0
Jan  1 00:01:39 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:01:42 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:01:45 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:01:48 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:01:51 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:01:54 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:01:57 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:02:00 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:02:03 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:02:06 OpenWrt user.info : sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x8db4b242> <pcomp> <accomp>]
Jan  1 00:02:09 OpenWrt user.info : LCP: timeout sending Config-Requests

Automatic reconnection failed with timeout for most of the time. When pppd
command is launched manually it connects (using interface ppp1) well and
stay connected. 

Can anybody precise me what exactly wrong with the ppp connection goes
disconnected and got connected when launched manually. ? 

thanks 




-- 
View this message in context: http://www.nabble.com/pppd-connection-timeout-in-Mesh-network-tp23136711p23136711.html
Sent from the linux-ppp mailing list archive at Nabble.com.

