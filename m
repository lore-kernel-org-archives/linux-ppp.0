From: Arvin Schnell <arvin@suse.de>
Date: Wed, 18 Feb 2004 15:30:17 +0000
Subject: fixed usage of libpcap
Message-Id: <20040218153017.GA9644@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

while updating to libpcap 0.8.1 I realized that pppd uses it's
own version of pcap-int.h that does not match the original
version anymore.

Attached is a patch against ppp 2.4.2 to solve that problem.  The
rename from net/bpf.h to pcap-bpf.h happend somewhere between
libpcap 0.7.2 and 0.8.1.

But I still have the problem that libpcap reports an error when
using inbound or outbound:

error in active-filter expression: inbound/outbound not supported
on linktype 9

Seems as if that's not supported anymore and was so far silently
ignored.  Does anyone know more about that?

ciao Arvin

-- 
Dipl.-Phys. Arvin Schnell
SuSE Linux AG
Research & Development
email: arvin@suse.de

--AhhlLboLdkugWU4S
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
 
--- ./pppd/options.c.orig	2004-01-13 04:02:07.000000000 +0000
+++ ./pppd/options.c	2004-02-18 14:54:44.032555730 +0000
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
@@ -1439,12 +1437,15 @@
 setpassfilter(argv)
     char **argv;
 {
-    pc.linktype = DLT_PPP;
-    pc.snapshot = PPP_HDRLEN;
+    pcap_t* pc = pcap_open_dead (DLT_PPP, PPP_HDRLEN);
  
-    if (pcap_compile(&pc, &pass_filter, *argv, 1, netmask) == 0)
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
 
@@ -1455,12 +1456,15 @@
 setactivefilter(argv)
     char **argv;
 {
-    pc.linktype = DLT_PPP;
-    pc.snapshot = PPP_HDRLEN;
+    pcap_t* pc = pcap_open_dead (DLT_PPP, PPP_HDRLEN);
  
-    if (pcap_compile(&pc, &active_filter, *argv, 1, netmask) == 0)
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

--AhhlLboLdkugWU4S--
