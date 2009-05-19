From: Marcus Better <marcus@better.se>
Date: Tue, 19 May 2009 19:28:12 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <guv18o$opq$1@ger.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Mackerras wrote:
> Also, have you tried the latest git version of pppd?  Since 2.4.4 I
> have added code to add the MS-DNS option to our IPCP conf-reqs if the
> modem insists.

I cannot reproduce the problem anymore. I have changed UMTS provider in between (from Tele2 to 3 in Sweden), and modem (from 
Huawei E620 to E220). This may explain the differences.

However I still have a very similar connection problem, but the patch makes no difference. I tried both pppd 2.4.4 and current 
git, patched and unpatched. In all cases it tends to fail at the first connection attempt after plugging in the modem. What 
helps however is setting ipcp-max-failure high enough, like 30.

I'm quite sure that the patch was needed with the old provider and hardware, and a few other people have confirmed this. I'll 
see if I can try another modem.

Hopefully someone else can reproduce it?

Here is the log with the current git (unpatched), failure case:

May 19 20:31:58 better kernel: PPP generic driver version 2.4.2
May 19 20:31:58 better pppd[10996]: pppd 2.4.5 started by root, uid 0
May 19 20:31:58 better pppd[10996]: Script /usr/sbin/chat -v -f /etc/ppp/3g.chat finished (pid 10999), status = 0x0
May 19 20:31:58 better pppd[10996]: Serial connection established.
May 19 20:31:59 better pppd[10996]: using channel 1
May 19 20:31:59 better pppd[10996]: Using interface ppp0
May 19 20:31:59 better pppd[10996]: Connect: ppp0 <--> /dev/3gmodem
May 19 20:32:00 better pppd[10996]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x803a1d6f> <pcomp> <accomp>]
May 19 20:32:00 better pppd[10996]: rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xca9094> <pcomp> <accomp>]
May 19 20:32:00 better pppd[10996]: sent [LCP ConfNak id=0x0 <auth pap>]
May 19 20:32:00 better pppd[10996]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x803a1d6f> <pcomp> <accomp>]
May 19 20:32:00 better pppd[10996]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth pap> <magic 0xca9094> <pcomp> <accomp>]
May 19 20:32:00 better pppd[10996]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <auth pap> <magic 0xca9094> <pcomp> <accomp>]
May 19 20:32:00 better pppd[10996]: sent [LCP EchoReq id=0x0 magic=0x803a1d6f]
May 19 20:32:00 better pppd[10996]: sent [PAP AuthReq id=0x1 user="better" password=<hidden>]
May 19 20:32:00 better pppd[10996]: rcvd [LCP DiscReq id=0x2 magic=0xca9094]
May 19 20:32:00 better pppd[10996]: rcvd [LCP EchoRep id=0x0 magic=0xca9094 80 3a 1d 6f]
May 19 20:32:00 better pppd[10996]: rcvd [PAP AuthAck id=0x1 ""]
May 19 20:32:00 better pppd[10996]: PAP authentication succeeded
May 19 20:32:00 better pppd[10996]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
May 19 20:32:01 better pppd[10996]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:01 better pppd[10996]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:02 better pppd[10996]: rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:02 better pppd[10996]: sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:03 better pppd[10996]: rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:03 better pppd[10996]: sent [IPCP ConfReq id=0x4 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:04 better pppd[10996]: rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:04 better pppd[10996]: sent [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:05 better pppd[10996]: rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:05 better pppd[10996]: sent [IPCP ConfReq id=0x6 <addr 0.0.0.0>]
May 19 20:32:06 better pppd[10996]: rcvd [IPCP ConfNak id=0x6 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:06 better pppd[10996]: sent [IPCP ConfReq id=0x7 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:07 better pppd[10996]: rcvd [IPCP ConfNak id=0x7 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:07 better pppd[10996]: sent [IPCP ConfReq id=0x8 <addr 0.0.0.0>]
May 19 20:32:08 better pppd[10996]: rcvd [IPCP ConfNak id=0x8 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:08 better pppd[10996]: sent [IPCP ConfReq id=0x9 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:09 better pppd[10996]: rcvd [IPCP ConfNak id=0x9 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:09 better pppd[10996]: sent [IPCP ConfReq id=0xa <addr 0.0.0.0>]
May 19 20:32:10 better pppd[10996]: rcvd [IPCP ConfNak id=0xa <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:10 better pppd[10996]: sent [IPCP ConfReq id=0xb <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:11 better pppd[10996]: rcvd [IPCP ConfNak id=0xb <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:11 better pppd[10996]: sent [IPCP ConfReq id=0xc <addr 0.0.0.0>]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xc <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xd <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfReq id=0x0]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xd <addr 95.209.165.82> <ms-dns1 80.251.192.244> <ms-dns2 
80.251.192.245>]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xe]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfReq id=0x1]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfAck id=0x1]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfNak id=0xe <addr 95.209.165.82>]
May 19 20:32:12 better pppd[10996]: sent [IPCP ConfReq id=0xf <addr 95.209.165.82>]
May 19 20:32:12 better pppd[10996]: rcvd [IPCP ConfAck id=0xf <addr 95.209.165.82>]
May 19 20:32:12 better pppd[10996]: Could not determine remote IP address: defaulting to 10.64.64.64
May 19 20:32:12 better pppd[10996]: not replacing existing default route via 192.168.1.1
May 19 20:32:12 better pppd[10996]: Cannot determine ethernet address for proxy ARP
May 19 20:32:12 better pppd[10996]: local  IP address 95.209.165.82
May 19 20:32:12 better pppd[10996]: remote IP address 10.64.64.64

Second attempt, successful connection (current git, unpatched):

May 19 20:35:57 better pppd[11280]: pppd 2.4.5 started by root, uid 0
May 19 20:36:00 better pppd[11280]: Script /usr/sbin/chat -v -f /etc/ppp/3g.chat finished (pid 11281), status = 0x0
May 19 20:36:00 better pppd[11280]: Serial connection established.
May 19 20:36:00 better pppd[11280]: using channel 2
May 19 20:36:00 better pppd[11280]: Using interface ppp0
May 19 20:36:00 better pppd[11280]: Connect: ppp0 <--> /dev/3gmodem
May 19 20:36:01 better pppd[11280]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xcc72d817> <pcomp> <accomp>]
May 19 20:36:01 better pppd[11280]: rcvd [LCP ConfReq id=0x3 <asyncmap 0x0> <auth chap MD5> <magic 0xce3f01> <pcomp> <accomp>]
May 19 20:36:01 better pppd[11280]: sent [LCP ConfNak id=0x3 <auth pap>]
May 19 20:36:01 better pppd[11280]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xcc72d817> <pcomp> <accomp>]
May 19 20:36:01 better pppd[11280]: rcvd [LCP ConfReq id=0x4 <asyncmap 0x0> <auth pap> <magic 0xce3f01> <pcomp> <accomp>]
May 19 20:36:01 better pppd[11280]: sent [LCP ConfAck id=0x4 <asyncmap 0x0> <auth pap> <magic 0xce3f01> <pcomp> <accomp>]
May 19 20:36:01 better pppd[11280]: sent [LCP EchoReq id=0x0 magic=0xcc72d817]
May 19 20:36:01 better pppd[11280]: sent [PAP AuthReq id=0x1 user="better" password=<hidden>]
May 19 20:36:01 better pppd[11280]: rcvd [LCP DiscReq id=0x5 magic=0xce3f01]
May 19 20:36:01 better pppd[11280]: rcvd [LCP EchoRep id=0x0 magic=0xce3f01 cc 72 d8 17]
May 19 20:36:01 better pppd[11280]: rcvd [PAP AuthAck id=0x1 ""]
May 19 20:36:01 better pppd[11280]: PAP authentication succeeded
May 19 20:36:01 better pppd[11280]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
May 19 20:36:02 better hdapsd[4873]: un-parking
May 19 20:36:02 better pppd[11280]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:36:02 better pppd[11280]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:36:03 better pppd[11280]: rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:36:03 better pppd[11280]: sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14>]
May 19 20:36:04 better pppd[11280]: rcvd [IPCP ConfReq id=0x2]
May 19 20:36:04 better pppd[11280]: sent [IPCP ConfNak id=0x2 <addr 0.0.0.0>]
May 19 20:36:04 better pppd[11280]: rcvd [IPCP ConfNak id=0x3 <addr 95.209.163.10> <ms-dns1 80.251.192.244> <ms-dns2 
80.251.192.245>]
May 19 20:36:04 better pppd[11280]: sent [IPCP ConfReq id=0x4 <addr 95.209.163.10> <ms-dns1 80.251.192.244> <ms-dns2 
80.251.192.245>]
May 19 20:36:04 better pppd[11280]: rcvd [IPCP ConfReq id=0x3]
May 19 20:36:04 better pppd[11280]: sent [IPCP ConfAck id=0x3]
May 19 20:36:04 better pppd[11280]: rcvd [IPCP ConfAck id=0x4 <addr 95.209.163.10> <ms-dns1 80.251.192.244> <ms-dns2 
80.251.192.245>]
May 19 20:36:04 better pppd[11280]: Could not determine remote IP address: defaulting to 10.64.64.64
May 19 20:36:04 better pppd[11280]: not replacing existing default route through eth0
May 19 20:36:04 better pppd[11280]: Cannot determine ethernet address for proxy ARP
May 19 20:36:04 better pppd[11280]: local  IP address 95.209.163.10
May 19 20:36:04 better pppd[11280]: remote IP address 10.64.64.64
May 19 20:36:04 better pppd[11280]: primary   DNS address 80.251.192.244
May 19 20:36:04 better pppd[11280]: secondary DNS address 80.251.192.245

After replugging the modem, current git with the patch applied:

May 19 20:49:10 better pppd[12763]: pppd 2.4.5 started by root, uid 0
May 19 20:49:10 better pppd[12763]: Script /usr/sbin/chat -v -f /etc/ppp/3g.chat finished (pid 12764), status = 0x0
May 19 20:49:10 better pppd[12763]: Serial connection established.
May 19 20:49:10 better pppd[12763]: using channel 4
May 19 20:49:10 better pppd[12763]: Using interface ppp0
May 19 20:49:10 better pppd[12763]: Connect: ppp0 <--> /dev/3gmodem
May 19 20:49:11 better pppd[12763]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xbad3a25f> <pcomp> <accomp>]
May 19 20:49:11 better pppd[12763]: rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xc8a08d> <pcomp> <accomp>]
May 19 20:49:11 better pppd[12763]: sent [LCP ConfNak id=0x0 <auth pap>]
May 19 20:49:11 better pppd[12763]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xbad3a25f> <pcomp> <accomp>]
May 19 20:49:11 better pppd[12763]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth pap> <magic 0xc8a08d> <pcomp> <accomp>]
May 19 20:49:11 better pppd[12763]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <auth pap> <magic 0xc8a08d> <pcomp> <accomp>]
May 19 20:49:11 better pppd[12763]: sent [LCP EchoReq id=0x0 magic=0xbad3a25f]
May 19 20:49:11 better pppd[12763]: sent [PAP AuthReq id=0x1 user="better" password=<hidden>]
May 19 20:49:11 better pppd[12763]: rcvd [LCP DiscReq id=0x2 magic=0xc8a08d]
May 19 20:49:11 better pppd[12763]: rcvd [LCP EchoRep id=0x0 magic=0xc8a08d ba d3 a2 5f]
May 19 20:49:11 better pppd[12763]: rcvd [PAP AuthAck id=0x1 ""]
May 19 20:49:11 better pppd[12763]: PAP authentication succeeded
May 19 20:49:11 better pppd[12763]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
May 19 20:49:12 better pppd[12763]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:12 better pppd[12763]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-
wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:13 better pppd[12763]: rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:13 better pppd[12763]: sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-
wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:15 better pppd[12763]: rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:15 better pppd[12763]: sent [IPCP ConfReq id=0x4 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-
wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:16 better pppd[12763]: rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:16 better pppd[12763]: sent [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-
wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:17 better pppd[12763]: rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:17 better pppd[12763]: sent [IPCP ConfReq id=0x6 <addr 0.0.0.0> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:18 better pppd[12763]: rcvd [IPCP ConfNak id=0x6 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:18 better pppd[12763]: sent [IPCP ConfReq id=0x7 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-
wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:19 better pppd[12763]: rcvd [IPCP ConfNak id=0x7 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:19 better pppd[12763]: sent [IPCP ConfReq id=0x8 <addr 0.0.0.0> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:20 better pppd[12763]: rcvd [IPCP ConfNak id=0x8 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:20 better pppd[12763]: sent [IPCP ConfReq id=0x9 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-
wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:21 better pppd[12763]: rcvd [IPCP ConfNak id=0x9 <ms-dns1 10.11.12.13> <ms-dns2 10.11.12.14> <ms-wins 
10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:21 better pppd[12763]: sent [IPCP ConfReq id=0xa <addr 0.0.0.0> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:22 better pppd[12763]: rcvd [IPCP ConfReq id=0x0]
May 19 20:49:22 better pppd[12763]: sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
May 19 20:49:22 better pppd[12763]: rcvd [IPCP ConfRej id=0xa <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
May 19 20:49:22 better pppd[12763]: sent [IPCP ConfReq id=0xb <addr 0.0.0.0>]
May 19 20:49:22 better pppd[12763]: rcvd [IPCP ConfReq id=0x1]
May 19 20:49:22 better pppd[12763]: sent [IPCP ConfAck id=0x1]
May 19 20:49:22 better pppd[12763]: rcvd [IPCP ConfNak id=0xb <addr 95.209.175.89>]
May 19 20:49:22 better pppd[12763]: sent [IPCP ConfReq id=0xc <addr 95.209.175.89>]
May 19 20:49:22 better pppd[12763]: rcvd [IPCP ConfAck id=0xc <addr 95.209.175.89>]
May 19 20:49:22 better pppd[12763]: Could not determine remote IP address: defaulting to 10.64.64.64
May 19 20:49:22 better dnsmasq[5417]: no servers found in /var/run/dnsmasq/resolv.conf, will retry
May 19 20:49:22 better pppd[12763]: Cannot determine ethernet address for proxy ARP
May 19 20:49:22 better pppd[12763]: local  IP address 95.209.175.89
May 19 20:49:22 better pppd[12763]: remote IP address 10.64.64.64

Cheers,

Marcus

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoTCE0ACgkQXjXn6TzcAQnbCwCfe7gc6iLuqzesc3BUCB5HoprE
XbYAoLSIxNnly7vbL/57CaJ8fGkPZ00j
=2RWX
-----END PGP SIGNATURE-----


