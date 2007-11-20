From: Marcus Better <marcus@better.se>
Date: Tue, 20 Nov 2007 22:48:52 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <47436454.4010000@better.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020304030600010906030305"
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------020304030600010906030305
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

James Cameron wrote:
>> So it remains to patch pppd to accept the ms-wins settings then?
> 
> Give it a try, tell us what you find.

It works! I patched pppd to accept the WINS settings from the other side:

Nov 20 23:33:17 melech pppd[25464]: Connect: ppp0 <--> /dev/3gmodem
Nov 20 23:33:18 melech pppd[25464]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <magic 0x394ac5b7> <pcomp> <accomp>]
Nov 20 23:33:18 melech pppd[25464]: rcvd [LCP ConfReq id=0x0 <asyncmap
0x0> <auth chap MD5> <magic 0x50a91da> <pcomp> <accomp>]
Nov 20 23:33:18 melech pppd[25464]: sent [LCP ConfAck id=0x0 <asyncmap
0x0> <auth chap MD5> <magic 0x50a91da> <pcomp> <accomp>]
Nov 20 23:33:18 melech pppd[25464]: rcvd [LCP ConfAck id=0x1 <asyncmap
0x0> <magic 0x394ac5b7> <pcomp> <accomp>]
Nov 20 23:33:18 melech pppd[25464]: rcvd [LCP DiscReq id=0x1
magic=0x50a91da]
Nov 20 23:33:18 melech pppd[25464]: rcvd [CHAP Challenge id=0x1
<3886094f10ef4afad083954d7af40093>, name = "UMTS_CHAP_SRVR"]
Nov 20 23:33:18 melech pppd[25464]: sent [CHAP Response id=0x1
<8a22f34d3faa17922975defd5b2d6eb2>, name = "melech"]
Nov 20 23:33:18 melech pppd[25464]: rcvd [CHAP Success id=0x1 ""]
Nov 20 23:33:18 melech pppd[25464]: CHAP authentication succeeded
Nov 20 23:33:18 melech pppd[25464]: CHAP authentication succeeded
Nov 20 23:33:18 melech pppd[25464]: sent [IPCP ConfReq id=0x1 <addr
0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Nov 20 23:33:19 melech pppd[25464]: rcvd [IPCP ConfNak id=0x1 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:19 melech pppd[25464]: sent [IPCP ConfReq id=0x2 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:20 melech pppd[25464]: rcvd [IPCP ConfNak id=0x2 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:20 melech pppd[25464]: sent [IPCP ConfReq id=0x3 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:21 melech pppd[25464]: rcvd [IPCP ConfNak id=0x3 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:21 melech pppd[25464]: sent [IPCP ConfReq id=0x4 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:22 melech pppd[25464]: rcvd [IPCP ConfNak id=0x4 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:22 melech pppd[25464]: sent [IPCP ConfReq id=0x5 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:23 melech pppd[25464]: rcvd [IPCP ConfNak id=0x5 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:23 melech pppd[25464]: sent [IPCP ConfReq id=0x6 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:24 melech pppd[25464]: rcvd [IPCP ConfNak id=0x6 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:24 melech pppd[25464]: sent [IPCP ConfReq id=0x7 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:25 melech pppd[25464]: rcvd [IPCP ConfNak id=0x7 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:25 melech pppd[25464]: sent [IPCP ConfReq id=0x8 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:26 melech pppd[25464]: rcvd [IPCP ConfNak id=0x8 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:26 melech pppd[25464]: sent [IPCP ConfReq id=0x9 <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:27 melech pppd[25464]: rcvd [IPCP ConfNak id=0x9 <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins
10.11.12.14>]
Nov 20 23:33:27 melech pppd[25464]: sent [IPCP ConfReq id=0xa <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:27 melech pppd[25464]: rcvd [IPCP ConfReq id=0x0]
Nov 20 23:33:27 melech pppd[25464]: sent [IPCP ConfNak id=0x0 <addr
0.0.0.0>]
Nov 20 23:33:27 melech pppd[25464]: rcvd [IPCP ConfRej id=0xa <ms-wins
10.11.12.13> <ms-wins 10.11.12.14>]
Nov 20 23:33:27 melech pppd[25464]: sent [IPCP ConfReq id=0xb <addr
0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
Nov 20 23:33:27 melech pppd[25464]: rcvd [IPCP ConfNak id=0xb <addr
83.178.151.127> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
Nov 20 23:33:27 melech pppd[25464]: sent [IPCP ConfReq id=0xc <addr
83.178.151.127> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
Nov 20 23:33:27 melech pppd[25464]: rcvd [IPCP ConfAck id=0xc <addr
83.178.151.127> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
Nov 20 23:33:28 melech pppd[25464]: rcvd [IPCP ConfReq id=0x1]
Nov 20 23:33:28 melech pppd[25464]: sent [IPCP ConfAck id=0x1]
Nov 20 23:33:28 melech pppd[25464]: Could not determine remote IP
address: defaulting to 10.64.64.64
Nov 20 23:33:28 melech pppd[25464]: Cannot determine ethernet address
for proxy ARP
Nov 20 23:33:28 melech pppd[25464]: local  IP address 83.178.151.127
Nov 20 23:33:28 melech pppd[25464]: remote IP address 10.64.64.64
Nov 20 23:33:28 melech pppd[25464]: primary   DNS address 130.244.127.161
Nov 20 23:33:28 melech pppd[25464]: secondary DNS address 130.244.127.169
Nov 20 23:33:28 melech pppd[25464]: Script /etc/ppp/ip-up started (pid
25471)

It also requires using the "ipcp-max-failure" pppd option, I set it to 
30. The attached patch is against Debian pppd 2.4.4rel-9.

Regards,

Marcus

--------------020304030600010906030305
Content-Type: text/plain;
 name="ipcp-accept-wins.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipcp-accept-wins.diff"

--- ppp-2.4.4/pppd/ipcp.c	2007-11-20 23:20:02.022199444 +0100
+++ ppp-2.4.4.mine/pppd/ipcp.c	2007-11-20 23:23:06.210978674 +0100
@@ -723,7 +723,8 @@
 #define LENCIADDRS(neg)		(neg ? CILEN_ADDRS : 0)
 #define LENCIVJ(neg, old)	(neg ? (old? CILEN_COMPRESS : CILEN_VJ) : 0)
 #define LENCIADDR(neg)		(neg ? CILEN_ADDR : 0)
-#define LENCIDNS(neg)		(neg ? (CILEN_ADDR) : 0)
+#define LENCIDNS(neg)		LENCIADDR(neg)
+#define LENCIWINS(neg)		LENCIADDR(neg)
 
     /*
      * First see if we want to change our options to the old
@@ -745,7 +746,9 @@
 	    LENCIVJ(go->neg_vj, go->old_vj) +
 	    LENCIADDR(go->neg_addr) +
 	    LENCIDNS(go->req_dns1) +
-	    LENCIDNS(go->req_dns2)) ;
+	    LENCIDNS(go->req_dns2) +
+            LENCIWINS(go->winsaddr[0]) +
+            LENCIWINS(go->winsaddr[1])) ;
 }
 
 
@@ -819,6 +822,19 @@
 	    neg = 0; \
     }
 
+#define ADDCIWINS(opt, addr)                  \
+    if (addr) { \
+	if (len >= CILEN_ADDR) { \
+	    u_int32_t l; \
+	    PUTCHAR(opt, ucp); \
+	    PUTCHAR(CILEN_ADDR, ucp); \
+	    l = ntohl(addr); \
+	    PUTLONG(l, ucp); \
+	    len -= CILEN_ADDR; \
+	} else \
+	    addr = 0; \
+    }
+
     ADDCIADDRS(CI_ADDRS, !go->neg_addr && go->old_addrs, go->ouraddr,
 	       go->hisaddr);
 
@@ -831,6 +847,10 @@
 
     ADDCIDNS(CI_MS_DNS2, go->req_dns2, go->dnsaddr[1]);
 
+    ADDCIWINS(CI_MS_WINS1, go->winsaddr[0]);
+
+    ADDCIWINS(CI_MS_WINS2, go->winsaddr[1]);
+    
     *lenp -= len;
 }
 
@@ -1167,6 +1187,15 @@
 		try.neg_addr = 1;
 	    no.neg_addr = 1;
 	    break;
+	case CI_MS_WINS1:
+	case CI_MS_WINS2:
+	    if (cilen != CILEN_ADDR)
+		goto bad;
+	    GETLONG(l, p);
+	    ciaddr1 = htonl(l);
+	    if (ciaddr1)
+		try.winsaddr[citype == CI_MS_WINS2] = ciaddr1;
+	    break;
 	}
 	p = next;
     }
@@ -1283,6 +1312,21 @@
 	try.neg = 0; \
     }
 
+#define REJCIWINS(opt, addr) \
+    if (addr && \
+	((cilen = p[1]) == CILEN_ADDR) && \
+	len >= cilen && \
+	p[0] == opt) { \
+	u_int32_t l; \
+	len -= cilen; \
+	INCPTR(2, p); \
+	GETLONG(l, p); \
+	cilong = htonl(l); \
+	/* Check rejected value. */ \
+	if (cilong != addr) \
+	    goto bad; \
+	try.winsaddr[opt == CI_MS_WINS2] = 0; \
+    }
 
     REJCIADDRS(CI_ADDRS, !go->neg_addr && go->old_addrs,
 	       go->ouraddr, go->hisaddr);
@@ -1296,6 +1340,10 @@
 
     REJCIDNS(CI_MS_DNS2, req_dns2, go->dnsaddr[1]);
 
+    REJCIWINS(CI_MS_WINS1, go->winsaddr[0]);
+
+    REJCIWINS(CI_MS_WINS2, go->winsaddr[1]);
+
     /*
      * If there are any remaining CIs, then this packet is bad.
      */

--------------020304030600010906030305--
