From: "zhang guocheng" <gczh1006@gmail.com>
Date: Wed, 27 Dec 2006 08:35:59 +0000
Subject: serial line is looped back!
Message-Id: <cfd1efa00612270035p56f20450ncda10c76d10fa379@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi ,all .
      please excuse my poor English,I have got a problem for a long
time ,and i have done a lot of research in this questions ,but still
have no way!
      my kernel is linux2.4. the pppd version is 2.3.8, and cpu is s3c44b0
      when i excuted pppd like this
      /mnt/mtd0> pppd file gprs&
     system got some messages about this :
...
<31>Jan  1 00:53:18 pppd[40]: lcp_reqci: returning CONFNAK.
<31>Jan  1 00:53:18 pppd[40]: sent [LCP ConfNak id=0x9 <magic 0xfe72343>]
<31>Jan  1 00:53:18 pppd[40]: rcvd [LCP ConfNak id=0x9 <magic 0xfe72343>]
<31>Jan  1 00:53:18 pppd[40]: sent [LCP ConfReq id=0xa <asyncmap 0x0> <auth pap>
<31>Jan  1 00:53:18 pppd[40]: rcvd [LCP ConfReq id=0xa <asyncmap 0x0> <auth pap>
...
<29>Jan  1 00:53:18 pppd[40]: Serial line is looped back.
...
the pppd server runs well.  and the scripts runs well on my redhat9.0.
this problem seems to be resolved by adding a option ,-mn,but the
other problem is coming ,
31>Jan  1 00:51:18 pppd[37]: sent [LCP ConfAck id=0x1 <auth pap> <accomp>]
<31>Jan  1 00:51:18 pppd[37]: rcvd [LCP ConfAck id=0x1 <auth pap> <accomp>]
<31>Jan  1 00:51:18 pppd[37]: sent [PAP AuthReq id=0x1 user="john_doe" password<31>Jan  1 00:51:18 pppd[37]: rcvd [PAP AuthReq id=0x1 user="john_doe" password<31>Jan  1 00:51:18 pppd[37]: sent [PAP AuthAck id=0x1 "Login ok"]
<31>Jan  1 00:51:18 pppd[37]: rcvd [PAP AuthAck id=0x1 "Login ok"]
# seems to authenticate success!
<30>Jan  1 00:51:18 pppd[37]: Remote message: Login ok
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress
<31>Jan  1 00:51:18 pppd[37]: sent [CCP ConfReq id=0x1]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP ConfRej id=0x1 <addr 0.0.0.0>]
<31>Jan  1 00:51:18 pppd[37]: rcvd [CCP ConfReq id=0x1]
<31>Jan  1 00:51:18 pppd[37]: sent [CCP ConfAck id=0x1]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP ConfRej id=0x1 <addr 0.0.0.0>]
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP ConfReq id=0x2 <addrs 0.0.0.0 0.0.0.0>
<31>Jan  1 00:51:18 pppd[37]: rcvd [CCP ConfAck id=0x1]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP ConfReq id=0x2 <addrs 0.0.0.0 0.0.0.0>
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP ConfRej id=0x2 <addrs 0.0.0.0 0.0.0.0>]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP ConfRej id=0x2 <addrs 0.0.0.0
0.0.0.0 >]
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP ConfReq id=0x3 <compress VJ 0f 01>]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP ConfReq id=0x3 <compress VJ 0f 01>]
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP ConfAck id=0x3 <compress VJ 0f 01>]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP ConfAck id=0x3 <compress VJ 0f 01>]
<27>Jan  1 00:51:18 pppd[37]: Could not determine remote IP address
<30>Jan  1 00:51:18 pppd[37]: Removing resolv.conf for 0.0.0.0
<27>Jan  1 00:51:18 pppd[37]: Unable to create temporary file
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP TermReq id=0x4 "Could not determine rem
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP TermReq id=0x4 "Could not determine rem
<31>Jan  1 00:51:18 pppd[37]: sent [IPCP TermAck id=0x4]
<31>Jan  1 00:51:18 pppd[37]: rcvd [IPCP TermAck id=0x4]
<31>Jan  1 00:51:18 pppd[37]: sent [LCP TermReq id=0x2 "No network protocols run
<31>Jan  1 00:51:18 pppd[37]: rcvd [LCP TermReq id=0x2 "No network protocols run
<31>Jan  1 00:51:18 pppd[37]: sent [LCP TermAck id=0x2]
<31>Jan  1 00:51:18 pppd[37]: rcvd [LCP TermAck id=0x2]
<29>Jan  1 00:51:18 pppd[37]: Connection terminated.
...

i have do a lot of work to resolv the problem,like by add a line
:10.142.0.1 in my gprs file,but it just sent the ip to remote ip and
the local ip address.the log follows:
<29>Jan  1 01:28:09 pppd[43]: local  IP address 10.142.0.1
<29>Jan  1 01:28:09 pppd[43]: remote IP address 10.142.0.1


can anybody help me ?
   best wishes

                gczh
