From: Tomas Lund <tlund@nxs.se>
Date: Fri, 18 Mar 2011 12:10:12 +0000
Subject: Huawei E398 4G/LTE USB-modem - IPCP fails under pppd 2.4.5
Message-Id: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have a Huawei E398 4G/LTE USB-modem where IPCP fails under pppd 2.4.5 
but works in Windows.

Under linux, this is what happens:

Mar 18 12:16:04 localhost pppd[18558]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x8591b3b5> <pcomp> <accomp>]
Mar 18 12:16:04 localhost pppd[18558]: rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0x2b18e0e> <pcomp> <accomp>]
Mar 18 12:16:04 localhost pppd[18558]: sent [LCP ConfAck id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0x2b18e0e> <pcomp> <accomp>]
Mar 18 12:16:04 localhost pppd[18558]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x8591b3b5> <pcomp> <accomp>]
Mar 18 12:16:04 localhost pppd[18558]: sent [LCP EchoReq id=0x0 magic=0x8591b3b5]
Mar 18 12:16:04 localhost pppd[18558]: rcvd [LCP DiscReq id=0x1 magic=0x2b18e0e]
Mar 18 12:16:04 localhost pppd[18558]: rcvd [CHAP Challenge id=0x1 <26c7ca167a9bd85a2e95c7424221133d>, name = "UMTS_CHAP_SRVR"]
Mar 18 12:16:04 localhost pppd[18558]: sent [CHAP Response id=0x1 <eed8ef3a56256e7f149dc27eff078935>, name = "wap"]
Mar 18 12:16:04 localhost pppd[18558]: rcvd [LCP EchoRep id=0x0 magic=0x2b18e0e 85 91 b3 b5]
Mar 18 12:16:04 localhost pppd[18558]: rcvd [CHAP Success id=0x1 ""]
Mar 18 12:16:04 localhost pppd[18558]: CHAP authentication succeeded
Mar 18 12:16:04 localhost pppd[18558]: CHAP authentication succeeded
Mar 18 12:16:04 localhost pppd[18558]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
Mar 18 12:16:05 localhost pppd[18558]: rcvd [IPCP ConfNak id=0x1]
Mar 18 12:16:05 localhost pppd[18558]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0>]
Mar 18 12:16:06 localhost pppd[18558]: rcvd [IPCP ConfNak id=0x2]
Mar 18 12:16:06 localhost pppd[18558]: sent [IPCP ConfReq id=0x3 <addr 0.0.0.0>]
Mar 18 12:16:07 localhost pppd[18558]: rcvd [IPCP ConfNak id=0x3]
Mar 18 12:16:07 localhost pppd[18558]: sent [IPCP ConfReq id=0x4 <addr 0.0.0.0>]
Mar 18 12:16:08 localhost pppd[18558]: rcvd [IPCP ConfNak id=0x4]
(and this just repeats)

In windows, I am running the application that comes with the modem to 
connect, and I have collected a sniff of the serial port between the modem 
and windows where IPCP works and posted it at 
http://tlund.pp.se/ppp/windows_ppp_sniff.txt

I suspect that Huawei PPP/IPCP implementation in the modem requires it to 
be done JUST the way that their application does it, instead of just 
following the relevant RFC:s.

I am willing to provide any additional details that might be needed, do 
additional sniffing and try any patches or config changes you might have.

Best regards,
Tomas
