From: Arvin Schnell <arvin@suse.de>
Date: Wed, 18 Feb 2004 15:50:50 +0000
Subject: Re: fixed usage of libpcap
Message-Id: <20040218155050.GA31053@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
List-Id: <linux-ppp.vger.kernel.org>
References: <20040218153017.GA9644@suse.de>
In-Reply-To: <20040218153017.GA9644@suse.de>
To: linux-ppp@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2004 at 04:30:17PM +0100, Arvin Schnell wrote:
> 
> Hi,
> 
> while updating to libpcap 0.8.1 I realized that pppd uses it's
> own version of pcap-int.h that does not match the original
> version anymore.
> 
> Attached is a patch against ppp 2.4.2 to solve that problem.  The
> rename from net/bpf.h to pcap-bpf.h happend somewhere between
> libpcap 0.7.2 and 0.8.1.

Better also check the return value of pcap_open_dead.

ciao Arvin

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ppp-2.4.2-libpcap.diff"

--- pppd/demand.c
+++ pppd/demand.c
@@ -38,7 +38,7 @@
 #include <arpa/inet.h>
 #ifdef PPP_FILTER
 #include <net/if.h>
-#include <net/bpf.h>
+#include <pcap-bpf.h>
 #include <pcap.h>
 #endif
 
--- pppd/sys-linux.c
+++ pppd/sys-linux.c
@@ -85,7 +85,7 @@
 #endif /* IPX_CHANGE */
 
 #ifdef PPP_FILTER
-#include <net/bpf.h>
+#include <pcap-bpf.h>
 #include <linux/filter.h>
 #endif /* PPP_FILTER */
 
--- ./pppd/options.c.orig	2004-02-18 15:42:37.366603970 +0000
+++ ./pppd/options.c	2004-02-18 15:44:01.243247770 +0000
@@ -56,7 +56,6 @@
 #endif
 #ifdef PPP_FILTER
 #include <pcap.h>
-#include <pcap-int.h>	/* XXX: To get struct pcap */
 #endif
 
 #include "pppd.h"
@@ -122,7 +121,6 @@
 #ifdef PPP_FILTER
 struct	bpf_program pass_filter;/* Filter program for packets to pass */
 struct	bpf_program active_filter; /* Filter program for link-active pkts */
-pcap_t  pc;			/* Fake struct pcap so we can compile expr */
 #endif
 
 char *current_option;		/* the name of the option being parsed */
@@ -1439,12 +1437,20 @@
 setpassfilter(argv)
     char **argv;
 {
-    pc.linktype = DLT_PPP;
-    pc.snapshot = PPP_HDRLEN;
+    pcap_t* pc = pcap_open_dead (DLT_PPP, PPP_HDRLEN);
  
-    if (pcap_compile(&pc, &pass_filter, *argv, 1, netmask) == 0)
+    if (!pc) {
+	option_error("error in pass-filter expression: pcap_open_dead failed\n");
+	return 0;
+    }
+
+    if (pcap_compile(pc, &pass_filter, *argv, 1, netmask) == 0) {
+	pcap_close (pc);
 	return 1;
-    option_error("error in pass-filter expression: %s\n", pcap_geterr(&pc));
+    }
+
+    option_error("error in pass-filter expression: %s\n", pcap_geterr(pc));
+    pcap_close (pc);
     return 0;
 }
 
@@ -1455,12 +1461,20 @@
 setactivefilter(argv)
     char **argv;
 {
-    pc.linktype = DLT_PPP;
-    pc.snapshot = PPP_HDRLEN;
+    pcap_t* pc = pcap_open_dead (DLT_PPP, PPP_HDRLEN);
  
-    if (pcap_compile(&pc, &active_filter, *argv, 1, netmask) == 0)
+    if (!pc) {
+	option_error("error in active-filter expression: pcap_open_dead failed\n");
+	return 0;
+    }
+
+    if (pcap_compile(pc, &active_filter, *argv, 1, netmask) == 0) {
+	pcap_close (pc);
 	return 1;
-    option_error("error in active-filter expression: %s\n", pcap_geterr(&pc));
+    }
+
+    option_error("error in active-filter expression: %s\n", pcap_geterr(pc));
+    pcap_close (pc);
     return 0;
 }
 #endif

--+QahgC5+KEYLbs62--
