From: Marcus Better <marcus@better.se>
Date: Wed, 06 May 2009 20:26:39 +0000
Subject: [PATCH] Accept ms-wins settings provided by server
Message-Id: <1241641599-32361-1-git-send-email-marcus@better.se>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The PPP servers of some UMTS/HSPA modems, including the Huawei E220
and E620, will send WINS server settings and insist that the client
accepts these. If the client does not do so, the modem will sometimes
provide bogus DNS server addresses like 10.11.12.13 and 10.11.12.14.

If we receive ms-wins settings from the server, save and include them
in our ConfReqs.

See also discussions at

  http://thread.gmane.org/gmane.linux.ppp/2721
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5711

Signed-off-by: Marcus Better <marcus@better.se>
---
 pppd/ipcp.c |   52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/pppd/ipcp.c b/pppd/ipcp.c
index b7da1f7..9d8df1c 100644
--- a/pppd/ipcp.c
+++ b/pppd/ipcp.c
@@ -723,7 +723,8 @@ ipcp_cilen(f)
 #define LENCIADDRS(neg)		(neg ? CILEN_ADDRS : 0)
 #define LENCIVJ(neg, old)	(neg ? (old? CILEN_COMPRESS : CILEN_VJ) : 0)
 #define LENCIADDR(neg)		(neg ? CILEN_ADDR : 0)
-#define LENCIDNS(neg)		(neg ? (CILEN_ADDR) : 0)
+#define LENCIDNS(neg)		LENCIADDR(neg)
+#define LENCIWINS(neg)		LENCIADDR(neg)
 
     /*
      * First see if we want to change our options to the old
@@ -745,7 +746,9 @@ ipcp_cilen(f)
 	    LENCIVJ(go->neg_vj, go->old_vj) +
 	    LENCIADDR(go->neg_addr) +
 	    LENCIDNS(go->req_dns1) +
-	    LENCIDNS(go->req_dns2)) ;
+	    LENCIDNS(go->req_dns2) +
+            LENCIWINS(go->winsaddr[0]) +
+            LENCIWINS(go->winsaddr[1])) ;
 }
 
 
@@ -819,6 +822,19 @@ ipcp_addci(f, ucp, lenp)
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
 
@@ -831,6 +847,10 @@ ipcp_addci(f, ucp, lenp)
 
     ADDCIDNS(CI_MS_DNS2, go->req_dns2, go->dnsaddr[1]);
 
+    ADDCIWINS(CI_MS_WINS1, go->winsaddr[0]);
+
+    ADDCIWINS(CI_MS_WINS2, go->winsaddr[1]);
+    
     *lenp -= len;
 }
 
@@ -1185,6 +1205,15 @@ ipcp_nakci(f, p, len, treat_as_reject)
 	    try.req_dns2 = 1;
 	    no.req_dns2 = 1;
 	    break;
+	case CI_MS_WINS1:
+	case CI_MS_WINS2:
+	    if (cilen != CILEN_ADDR)
+		goto bad;
+	    GETLONG(l, p);
+	    ciaddr1 = htonl(l);
+	    if (ciaddr1)
+		try.winsaddr[citype = CI_MS_WINS2] = ciaddr1;
+	    break;
 	}
 	p = next;
     }
@@ -1301,6 +1330,21 @@ ipcp_rejci(f, p, len)
 	try.neg = 0; \
     }
 
+#define REJCIWINS(opt, addr) \
+    if (addr && \
+	((cilen = p[1]) = CILEN_ADDR) && \
+	len >= cilen && \
+	p[0] = opt) { \
+	u_int32_t l; \
+	len -= cilen; \
+	INCPTR(2, p); \
+	GETLONG(l, p); \
+	cilong = htonl(l); \
+	/* Check rejected value. */ \
+	if (cilong != addr) \
+	    goto bad; \
+	try.winsaddr[opt = CI_MS_WINS2] = 0; \
+    }
 
     REJCIADDRS(CI_ADDRS, !go->neg_addr && go->old_addrs,
 	       go->ouraddr, go->hisaddr);
@@ -1314,6 +1358,10 @@ ipcp_rejci(f, p, len)
 
     REJCIDNS(CI_MS_DNS2, req_dns2, go->dnsaddr[1]);
 
+    REJCIWINS(CI_MS_WINS1, go->winsaddr[0]);
+
+    REJCIWINS(CI_MS_WINS2, go->winsaddr[1]);
+
     /*
      * If there are any remaining CIs, then this packet is bad.
      */
-- 
1.6.3.rc3

