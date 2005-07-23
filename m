From: James Henry Maiewski <jhm@mtdata.com>
Date: Sat, 23 Jul 2005 19:44:13 +0000
Subject: Pass-filter, multilink and [LCP ProtRej ...]
Message-Id: <200507231544.13556.jhm@mtdata.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

	Before I desrcibe some problems I've been having with PPP (or at least using 
PPP], I would ask anyone familiar with KPPP, how one can get a listing of the 
arguments that KPPP will use with pppd.  I'm using KPPP v2.4.1; pppd v2.4.1; 
kernel 2.6.3-7mdk (Mandrake 10.0).

	Of late, the PPP link to my dial-up ISP has developed a tendency to cut 
transmission rates to zero, sometimes staying there.  For a while now, I've 
been unable to establish the link at all unless I pass pppd the -persist 
option, but it worked fine even so until recently.  Some of the control 
messages that are new are:

Couldn't set pass-filter in kernel: Invalid argument

sent [LCP ConfRej id=0x1 <mrru 1500>] #This is something my ISP has started  
#asking for recently, i don't think that I have multilink going, or that I 
#should.

rcvd [LCP ProtRej id=0x3 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
#I have no idea what this is all about.  I thought that LCP had been completed 
at this point

	I have included the latest DEBUG details below.  I killed the process 
manually.

Jul 23 15:13:58 localhost pppd[4621]: pppd 2.4.1 started by chief, uid 501
Jul 23 15:13:58 localhost pppd[4621]: using channel 3
Jul 23 15:13:58 localhost pppd[4621]: Using interface ppp0
Jul 23 15:13:58 localhost pppd[4621]: Connect: ppp0 <--> /dev/tts/4
Jul 23 15:13:58 localhost pppd[4621]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> 
<magic 0x446ba45e> <pcomp> <accomp>]
Jul 23 15:13:58 localhost pppd[4621]: rcvd [LCP ConfReq id=0x1 <asyncmap 
0xa0000> <auth pap> <magic 0x13c10d28> <mrru 1500> <endpoint [local:99.44]>]
Jul 23 15:13:58 localhost pppd[4621]: sent [LCP ConfRej id=0x1 <mrru 1500>]
Jul 23 15:13:58 localhost pppd[4621]: rcvd [LCP ConfRej id=0x1 <pcomp> 
<accomp>]
Jul 23 15:13:58 localhost pppd[4621]: sent [LCP ConfReq id=0x2 <asyncmap 0x0> 
<magic 0x446ba45e>]
Jul 23 15:13:58 localhost pppd[4621]: rcvd [LCP ConfReq id=0x2 <asyncmap 
0xa0000> <auth pap> <magic 0x13c10d28> <endpoint [local:99.44]>]
Jul 23 15:13:58 localhost pppd[4621]: sent [LCP ConfAck id=0x2 <asyncmap 
0xa0000> <auth pap> <magic 0x13c10d28> <endpoint [local:99.44]>]
Jul 23 15:13:58 localhost pppd[4621]: rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> 
<magic 0x446ba45e>]
Jul 23 15:13:58 localhost pppd[4621]: sent [PAP AuthReq id=0x1 
user="af0116010448@mtdata.net" password=<hidden>]
Jul 23 15:14:01 localhost pppd[4621]: sent [PAP AuthReq id=0x2 
user="af0116010448@mtdata.net" password=<hidden>]
Jul 23 15:14:02 localhost pppd[4621]: rcvd [PAP AuthAck id=0x2 ""]
Jul 23 15:14:02 localhost pppd[4621]: Couldn't set pass-filter in kernel: 
Invalid argument
Jul 23 15:14:02 localhost pppd[4621]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> 
<compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Jul 23 15:14:02 localhost pppd[4621]: sent [CCP ConfReq id=0x1 <deflate 15> 
<deflate(old#) 15> <bsd v1 15>]
Jul 23 15:14:02 localhost pppd[4621]: rcvd [IPCP ConfReq id=0x1 <compress VJ 
0f 00> <addr 10.10.10.10>]
Jul 23 15:14:02 localhost pppd[4621]: sent [IPCP ConfAck id=0x1 <compress VJ 
0f 00> <addr 10.10.10.10>]
Jul 23 15:14:02 localhost pppd[4621]: rcvd [IPCP ConfNak id=0x1 <addr 
206.15.138.235> <compress VJ 0f 00> <ms-dns1 206.15.168.70> <ms-dns3 
206.15.168.65>]
Jul 23 15:14:02 localhost pppd[4621]: sent [IPCP ConfReq id=0x2 <addr 
206.15.138.235> <compress VJ 0f 00> <ms-dns1 206.15.168.70> <ms-dns3 
206.15.168.65>]
Jul 23 15:14:02 localhost pppd[4621]: rcvd [LCP ProtRej id=0x3 80 fd 01 01 00 
0f 1a 04 78 00 18 04 78 00 15 03 2f]
Jul 23 15:14:02 localhost pppd[4621]: rcvd [IPCP ConfAck id=0x2 <addr 
206.15.138.235> <compress VJ 0f 00> <ms-dns1 206.15.168.70> <ms-dns3 
206.15.168.65>]
Jul 23 15:14:02 localhost pppd[4621]: local  IP address 206.15.138.235
Jul 23 15:14:02 localhost pppd[4621]: remote IP address 10.10.10.10
Jul 23 15:14:02 localhost pppd[4621]: primary   DNS address 206.15.168.70
Jul 23 15:14:02 localhost pppd[4621]: secondary DNS address 206.15.168.65
Jul 23 15:14:02 localhost pppd[4621]: Script /etc/ppp/ip-up started (pid 4634)
Jul 23 15:14:03 localhost pppd[4621]: Script /etc/ppp/ip-up finished (pid 
4634), status = 0x0
Jul 23 15:14:57 localhost pppd[4621]: rcvd [LCP EchoReq id=0x4 
magic=0x13c10d28]
Jul 23 15:14:57 localhost pppd[4621]: sent [LCP EchoRep id=0x4 
magic=0x446ba45e]

With an advance of thanks,
	Jim
