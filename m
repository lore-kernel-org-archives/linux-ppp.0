From: Marcus Better <marcus@better.se>
Date: Wed, 31 Oct 2007 21:20:43 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <4728F1AB.3040904@better.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh wrote:
> He supplies you with those but also windows server addresses. And below he
> demands that you accept them. That is apparently a non-negotiable demand
> for him. Put in at least one, maybe 2
> ms-wins 0.0.0.0
> into your pppd options.

That didn't seem to make a difference. I believe the ms-wins option is 
only effective for incoming connections, but I may be wrong. See this 
log, where the session succeeds, but it looks similar to previous ones:

Oct 31 21:44:56 melech pppd[5218]: Serial connection established.
Oct 31 21:44:56 melech pppd[5218]: using channel 7
Oct 31 21:44:56 melech pppd[5218]: Using interface ppp0
Oct 31 21:44:56 melech pppd[5218]: Connect: ppp0 <--> /dev/3gmodem
Oct 31 21:44:57 melech pppd[5218]: sent [LCP ConfReq id=0x1 <asyncmap 
0x0> <magic 0x453fe8e6> <pcomp> <accomp>]
Oct 31 21:44:57 melech pppd[5218]: rcvd [LCP ConfReq id=0x0 <asyncmap 
0x0> <auth chap MD5> <magic 0x50e52ff> <pcomp> <accomp>]
Oct 31 21:44:57 melech pppd[5218]: sent [LCP ConfNak id=0x0 <auth pap>]
Oct 31 21:44:57 melech pppd[5218]: rcvd [LCP ConfAck id=0x1 <asyncmap 
0x0> <magic 0x453fe8e6> <pcomp> <accomp>]
Oct 31 21:44:57 melech pppd[5218]: rcvd [LCP ConfReq id=0x1 <asyncmap 
0x0> <auth pap> <magic 0x50e52ff> <pcomp> <accomp>]
Oct 31 21:44:57 melech pppd[5218]: sent [LCP ConfAck id=0x1 <asyncmap 
0x0> <auth pap> <magic 0x50e52ff> <pcomp> <accomp>]
Oct 31 21:44:57 melech pppd[5218]: sent [PAP AuthReq id=0x1 
user="melech" password=<hidden>]
Oct 31 21:44:57 melech pppd[5218]: rcvd [LCP DiscReq id=0x2 magic=0x50e52ff]
Oct 31 21:44:57 melech pppd[5218]: rcvd [PAP AuthAck id=0x1 ""]
Oct 31 21:44:57 melech pppd[5218]: PAP authentication succeeded
Oct 31 21:44:57 melech pppd[5218]: sent [IPCP ConfReq id=0x1 <addr 
0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Oct 31 21:44:58 melech pppd[5218]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 
10.11.12.14>]
Oct 31 21:44:58 melech pppd[5218]: sent [IPCP ConfReq id=0x2 <addr 
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
Oct 31 21:44:58 melech pppd[5218]: rcvd [IPCP ConfReq id=0x0]
Oct 31 21:44:58 melech pppd[5218]: sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
Oct 31 21:44:58 melech pppd[5218]: rcvd [IPCP ConfNak id=0x2 <addr 
83.178.248.251> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
Oct 31 21:44:58 melech pppd[5218]: sent [IPCP ConfReq id=0x3 <addr 
83.178.248.251> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
Oct 31 21:44:58 melech pppd[5218]: rcvd [IPCP ConfAck id=0x3 <addr 
83.178.248.251> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
Oct 31 21:44:59 melech pppd[5218]: rcvd [IPCP ConfReq id=0x1]
Oct 31 21:44:59 melech pppd[5218]: sent [IPCP ConfAck id=0x1]
Oct 31 21:44:59 melech pppd[5218]: Could not determine remote IP 
address: defaulting to 10.64.64.64
Oct 31 21:44:59 melech pppd[5218]: Cannot determine ethernet address for 
proxy ARP
Oct 31 21:44:59 melech pppd[5218]: local  IP address 83.178.248.251
Oct 31 21:44:59 melech pppd[5218]: remote IP address 10.64.64.64
Oct 31 21:44:59 melech pppd[5218]: primary   DNS address 130.244.127.161
Oct 31 21:44:59 melech pppd[5218]: secondary DNS address 130.244.127.169

Thanks,

Marcus
