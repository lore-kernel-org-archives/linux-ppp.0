From: "Desai, Jason" <jase@sensis.com>
Date: Thu, 29 Jan 2004 15:12:54 +0000
Subject: RE: Strange problem with ppp.
Message-Id: <ADF6087CA978A4418AF7F76DDCF2F7210275785B@europa.ats.sensis.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <04ac01c3e660$80ed2560$f864a8c0@hyberwks>
In-Reply-To: <04ac01c3e660$80ed2560$f864a8c0@hyberwks>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Esben.  Looks to me like something is blocking GRE to your server.  You
may want to test the  connectivity to your server with a GRE patched
traceroute.

Jason

> -----Original Message-----
> From: Esben Laursen [mailto:hyber@hyber.dk] 
> Sent: Thursday, January 29, 2004 7:08 AM
> To: linux-ppp@vger.kernel.org
> Subject: Strange problem with ppp.
> 
> 
> Im having a strange problem when I try to connect my Windows 
> to my pptpd server.
> 
> Sometimes I can connect fine, no problem. And when I am 
> connected it works like a charm. But then other times I get a 
> 619 error.
> I have made no changes, what so ever...
> 
> My system are:
> 
> Debian 3.0r1 (2.4.22 custom kernel)
> ppp 2.4.2b3 (ppp-2.4.2_cvs_20030610)
> poptop 1.1.2 (have tryed with 1.1.3 and 1.1.4-b4 no changes there)
> 
> I have 2 independent server systems in two seperated city's 
> they both have the same problem, but they are not connected 
> to each other what so ever. I use only the vpn tunnel for 
> sysadmin of the computers on the internal LAN's
> 
> Here are the output of syslog:
> 
> First one connection that works:
> -- connection starting here:
> Jan 23 17:56:42 linux pptpd[13846]: CTRL: Client 
> 129.142.119.119 control connection started
> Jan 23 17:56:44 linux pptpd[13846]: CTRL: Starting call 
> (launching pppd, opening GRE)
> Jan 23 17:56:44 linux pppd[13847]: pppd 2.4.2b3 started by root, uid 0
> Jan 23 17:56:44 linux pppd[13847]: using channel 27
> Jan 23 17:56:44 linux pppd[13847]: Using interface ppp1
> Jan 23 17:56:44 linux pppd[13847]: Connect: ppp1 <--> /dev/pts/2
> Jan 23 17:56:44 linux pppd[13847]: sent [LCP ConfReq id=0x1 
> <asyncmap 0x0> <auth chap MS-v2> <magic 0xcfbf957> <pcomp> <accomp>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [LCP ConfReq id=0x0 
> <magic 0x53082625> <pcomp> <accomp> <callback CBCP> <mrru 
> 1614> <endpoint 
> [local:f5.83.db.bd.b3.2e.43.25.af.31.c2.7e.f6.87.00.59.00.00.00.4e]>]
> Jan 23 17:56:44 linux pppd[13847]: sent [LCP ConfRej id=0x0 
> <callback CBCP> <mrru 1614>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [LCP ConfAck id=0x1 
> <asyncmap 0x0> <auth chap MS-v2> <magic 0xcfbf957> <pcomp> <accomp>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [LCP ConfReq id=0x1 
> <magic 0x53082625> <pcomp> <accomp> <endpoint 
> [local:f5.83.db.bd.b3.2e.43.25.af.31.c2.7e.f6.87.00.59.00.00.00.4e]>]
> Jan 23 17:56:44 linux pppd[13847]: sent [LCP ConfAck id=0x1 
> <magic 0x53082625> <pcomp> <accomp> <endpoint 
> [local:f5.83.db.bd.b3.2e.43.25.af.31.c2.7e.f6.87.00.59.00.00.00.4e]>]
> Jan 23 17:56:44 linux pppd[13847]: sent [LCP EchoReq id=0x0 
> magic=0xcfbf957]
> Jan 23 17:56:44 linux pppd[13847]: sent [CHAP Challenge 
> id=0x1 <7e34d3c48bd9cacaf0cb73091abc6a8a>, name = "pptp"]
> Jan 23 17:56:44 linux pptpd[13846]: CTRL: Ignored a SET LINK 
> INFO packet with real ACCMs!
> Jan 23 17:56:44 linux pppd[13847]: rcvd [LCP code=0xc id=0x2 
> 53 08 26 25 4d 53 52 41 53 56 35 2e 30 30]
> Jan 23 17:56:44 linux pppd[13847]: sent [LCP CodeRej id=0x2 
> 0c 02 00 12 53 08 26 25 4d 53 52 41 53 56 35 2e 30 30]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [LCP code=0xc id=0x3 
> 53 08 26 25 4d 53 52 41 53 2d 30 2d 48 59 42 45 52 2d 57 4b 53]
> Jan 23 17:56:44 linux pppd[13847]: sent [LCP CodeRej id=0x3 
> 0c 03 00 19 53 08 26 25 4d 53 52 41 53 2d 30 2d 48 59 42 45 
> 52 2d 57 4b 53]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [LCP EchoRep id=0x0 
> magic=0x53082625]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [CHAP Response id=0x1 
> <9120a42b7efa0c7a13070c5b8dbf7a0e000000000000000046ebd51ef7dcd
> cc9911ef22c590067c2336504ea9b0ce0c300>, name = "root"]
> Jan 23 17:56:44 linux pppd[13847]: sent [CHAP Success id=0x1 
> "S-AE45839DB8D264F6CA0B81FE46251D86845241 M=Welcome to linux."]
> Jan 23 17:56:44 linux pppd[13847]: sent [CCP ConfReq id=0x1 
> <mppe +H -M +S +L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: CHAP peer authentication 
> succeeded for root
> Jan 23 17:56:44 linux pppd[13847]: rcvd [CCP ConfReq id=0x4 
> <mppe +H +M +S +L -D +C>]
> Jan 23 17:56:44 linux pppd[13847]: sent [CCP ConfNak id=0x4 
> <mppe +H -M +S -L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [IPCP ConfReq id=0x5 
> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins 0.0.0.0> <ms-dns3 
> 0.0.0.0> <ms-wins 0.0.0.0>]
> Jan 23 17:56:44 linux pppd[13847]: sent [IPCP TermAck id=0x5]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [CCP ConfNak id=0x1 
> <mppe +H -M +S -L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: sent [CCP ConfReq id=0x2 
> <mppe +H -M +S -L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [CCP ConfReq id=0x6 
> <mppe +H -M +S -L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: sent [CCP ConfAck id=0x6 
> <mppe +H -M +S -L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [CCP ConfAck id=0x2 
> <mppe +H -M +S -L -D -C>]
> Jan 23 17:56:44 linux pppd[13847]: MPPE 128-bit stateless 
> compression enabled
> Jan 23 17:56:44 linux pppd[13847]: sent [IPCP ConfReq id=0x1 
> <compress VJ 0f 01> <addr 10.0.1.1>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [IPCP ConfRej id=0x1 
> <compress VJ 0f 01>]
> Jan 23 17:56:44 linux pppd[13847]: sent [IPCP ConfReq id=0x2 
> <addr 10.0.1.1>]
> Jan 23 17:56:44 linux pppd[13847]: rcvd [IPCP ConfAck id=0x2 
> <addr 10.0.1.1>]
> Jan 23 17:56:46 linux pppd[13847]: rcvd [IPCP ConfReq id=0x7 
> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins 0.0.0.0> <ms-dns3 
> 0.0.0.0> <ms-wins 0.0.0.0>]
> Jan 23 17:56:46 linux pppd[13847]: sent [IPCP ConfNak id=0x7 
> <addr 10.0.1.3> <ms-dns1 192.168.1.100> <ms-wins 
> 192.168.1.100> <ms-dns3 192.168.1.100> <ms-wins 192.168.1.100>]
> Jan 23 17:56:46 linux pppd[13847]: rcvd [IPCP ConfReq id=0x8 
> <addr 10.0.1.3> <ms-dns1 192.168.1.100> <ms-wins 
> 192.168.1.100> <ms-dns3 192.168.1.100> <ms-wins 192.168.1.100>]
> Jan 23 17:56:46 linux pppd[13847]: sent [IPCP ConfAck id=0x8 
> <addr 10.0.1.3> <ms-dns1 192.168.1.100> <ms-wins 
> 192.168.1.100> <ms-dns3 192.168.1.100> <ms-wins 192.168.1.100>]
> Jan 23 17:56:46 linux pppd[13847]: Cannot determine ethernet 
> address for proxy ARP
> Jan 23 17:56:46 linux pppd[13847]: local IP address 10.0.1.1
> Jan 23 17:56:46 linux pppd[13847]: remote IP address 10.0.1.3
> Jan 23 17:56:46 linux pppd[13847]: Script /etc/ppp/ip-up 
> started (pid 13849)
> Jan 23 17:56:46 linux pppd[13847]: Script /etc/ppp/ip-up 
> finished (pid 13849), status = 0x1
> Jan 23 17:57:04 linux pppd[13847]: rcvd [LCP TermReq id=0x9 
> "S\010&%\000<\37777777715t\000\000\000\000"]
> Jan 23 17:57:04 linux pppd[13847]: LCP terminated by peer 
> (S^H&%^@<M-Mt^@^@^@^@)
> Jan 23 17:57:04 linux pppd[13847]: Script /etc/ppp/ip-down 
> started (pid 13859)
> Jan 23 17:57:04 linux pppd[13847]: sent [LCP TermAck id=0x9]
> Jan 23 17:57:04 linux pppd[13847]: Script /etc/ppp/ip-down 
> finished (pid 13859), status = 0x0
> Jan 23 17:57:04 linux pppd[13847]: Modem hangup
> Jan 23 17:57:04 linux pppd[13847]: Connection terminated.
> Jan 23 17:57:04 linux pppd[13847]: Connect time 0.4 minutes.
> Jan 23 17:57:04 linux pppd[13847]: Sent 314 bytes, received 
> 3801 bytes.
> Jan 23 17:57:05 linux pppd[13847]: Connect time 0.4 minutes.
> Jan 23 17:57:05 linux pppd[13847]: Sent 314 bytes, received 
> 3801 bytes.
> Jan 23 17:57:05 linux pppd[13847]: Exit.
> Jan 23 17:57:05 linux pptpd[13846]: GRE: read error: Bad file 
> descriptor
> Jan 23 17:57:05 linux pptpd[13846]: CTRL: PTY read or GRE 
> write failed (pty,gre)=(-1,-1)
> Jan 23 17:57:05 linux pptpd[13846]: CTRL: Client 
> 129.142.119.119 control connection finished
> -- Connection disconnected here.
> 
> And then a little later, a connection that didnt work:
> 
> -- Connection starting here
> Jan 23 18:13:08 linux pptpd[13895]: CTRL: Client 
> 129.142.119.119 control connection started
> Jan 23 18:13:11 linux pptpd[13895]: CTRL: Starting call 
> (launching pppd, opening GRE)
> Jan 23 18:13:11 linux pppd[13896]: pppd 2.4.2b3 started by root, uid 0
> Jan 23 18:13:11 linux pppd[13896]: using channel 29
> Jan 23 18:13:11 linux pppd[13896]: Using interface ppp1
> Jan 23 18:13:11 linux pppd[13896]: Connect: ppp1 <--> /dev/pts/1
> Jan 23 18:13:11 linux pppd[13896]: sent [LCP ConfReq id=0x1 
> <asyncmap 0x0> <auth chap MS-v2> <magic 0x5dacf62b> <pcomp> <accomp>]
> 
> -- Windows Client hangs here for some time..
> 
> Jan 23 18:13:38 linux last message repeated 9 times
> Jan 23 18:13:41 linux pppd[13896]: LCP: timeout sending 
> Config-Requests 
> Jan 23 18:13:41 linux pppd[13896]: Connection terminated.
> Jan 23 18:13:41 linux pppd[13896]: Exit.
> Jan 23 18:13:41 linux pptpd[13895]: Error reading from pppd: 
> Input/output error
> Jan 23 18:13:41 linux pptpd[13895]: CTRL: GRE read or PTY 
> write failed (gre,pty)=(6,5)
> Jan 23 18:13:41 linux pptpd[13895]: CTRL: Client 
> 129.142.119.119 control connection finished
> 
> -- Windows client gets a 619 error. and get disconnected.
> 
> As far as I can see its the
> sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> 
> <magic 0x5dacf62b> <pcomp> <accomp>]
> that fails, this is where the server is sending the 
> information to the client right?
> When the connection fails, it and I try again, no matter what 
> passwd im giveing the server it makes the 619 error, if the 
> connection works I get a new prompt where I have to type the 
> correct password..
> 
> Can someone help?? Ive added as much detail as possible, but 
> just ask if I need to supply more info..
> 
> Kind Regards
> 
> Esben
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
