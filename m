From: Libor Pechacek <lpechacek@suse.cz>
Date: Mon, 01 Feb 2010 12:59:45 +0000
Subject: [PATCH] Make `nosendip' behavior more insistent
Message-Id: <20100201125945.GC22948@fm.suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

Recently I was testing scenario where the remote end refuses to provide its IP
address.  I found out there is a pppd option for this purpose, however it works
reliably only in case the local pppd uses `noremoteip'.  If you don't specify
`noremoteip' on the local end, the remote end will reveal its IP address
despite it has been disabled with `nosendip'.

This patch makes pppd never send the local IP address when `nosendip' is
specified.

Libor Pechacek

--- a/pppd/ipcp.c
+++ b/pppd/ipcp.c
@@ -1004,6 +1004,7 @@ ipcp_nakci(f, p, len, treat_as_reject)
     int treat_as_reject;
 {
     ipcp_options *go = &ipcp_gotoptions[f->unit];
+    ipcp_options *wo = &ipcp_wantoptions[f->unit];
     u_char cimaxslotindex, cicflag;
     u_char citype, cilen, *next;
     u_short cishort;
@@ -1193,7 +1194,7 @@ ipcp_nakci(f, p, len, treat_as_reject)
 	    ciaddr1 = htonl(l);
 	    if (ciaddr1 && go->accept_local)
 		try.ouraddr = ciaddr1;
-	    if (try.ouraddr != 0)
+	    if (wo->neg_addr && try.ouraddr != 0)
 		try.neg_addr = 1;
 	    no.neg_addr = 1;
 	    break;

