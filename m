From: "Philip Buonadonna" <pbuonado@intel-research.net>
Date: Tue, 02 Mar 2004 22:34:27 +0000
Subject: pppd gotcha with ATT GPRS service using SE GC82
Message-Id: <03F1A9D14E1F3D4A984B3EDDFA9823DEF897@bldc02.research.intel-research.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I recently got the Sony Ericsson GC82 EGPRS card w/ ATT Wireless service
to work on Linux.  However, it required modifications to pppd.

The present version of pppd does some checking on recieved IP addresses
negotiated when establishing a link. That is, it does not allow
addresses that are in the loopback or multicast domains.

However, ATT wireless w/ the Sony Ericsson GC82 tries to negotiate
127.0.0.2 as the remote peer IP address. Unmodified versions of pppd
refuse to accept this address.  If I comment out the check in
'bad_ip_addrs' in auth.c (see below) everything works ok (see log
below).

A quick review of RFC 1331/1332 doesn't seem to indicate that 127.0.0.x
are excluded from PPP links.

The question(s) are: Is the reason I'm getting 127.0.0.2 as the remote
IP a configuration error on my part?  Is it unique to this GPRS
hardware?  Is it unique to ATT?  

Perhaps a new option to pppd would be to bypass the ip address checks?



Specifically, in 'pppd/auth.c'
	/*
	 * bad_ip_adrs - return 1 if the IP address is one we don't want
	 * to use, such as an address in the loopback net or a multicast
address.
	 * addr is in network byte order.
	 */
	int
	bad_ip_adrs(addr)
	    u_int32_t addr;
	{
	    addr = ntohl(addr);
	    /* return (addr >> IN_CLASSA_NSHIFT) = IN_LOOPBACKNET   <-
My changes
	      || IN_MULTICAST(addr) || IN_BADCLASS(addr); */
<-
	   return 0.
<-
	}


Log of GPRS connection:

Serial connection established.
using channel 5
Using interface ppp0
Connect: ppp0 <--> /dev/ttyS3
rcvd [LCP ConfReq id=0x4c <mru 1500> <asyncmap 0x0> <auth pap> <magic
0xbc2ae1> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0xc9399c77> <pcomp>
<accomp>]
sent [LCP ConfAck id=0x4c <mru 1500> <asyncmap 0x0> <auth pap> <magic
0xbc2ae1> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x3 <asyncmap 0x0> <magic 0xc9399c77> <pcomp>
<accomp>]
sent [LCP EchoReq id=0x0 magic=0xc9399c77]
sent [PAP AuthReq id=0x2 user="guest" password=<hidden>]
rcvd [LCP EchoRep id=0x0 magic=0xc9399c77]
appear to have received our own echo-reply!
rcvd [PAP AuthAck id=0x2 "PAP access OK"]
Remote message: PAP access OK
PAP authentication succeeded
sent [CCP ConfReq id=0x2 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3
0.0.0.0>]
rcvd [IPCP ConfReq id=0x4c <addr 127.0.0.2> <compress VJ 0f 01> <ms-dns1
10.250.1.10> <ms-dns3 10.250.1.11>]
sent [IPCP ConfRej id=0x4c <compress VJ 0f 01> <ms-dns1 10.250.1.10>
<ms-dns3 10.250.1.11>]
rcvd [LCP ProtRej id=0x4d 80 fd 01 02 00 0f 1a 04 78 00 18 04 78 00 15
03 2f]
rcvd [IPCP ConfNak id=0x3 <addr 10.80.146.176> <ms-dns1 10.250.1.10>
<ms-dns3 10.250.1.11>]
sent [IPCP ConfReq id=0x4 <addr 10.80.146.176> <ms-dns1 10.250.1.10>
<ms-dns3 10.250.1.11>]
rcvd [IPCP ConfReq id=0x4d <addr 127.0.0.2>]
sent [IPCP ConfAck id=0x4d <addr 127.0.0.2>]
rcvd [IPCP ConfAck id=0x4 <addr 10.80.146.176> <ms-dns1 10.250.1.10>
<ms-dns3 10.250.1.11>]
local  IP address 10.80.146.176
remote IP address 127.0.0.2
primary   DNS address 10.250.1.10
secondary DNS address 10.250.1.11
appear to have received our own echo-reply!


Philip Buonadonna
Intel Research
2150 Shattuck Ave. Ste 1300
Berkeley, CA 94704
Voice: (510) 495-3063
Fax: (510) 495-3049
 
