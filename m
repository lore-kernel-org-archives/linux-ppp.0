From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 07 May 2009 12:47:24 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <alpine.LNX.2.00.0905071443310.22532@wotan.suse.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 7 May 2009, Paul Mackerras wrote:

> > Well, that's the observation. As soon as pppd is patched to accept the 
> > WINS settings, the DNS settings always arrive. If we don't accept WINS 
> > settings, sometimes (reproducibly) no DNS settings are received.
> Do you have logs of the negotiations with and without the patch?  I'd
> be interested to see them.

For the one without the patch, I have one handy myself (from 2.4.4)

sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x281deae4> <accomp>]
rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0xe1cd3a> <pcomp> <accomp>]
No auth is possible
sent [LCP ConfRej id=0x0 <auth chap MD5> <pcomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x281deae4> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xe1cd3a> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xe1cd3a> <accomp>]
sent [LCP EchoReq id=0x0 magic=0x281deae4]
sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [LCP DiscReq id=0x2 magic=0xe1cd3a]
rcvd [LCP EchoRep id=0x0 magic=0xe1cd3a 28 1d ea e4]
rcvd [LCP ProtRej id=0x3 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
Protocol-Reject for 'Compression Control Protocol' (0x80fd) received
rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x4 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x6 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x6 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x7 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x7 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x8 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x8 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x9 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x9 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xa <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0xa <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0xb <addr 0.0.0.0>]
rcvd [IPCP ConfReq id=0x0]
sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0xb <addr 10.169.204.193>]
sent [IPCP ConfReq id=0xc]
rcvd [IPCP ConfReq id=0x1]
sent [IPCP ConfAck id=0x1]
rcvd [IPCP ConfNak id=0xc <addr 10.169.204.193>]
sent [IPCP ConfReq id=0xd <addr 10.169.204.193>]
rcvd [IPCP ConfAck id=0xd <addr 10.169.204.193>]
Could not determine remote IP address: defaulting to 10.64.64.64
local  IP address 10.169.204.193
remote IP address 10.64.64.64
primary   DNS address 10.11.12.13
secondary DNS address 10.11.12.14


I don't currently have handy the log for the patched case myself where the 
bug triggered, but one can be found linked in the referenced bug -- it can 
be found on 
http://koti.kapsi.fi/~mcfrisk/gprs_debug/qualcomm_ppp/ppp_log_huawei_fixed_pppd.txt

[ copy/pasting in for the archive of the list to have in case it vanishes 
from the URL ]

sent [LCP ConfReq id=0x1 <asyncmap 0xa0000> <magic 0x4eb0abc8>]
rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0x2006672d> <pcomp> <accomp>]
sent [LCP ConfRej id=0x0 <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0xa0000> <magic 0x4eb0abc8>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MD5> <magic 0x2006672d>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <auth chap MD5> <magic 0x2006672d>]
rcvd [LCP DiscReq id=0x2 magic=0x2006672d]
rcvd [CHAP Challenge id=0x1 <1a35cd97d28b59211899ea7d3c37e9b4>, name = "UMTS_CHAP_SRVR"]
sent [CHAP Response id=0x1 <def0f0c42bedbc7a2443568321a0f06a>, name = "foo"]
rcvd [CHAP Success id=0x1 ""]
CHAP authentication succeeded
CHAP authentication succeeded
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
rcvd [IPCP ConfReq id=0x0]
sent [IPCP ConfNak id=0x0 <addr 10.0.0.1>]
rcvd [IPCP ConfNak id=0x3 <addr 85.156.2.250> <ms-dns1 193.229.0.40> <ms-dns3 193.229.0.42>]
sent [IPCP ConfReq id=0x4 <addr 85.156.2.250> <ms-dns1 193.229.0.40> <ms-dns3 193.229.0.42>]
rcvd [IPCP ConfReq id=0x1]
sent [IPCP ConfAck id=0x1]
rcvd [IPCP ConfAck id=0x4 <addr 85.156.2.250> <ms-dns1 193.229.0.40> <ms-dns3 193.229.0.42>]
Cannot determine ethernet address for proxy ARP
local  IP address 85.156.2.250
remote IP address 10.0.0.1
primary   DNS address 193.229.0.40
secondary DNS address 193.229.0.42
Script /etc/ppp/ip-up started (pid 13168)
Script /etc/ppp/ip-up finished (pid 13168), status = 0x0

Thanks,

-- 
Jiri Kosina
SUSE Labs
