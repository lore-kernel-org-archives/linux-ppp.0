From: James Chapman <jchapman@katalix.com>
Date: Thu, 09 Aug 2007 07:43:28 +0000
Subject: [PATCH 1/1 ppp-2.4.4] Introduce L2TP support
Message-Id: <200708090743.l797hSeP003590@quickie.katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This patch adds support for L2TP. It makes use of a pppol2tp driver in
the Linux kernel. All data packets are handled by the Linux kernel in
order that the datapath be as efficient as possible, while a userspace
daemon implements the L2TP control protocol, handling tunnel/session
setup and teardown. The implementation uses the PPPoX infrastructure;
the architecture is similar to PPPoE/PPPoATM in that a userspace
daemon spawns a pppd process per PPP session and uses a
protocol-specific plugin to connect pppd with the kernel.

The pppol2tp Linux kernel driver is scheduled for inclusion in
2.6.23. For earlier kernels, an out of tree driver is available from
the pppol2tp-kmod package from the OpenL2TP project
http://sf.net/projects/openl2tp.

This code has been in use for some time in the OpenL2TP community.
Please consider for inclusion in the next release of ppp.

James Chapman

Index: ppp-2.4.4/README.pppol2tp
=================================--- /dev/null
+++ ppp-2.4.4/README.pppol2tp
@@ -0,0 +1,98 @@
+pppol2tp plugin
+=======+
+This document describes the support for PPP over L2TP (PPPoL2TP).
+
+The code was developed by the OpenL2TP project:
+http://openl2tp.sourceforge.net. It may be used by any L2TP
+implementation, including OpenL2TP. OpenL2TP may be downloaded from
+http://www.sourceforge.net/projects/openl2tp.
+
+From kernel 2.6.23, Linux has L2TP support available in the standard
+kernel. For earlier kernel versions, it is necessary to build and
+install the pppol2tp-kmod package from the OpenL2TP project which
+provides the kernel driver as a loadable kernel module.
+
+All data packets are handled by the Linux kernel in order that the
+datapath be as efficient as possible, while a userspace daemon
+implements L2TP control protocol, handling tunnel/session setup and
+teardown. The implementation uses the PPPoX infrastructure; the
+architecture is similar to PPPoE in that a userspace daemon spawns
+pppd processes per PPP session and uses a protocol-specific plugin to
+connect pppd with the kernel. The kernel driver takes care of all
+datapath functions of L2TP, including packet reordering (when data
+sequence numbers are enabled).
+
+Note that the pppol2tp kernel support must be installed before trying
+to start pppd with this plugin. If the kernel driver is built as a
+kernel module, make sure it is loaded. Don't confuse the kernel's
+module pppol2tp.ko with the pppd plugin pppol2tp.so.
+
+A userspace L2TP daemon creates a UDP socket for each tunnel. This
+socket is joined to the PPPoL2TP socket which is created by the
+pppol2tp pppd plugin. In this way, PPP frames tunneled through an L2TP
+tunnel are handled entirely by the kernel.
+
+Plugin arguments
+----------------
+
+The pppd plugin adds extra arguments to pppd and uses the
+Linux kernel PPP-over-L2TP driver to set up each session's data path.
+
+Arguments are:-
+
+pppol2tp <fd>                   - FD of UDP tunnel socket
+pppol2tp_lns_mode               - PPPoL2TP LNS behavior. Default off.
+pppol2tp_send_seq               - PPPoL2TP enable sequence numbers in
+                                  transmitted data packets. Default off.
+pppol2tp_recv_seq               - PPPoL2TP enforce sequence numbers in
+                                  received data packets. Default off.
+pppol2tp_reorderto <millisecs>  - PPPoL2TP data packet reorder timeout.
+                                  Default 0 (no reordering).
+pppol2tp_debug_mask <mask>      - PPPoL2TP debug mask. Bitwise OR of
+				  1 - verbose debug
+				  2 - control
+				  4 - kernel transport
+				  8 - ppp packet data
+				  Default: 0 (no debug).
+pppol2tp_ifname <ifname>	- Name of PPP network interface visible
+				  to "ifconfig" and "ip link".
+				  Default: "pppN"
+pppol2tp_tunnel_id <id>		- L2TP tunnel_id tunneling this PPP
+				  session.
+pppol2tp_session_id <id>	- L2TP session_id of this PPP session.
+				  The tunnel_id/session_id pair is used
+				  when sending event messages to openl2tpd.
+
+These options would typically be provided by the L2TP daemon.
+
+The OpenL2TP L2TP implementation provides an interface with which an
+external pppd process may send messages to openl2tpd to pass it
+information. This is specifically used to pass status information and
+snooped PPP LCP messages to openl2tpd. This interface is implemented
+in the openl2tp.so pppd plugin, separate from the pppol2tp.so pppd
+plugin to keep things modular and to allow other L2TP daemons to make
+use of the pppol2tp plugin.
+
+Help and support
+----------------
+
+For L2TP help and support, please join the openl2tp-users mailing list
+openl2tp-users@lists.sourceforge.net and post questions there. You
+must be a member of the list to post (to prevent spam). Register on
+the SourceForge site http://www.sourceforge.net/projects/openl2tp.
+
+Credits
+-------
+
+Initial versions of the pppol2tp kernel driver and pppol2tp pppd
+plugin were written by Martijn van Oosterhout
+<kleptog@svana.org>. This was developed further by the OpenL2TP
+project by Katalix Systems Ltd who provide Linux outsourcing and
+consulting services.
+
+--
+James Chapman
+Katalix Systems Ltd
+http://www.katalix.com
+Catalysts for your Embedded Linux software development
Index: ppp-2.4.4/pppd/plugins/pppol2tp/Makefile.linux
=================================--- /dev/null
+++ ppp-2.4.4/pppd/plugins/pppol2tp/Makefile.linux
@@ -0,0 +1,56 @@
+CC	= gcc
+COPTS	= -O2 -g
+CFLAGS	= $(COPTS) -I../.. -I../../../include -fPIC
+LDFLAGS	= -shared
+INSTALL	= install
+RPCGEN  = rpcgen
+RPCGENFLAGS = -N -M -C -L
+
+#***********************************************************************
+
+DESTDIR = /usr/local
+LIBDIR = $(DESTDIR)/lib/pppd/$(VERSION)
+
+VERSION = $(shell awk -F '"' '/VERSION/ { print $$2; }' ../../patchlevel.h)
+
+PLUGINS := pppol2tp.so openl2tp.so
+
+.PHONY:	genfiles
+
+all: genfiles $(PLUGINS)
+
+pppol2tp.so: pppol2tp.o
+	$(CC) $(CFLAGS) -o $@ -shared $^ $(LIBS)
+
+openl2tp.so: openl2tp.o l2tp_event_rpc_xdr.o l2tp_event_rpc_client.o
+	$(CC) $(CFLAGS) -o $@ -shared $^ $(LIBS)
+
+genfiles: l2tp_event_rpc.h
+
+%_xdr.o: %_xdr.c
+	$(CC) $(CFLAGS) -c -o $@ $<
+
+%_client.o: %_client.c
+	$(CC) $(CFLAGS) -c -o $@ $<
+
+%_xdr.c: %.x
+	-$(RM) $@
+	$(RPCGEN) $(RPCGENFLAGS) -c -o $@ $<
+
+%_client.c: %.x
+	-$(RM) $@
+	$(RPCGEN) $(RPCGENFLAGS) -l -o $@ $<
+
+%.h: %.x
+	-$(RM) $@
+	$(RPCGEN) $(RPCGENFLAGS) -h -o $@ $<
+
+install: all
+	$(INSTALL) -d -m 755 $(LIBDIR)
+	$(INSTALL) -c -m 4550 $(PLUGINS) $(LIBDIR)
+
+clean:
+	rm -f *.o *.so l2tp_event_rpc.h
+
+%.o: %.c
+	$(CC) $(CFLAGS) -c -o $@ $<
Index: ppp-2.4.4/pppd/plugins/pppol2tp/pppol2tp.c
=================================--- /dev/null
+++ ppp-2.4.4/pppd/plugins/pppol2tp/pppol2tp.c
@@ -0,0 +1,491 @@
+/* pppol2tp.c - pppd plugin to implement PPPoL2TP protocol
+ *   for Linux using kernel pppol2tp support.
+ *
+ * Requires kernel pppol2tp driver which is distributed with
+ * OpenL2TP at http://www.sourceforge.net/projects/openl2tp/
+ *
+ * By Martijn van Oosterhout <kleptog@svana.org>
+ * Modified for OpenL2TP by jchapman@katalix.com
+ *
+ * Heavily based upon pppoatm.c: original notice follows
+ *
+ * Copyright 2000 Mitchell Blank Jr.
+ * Based in part on work from Jens Axboe and Paul Mackerras.
+ * Updated to ppp-2.4.1 by Bernhard Kaindl
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU General Public License
+ *  as published by the Free Software Foundation; either version
+ *  2 of the License, or (at your option) any later version.
+ */
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <errno.h>
+#include "pppd.h"
+#include "pathnames.h"
+#include "fsm.h"
+#include "lcp.h"
+#include "ccp.h"
+#include "ipcp.h"
+#include <sys/stat.h>
+#include <net/if.h>
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <signal.h>
+#include <linux/version.h>
+#include <linux/sockios.h>
+#include <linux/types.h>
+#include <linux/if_ether.h>
+#include <linux/ppp_defs.h>
+#include <linux/if_ppp.h>
+#include <linux/if_pppox.h>
+#include <linux/if_pppol2tp.h>
+
+const char pppd_version[] = VERSION;
+
+static int setdevname_pppol2tp(char **argv);
+
+static int pppol2tp_fd = -1;
+static char *pppol2tp_fd_str;
+static bool pppol2tp_lns_mode = 0;
+static bool pppol2tp_recv_seq = 0;
+static bool pppol2tp_send_seq = 0;
+static int pppol2tp_debug_mask = 0;
+static int pppol2tp_reorder_timeout = 0;
+static char pppol2tp_ifname[32] = { 0, };
+static int pppol2tp_tunnel_id = 0;
+static int pppol2tp_session_id = 0;
+
+static int device_got_set = 0;
+struct channel pppol2tp_channel;
+
+static void (*old_snoop_recv_hook)(unsigned char *p, int len) = NULL;
+static void (*old_snoop_send_hook)(unsigned char *p, int len) = NULL;
+static void (*old_ip_up_hook)(void) = NULL;
+static void (*old_ip_down_hook)(void) = NULL;
+
+/* Hook provided to allow other plugins to handle ACCM changes */
+void (*pppol2tp_send_accm_hook)(int tunnel_id, int session_id, uint32_t send_accm, uint32_t recv_accm) = NULL;
+
+/* Hook provided to allow other plugins to handle IP up/down */
+void (*pppol2tp_ip_updown_hook)(int tunnel_id, int session_id, int up) = NULL;
+
+static option_t pppol2tp_options[] = {
+	{ "pppol2tp", o_special, &setdevname_pppol2tp,
+	  "FD for PPPoL2TP socket", OPT_DEVNAM | OPT_A2STRVAL,
+          &pppol2tp_fd_str },
+	{ "pppol2tp_lns_mode", o_bool, &pppol2tp_lns_mode,
+	  "PPPoL2TP LNS behavior. Default off.",
+	  OPT_PRIO | OPRIO_CFGFILE },
+	{ "pppol2tp_send_seq", o_bool, &pppol2tp_send_seq,
+	  "PPPoL2TP enable sequence numbers in transmitted data packets. Default off.",
+	  OPT_PRIO | OPRIO_CFGFILE },
+	{ "pppol2tp_recv_seq", o_bool, &pppol2tp_recv_seq,
+	  "PPPoL2TP enforce sequence numbers in received data packets. Default off.",
+	  OPT_PRIO | OPRIO_CFGFILE },
+	{ "pppol2tp_reorderto", o_int, &pppol2tp_reorder_timeout,
+	  "PPPoL2TP data packet reorder timeout. Default 0 (no reordering).",
+	  OPT_PRIO },
+	{ "pppol2tp_debug_mask", o_int, &pppol2tp_debug_mask,
+	  "PPPoL2TP debug mask. Default: no debug.",
+	  OPT_PRIO },
+	{ "pppol2tp_ifname", o_string, &pppol2tp_ifname,
+	  "Set interface name of PPP interface",
+	  OPT_PRIO | OPT_PRIV | OPT_STATIC, NULL, 16 },
+	{ "pppol2tp_tunnel_id", o_int, &pppol2tp_tunnel_id,
+	  "PPPoL2TP tunnel_id.",
+	  OPT_PRIO },
+	{ "pppol2tp_session_id", o_int, &pppol2tp_session_id,
+	  "PPPoL2TP session_id.",
+	  OPT_PRIO },
+	{ NULL }
+};
+
+static int setdevname_pppol2tp(char **argv)
+{
+	union {
+		char buffer[128];
+		struct sockaddr pppol2tp;
+	} s;
+	int len = sizeof(s);
+	char **a;
+	int tmp;
+	int tmp_len = sizeof(tmp);
+
+	if (device_got_set)
+		return 0;
+
+	if (!int_option(*argv, &pppol2tp_fd))
+		return 0;
+
+	if(getsockname(pppol2tp_fd, (struct sockaddr *)&s, &len) < 0) {
+		fatal("Given FD for PPPoL2TP socket invalid (%s)", strerror(errno));
+	}
+	if(s.pppol2tp.sa_family != AF_PPPOX) {
+		fatal("Socket of not a PPPoX socket");
+	}
+
+	/* Do a test getsockopt() to ensure that the kernel has the necessary
+	 * feature available.
+	 */
+	if (getsockopt(pppol2tp_fd, SOL_PPPOL2TP, PPPOL2TP_SO_DEBUG, &tmp, &tmp_len) < 0) {
+		fatal("PPPoL2TP kernel driver not installed");
+	}
+
+	/* Setup option defaults. Compression options are disabled! */
+
+	modem = 0;
+
+	lcp_allowoptions[0].neg_accompression = 1;
+	lcp_wantoptions[0].neg_accompression = 0;
+
+	lcp_allowoptions[0].neg_pcompression = 1;
+	lcp_wantoptions[0].neg_pcompression = 0;
+
+	ccp_allowoptions[0].deflate = 0;
+	ccp_wantoptions[0].deflate = 0;
+
+	ipcp_allowoptions[0].neg_vj = 0;
+	ipcp_wantoptions[0].neg_vj = 0;
+
+	ccp_allowoptions[0].bsd_compress = 0;
+	ccp_wantoptions[0].bsd_compress = 0;
+
+	the_channel = &pppol2tp_channel;
+	device_got_set = 1;
+
+	return 1;
+}
+
+static int connect_pppol2tp(void)
+{
+	if(pppol2tp_fd = -1) {
+		fatal("No PPPoL2TP FD specified");
+	}
+
+	return pppol2tp_fd;
+}
+
+static void disconnect_pppol2tp(void)
+{
+	if (pppol2tp_fd >= 0) {
+		close(pppol2tp_fd);
+		pppol2tp_fd = -1;
+	}
+}
+
+static void send_config_pppol2tp(int mtu,
+			      u_int32_t asyncmap,
+			      int pcomp,
+			      int accomp)
+{
+	struct ifreq ifr;
+	int on = 1;
+	int fd;
+	char reorderto[16];
+	char tid[8];
+	char sid[8];
+
+	if (pppol2tp_ifname[0]) {
+		struct ifreq ifr;
+		int fd;
+
+		fd = socket(AF_INET, SOCK_DGRAM, 0);
+		if (fd >= 0) {
+			memset (&ifr, '\0', sizeof (ifr));
+			strlcpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
+			strlcpy(ifr.ifr_newname, pppol2tp_ifname, sizeof(ifr.ifr_name));
+			ioctl(fd, SIOCSIFNAME, (caddr_t) &ifr);
+			strlcpy(ifname, pppol2tp_ifname, 32);
+			if (pppol2tp_debug_mask & PPPOL2TP_MSG_CONTROL) {
+				dbglog("ppp%d: interface name %s", ifunit, ifname);
+			}
+		}
+		close(fd);
+	}
+
+	if ((lcp_allowoptions[0].mru > 0) && (mtu > lcp_allowoptions[0].mru)) {
+		warn("Overriding mtu %d to %d", mtu, lcp_allowoptions[0].mru);
+		mtu = lcp_allowoptions[0].mru;
+	}
+	netif_set_mtu(ifunit, mtu);
+
+	reorderto[0] = '\0';
+	if (pppol2tp_reorder_timeout > 0)
+		sprintf(&reorderto[0], "%d ", pppol2tp_reorder_timeout);
+	tid[0] = '\0';
+	if (pppol2tp_tunnel_id > 0)
+		sprintf(&tid[0], "%hu ", pppol2tp_tunnel_id);
+	sid[0] = '\0';
+	if (pppol2tp_session_id > 0)
+		sprintf(&sid[0], "%hu ", pppol2tp_session_id);
+
+	dbglog("PPPoL2TP options: %s%s%s%s%s%s%s%s%sdebugmask %d",
+	       pppol2tp_recv_seq ? "recvseq " : "",
+	       pppol2tp_send_seq ? "sendseq " : "",
+	       pppol2tp_lns_mode ? "lnsmode " : "",
+	       pppol2tp_reorder_timeout ? "reorderto " : "", reorderto,
+	       pppol2tp_tunnel_id ? "tid " : "", tid,
+	       pppol2tp_session_id ? "sid " : "", sid,
+	       pppol2tp_debug_mask);
+
+	if (pppol2tp_recv_seq)
+		if (setsockopt(pppol2tp_fd, SOL_PPPOL2TP, PPPOL2TP_SO_RECVSEQ, &on, sizeof(on)) < 0)
+			fatal("setsockopt(PPPOL2TP_RECVSEQ): %m");
+	if (pppol2tp_send_seq)
+		if (setsockopt(pppol2tp_fd, SOL_PPPOL2TP, PPPOL2TP_SO_SENDSEQ, &on, sizeof(on)) < 0)
+			fatal("setsockopt(PPPOL2TP_SENDSEQ): %m");
+	if (pppol2tp_lns_mode)
+		if (setsockopt(pppol2tp_fd, SOL_PPPOL2TP, PPPOL2TP_SO_LNSMODE, &on, sizeof(on)) < 0)
+			fatal("setsockopt(PPPOL2TP_LNSMODE): %m");
+	if (pppol2tp_reorder_timeout)
+		if (setsockopt(pppol2tp_fd, SOL_PPPOL2TP, PPPOL2TP_SO_REORDERTO, &pppol2tp_reorder_timeout, sizeof(pppol2tp_reorder_timeout)) < 0)
+			fatal("setsockopt(PPPOL2TP_REORDERTO): %m");
+	if (pppol2tp_debug_mask)
+		if (setsockopt(pppol2tp_fd, SOL_PPPOL2TP, PPPOL2TP_SO_DEBUG, &pppol2tp_debug_mask, sizeof(pppol2tp_debug_mask)) < 0)
+			fatal("setsockopt(PPPOL2TP_DEBUG): %m");
+}
+
+static void recv_config_pppol2tp(int mru,
+			      u_int32_t asyncmap,
+			      int pcomp,
+			      int accomp)
+{
+	if ((lcp_allowoptions[0].mru > 0) && (mru > lcp_allowoptions[0].mru)) {
+		warn("Overriding mru %d to mtu value %d", mru, lcp_allowoptions[0].mru);
+		mru = lcp_allowoptions[0].mru;
+	}
+	if ((ifunit >= 0) && ioctl(pppol2tp_fd, PPPIOCSMRU, (caddr_t) &mru) < 0)
+		error("Couldn't set PPP MRU: %m");
+}
+
+/*****************************************************************************
+ * Snoop LCP message exchanges to capture negotiated ACCM values.
+ * When asyncmap values have been seen from both sides, give the values to
+ * L2TP.
+ * This code is derived from Roaring Penguin L2TP.
+ *****************************************************************************/
+
+static void pppol2tp_lcp_snoop(unsigned char *buf, int len, int incoming)
+{
+	static bool got_send_accm = 0;
+	static bool got_recv_accm = 0;
+	static uint32_t recv_accm = 0xffffffff;
+	static uint32_t send_accm = 0xffffffff;
+	static bool snooping = 1;
+
+	uint16_t protocol;
+	uint16_t lcp_pkt_len;
+	int opt, opt_len;
+	int reject;
+	unsigned char const *opt_data;
+	uint32_t accm;
+
+	/* Skip HDLC header */
+	buf += 2;
+	len -= 2;
+
+	/* Unreasonably short frame?? */
+	if (len <= 0) return;
+
+	/* Get protocol */
+	if (buf[0] & 0x01) {
+		/* Compressed protcol field */
+		protocol = buf[0];
+	} else {
+		protocol = ((unsigned int) buf[0]) * 256 + buf[1];
+	}
+
+	/* If it's a network protocol, stop snooping */
+	if (protocol <= 0x3fff) {
+		if (pppol2tp_debug_mask & PPPOL2TP_MSG_DEBUG) {
+			dbglog("Turning off snooping: Network protocol %04x found.", protocol);
+		}
+		snooping = 0;
+		return;
+	}
+
+	/* If it's not LCP, do not snoop */
+	if (protocol != 0xc021) {
+		return;
+	}
+
+	/* Skip protocol; go to packet data */
+	buf += 2;
+	len -= 2;
+
+	/* Unreasonably short frame?? */
+	if (len <= 0) return;
+
+	/* Look for Configure-Ack or Configure-Reject code */
+	if (buf[0] != CONFACK && buf[0] != CONFREJ) return;
+
+	reject = (buf[0] = CONFREJ);
+
+	lcp_pkt_len = ((unsigned int) buf[2]) * 256 + buf[3];
+
+	/* Something fishy with length field? */
+	if (lcp_pkt_len > len) return;
+
+	/* Skip to options */
+	len = lcp_pkt_len - 4;
+	buf += 4;
+
+	while (len > 0) {
+		/* Pull off an option */
+		opt = buf[0];
+		opt_len = buf[1];
+		opt_data = &buf[2];
+		if (opt_len > len || opt_len < 2) break;
+		len -= opt_len;
+		buf += opt_len;
+		if (pppol2tp_debug_mask & PPPOL2TP_MSG_DEBUG) {
+			dbglog("Found option type %02x; len %d", opt, opt_len);
+		}
+
+		/* We are specifically interested in ACCM */
+		if (opt = CI_ASYNCMAP && opt_len = 0x06) {
+			if (reject) {
+				/* ACCM negotiation REJECTED; use default */
+				accm = 0xffffffff;
+				if (pppol2tp_debug_mask & PPPOL2TP_MSG_DATA) {
+					dbglog("Rejected ACCM negotiation; defaulting (%s)", incoming ? "incoming" : "outgoing");
+				}
+				recv_accm = accm;
+				send_accm = accm;
+				got_recv_accm = 1;
+				got_send_accm = 1;
+			} else {
+				memcpy(&accm, opt_data, sizeof(accm));
+				if (pppol2tp_debug_mask & PPPOL2TP_MSG_DATA) {
+					dbglog("Found ACCM of %08x (%s)", accm, incoming ? "incoming" : "outgoing");
+				}
+				if (incoming) {
+					recv_accm = accm;
+					got_recv_accm = 1;
+				} else {
+					send_accm = accm;
+					got_send_accm = 1;
+				}
+			}
+
+			if (got_recv_accm && got_send_accm) {
+				if (pppol2tp_debug_mask & PPPOL2TP_MSG_CONTROL) {
+					dbglog("Telling L2TP: Send ACCM = %08x; Receive ACCM = %08x", send_accm, recv_accm);
+				}
+				if (pppol2tp_send_accm_hook != NULL) {
+					(*pppol2tp_send_accm_hook)(pppol2tp_tunnel_id, pppol2tp_session_id, send_accm, recv_accm);
+				}
+				got_recv_accm = 0;
+				got_send_accm = 0;
+			}
+		}
+	}
+}
+
+static void pppol2tp_lcp_snoop_recv(unsigned char *p, int len)
+{
+	if (old_snoop_recv_hook != NULL)
+		(*old_snoop_recv_hook)(p, len);
+	pppol2tp_lcp_snoop(p, len, 1);
+}
+
+static void pppol2tp_lcp_snoop_send(unsigned char *p, int len)
+{
+	if (old_snoop_send_hook != NULL)
+		(*old_snoop_send_hook)(p, len);
+	pppol2tp_lcp_snoop(p, len, 0);
+}
+
+/*****************************************************************************
+ * Interface up/down events
+ *****************************************************************************/
+
+static void pppol2tp_ip_up_hook(void)
+{
+	if (old_ip_up_hook != NULL)
+		(*old_ip_up_hook)();
+
+	if (pppol2tp_ip_updown_hook != NULL) {
+		(*pppol2tp_ip_updown_hook)(pppol2tp_tunnel_id, pppol2tp_session_id, 1);
+	}
+}
+
+static void pppol2tp_ip_down_hook(void)
+{
+	if (old_ip_down_hook != NULL)
+		(*old_ip_down_hook)();
+
+	if (pppol2tp_ip_updown_hook != NULL) {
+		(*pppol2tp_ip_updown_hook)(pppol2tp_tunnel_id, pppol2tp_session_id, 0);
+	}
+}
+
+/*****************************************************************************
+ * Application init
+ *****************************************************************************/
+
+static void pppol2tp_check_options(void)
+{
+	/* Enable LCP snooping for ACCM options only for LNS */
+	if (pppol2tp_lns_mode) {
+		if ((pppol2tp_tunnel_id = 0) || (pppol2tp_session_id = 0)) {
+			fatal("tunnel_id/session_id values not specified");
+		}
+		if (pppol2tp_debug_mask & PPPOL2TP_MSG_CONTROL) {
+			dbglog("Enabling LCP snooping");
+		}
+		old_snoop_recv_hook = snoop_recv_hook;
+		old_snoop_send_hook = snoop_send_hook;
+
+		snoop_recv_hook = pppol2tp_lcp_snoop_recv;
+		snoop_send_hook = pppol2tp_lcp_snoop_send;
+	}
+
+	/* If pppol2tp_ifname not supplied, use ip_up_hook to discover interface */
+	if (!pppol2tp_ifname[0]) {
+		old_ip_up_hook = ip_up_hook;
+		ip_up_hook = pppol2tp_ip_up_hook;
+		old_ip_down_hook = ip_down_hook;
+		ip_down_hook = pppol2tp_ip_down_hook;
+	}
+}
+
+/* Called just before pppd exits.
+ */
+static void pppol2tp_cleanup(void)
+{
+	if (pppol2tp_debug_mask & PPPOL2TP_MSG_DEBUG) {
+		dbglog("pppol2tp: exiting.");
+	}
+	disconnect_pppol2tp();
+}
+
+void plugin_init(void)
+{
+#if defined(__linux__)
+	extern int new_style_driver;	/* From sys-linux.c */
+	if (!ppp_available() && !new_style_driver)
+		fatal("Kernel doesn't support ppp_generic - "
+		    "needed for PPPoL2TP");
+#else
+	fatal("No PPPoL2TP support on this OS");
+#endif
+	add_options(pppol2tp_options);
+}
+
+struct channel pppol2tp_channel = {
+    options: pppol2tp_options,
+    process_extra_options: NULL,
+    check_options: &pppol2tp_check_options,
+    connect: &connect_pppol2tp,
+    disconnect: &disconnect_pppol2tp,
+    establish_ppp: &generic_establish_ppp,
+    disestablish_ppp: &generic_disestablish_ppp,
+    send_config: &send_config_pppol2tp,
+    recv_config: &recv_config_pppol2tp,
+    close: NULL,
+    cleanup: NULL
+};
Index: ppp-2.4.4/configure
=================================--- ppp-2.4.4.orig/configure
+++ ppp-2.4.4/configure
@@ -194,7 +194,7 @@ if [ -d "$ksrc" ]; then
     mkmkf $ksrc/Makefile.top Makefile
     mkmkf $ksrc/Makedefs$compiletype Makedefs.com
     for dir in pppd pppstats chat pppdump pppd/plugins pppd/plugins/rp-pppoe \
-	       pppd/plugins/radius pppd/plugins/pppoatm; do
+	       pppd/plugins/radius pppd/plugins/pppoatm pppd/plugins/pppol2tp; do
 	mkmkf $dir/Makefile.$makext $dir/Makefile
     done
     if [ -f $ksrc/Makefile.$makext$archvariant ]; then
Index: ppp-2.4.4/include/linux/if_ppp.h
=================================--- ppp-2.4.4.orig/include/linux/if_ppp.h
+++ ppp-2.4.4/include/linux/if_ppp.h
@@ -130,6 +130,21 @@ struct ifpppcstatsreq {
 	struct ppp_comp_stats stats;
 };
 
+/* For PPPIOCGL2TPSTATS */
+struct pppol2tp_ioc_stats {
+	__u16	tunnel_id;	/* redundant */
+	__u16	session_id;	/* if zero, get tunnel stats */
+	__u32	using_ipsec:1;	/* valid only for session_id = 0 */
+	__u64	tx_packets;
+	__u64	tx_bytes;
+	__u64	tx_errors;
+	__u64	rx_packets;
+	__u64	rx_bytes;
+	__u64	rx_seq_discards;
+	__u64	rx_oos_packets;
+	__u64	rx_errors;
+};
+
 #define ifr__name       b.ifr_ifrn.ifrn_name
 #define stats_ptr       b.ifr_ifru.ifru_data
 
@@ -166,6 +181,7 @@ struct ifpppcstatsreq {
 #define PPPIOCDISCONN	_IO('t', 57)		/* disconnect channel */
 #define PPPIOCATTCHAN	_IOW('t', 56, int)	/* attach to ppp channel */
 #define PPPIOCGCHAN	_IOR('t', 55, int)	/* get ppp channel number */
+#define PPPIOCGL2TPSTATS _IOR('t', 54, struct pppol2tp_ioc_stats)
 
 #define SIOCGPPPSTATS   (SIOCDEVPRIVATE + 0)
 #define SIOCGPPPVER     (SIOCDEVPRIVATE + 1)	/* NEVER change this!! */
Index: ppp-2.4.4/include/linux/if_pppol2tp.h
=================================--- /dev/null
+++ ppp-2.4.4/include/linux/if_pppol2tp.h
@@ -0,0 +1,69 @@
+/***************************************************************************
+ * Linux PPP over L2TP (PPPoL2TP) Socket Implementation (RFC 2661)
+ *
+ * This file supplies definitions required by the PPP over L2TP driver
+ * (pppol2tp.c).  All version information wrt this file is located in pppol2tp.c
+ *
+ * License:
+ *		This program is free software; you can redistribute it and/or
+ *		modify it under the terms of the GNU General Public License
+ *		as published by the Free Software Foundation; either version
+ *		2 of the License, or (at your option) any later version.
+ *
+ */
+
+#ifndef __LINUX_IF_PPPOL2TP_H
+#define __LINUX_IF_PPPOL2TP_H
+
+#include <asm/types.h>
+
+#ifdef __KERNEL__
+#include <linux/in.h>
+#endif
+
+/* Structure used to bind() the socket to a particular socket & tunnel */
+struct pppol2tp_addr
+{
+	pid_t	pid;			/* pid that owns the fd.
+					 * 0 => current */
+	int	fd;			/* FD of UDP socket to use */
+
+	struct sockaddr_in addr;	/* IP address and port to send to */
+
+	__u16 s_tunnel, s_session;	/* For matching incoming packets */
+	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+};
+
+/* Socket options:
+ * DEBUG	- bitmask of debug message categories
+ * SENDSEQ	- 0 => don't send packets with sequence numbers
+ *		  1 => send packets with sequence numbers
+ * RECVSEQ	- 0 => receive packet sequence numbers are optional
+ *		  1 => drop receive packets without sequence numbers
+ * LNSMODE	- 0 => act as LAC.
+ *		  1 => act as LNS.
+ * REORDERTO	- reorder timeout (in millisecs). If 0, don't try to reorder.
+ */
+enum {
+	PPPOL2TP_SO_DEBUG	= 1,
+	PPPOL2TP_SO_RECVSEQ	= 2,
+	PPPOL2TP_SO_SENDSEQ	= 3,
+	PPPOL2TP_SO_LNSMODE	= 4,
+	PPPOL2TP_SO_REORDERTO	= 5,
+};
+
+/* Debug message categories for the DEBUG socket option */
+enum {
+	PPPOL2TP_MSG_DEBUG	= (1 << 0),	/* verbose debug (if
+						 * compiled in) */
+	PPPOL2TP_MSG_CONTROL	= (1 << 1),	/* userspace - kernel
+						 * interface */
+	PPPOL2TP_MSG_SEQ	= (1 << 2),	/* sequence numbers */
+	PPPOL2TP_MSG_DATA	= (1 << 3),	/* data packets */
+};
+
+#ifndef SOL_PPPOL2TP
+#define SOL_PPPOL2TP	273
+#endif
+
+#endif
Index: ppp-2.4.4/include/linux/if_pppox.h
=================================--- ppp-2.4.4.orig/include/linux/if_pppox.h
+++ ppp-2.4.4/include/linux/if_pppox.h
@@ -28,6 +28,7 @@
 #include <asm/semaphore.h>
 #include <linux/ppp_channel.h>
 #endif /* __KERNEL__ */
+#include <linux/if_pppol2tp.h>
 
 /* For user-space programs to pick up these definitions
  * which they wouldn't get otherwise without defining __KERNEL__
@@ -51,16 +52,27 @@ struct pppoe_addr{ 
  * Protocols supported by AF_PPPOX 
  */ 
 #define PX_PROTO_OE    0 /* Currently just PPPoE */
-#define PX_MAX_PROTO   1	
- 
-struct sockaddr_pppox { 
-       sa_family_t     sa_family;            /* address family, AF_PPPOX */ 
-       unsigned int    sa_protocol;          /* protocol identifier */ 
-       union{ 
-               struct pppoe_addr       pppoe; 
-       }sa_addr; 
-}__attribute__ ((packed)); 
+#define PX_PROTO_OL2TP 1 /* Now L2TP also */
+#define PX_MAX_PROTO   2
 
+struct sockaddr_pppox {
+       sa_family_t     sa_family;            /* address family, AF_PPPOX */
+       unsigned int    sa_protocol;          /* protocol identifier */
+       union{
+               struct pppoe_addr       pppoe;
+       }sa_addr;
+}__attribute__ ((packed));
+
+/* The use of the above union isn't viable because the size of this
+ * struct must stay fixed over time -- applications use sizeof(struct
+ * sockaddr_pppox) to fill it. We use a protocol specific sockaddr
+ * type instead.
+ */
+struct sockaddr_pppol2tp {
+	sa_family_t     sa_family;      /* address family, AF_PPPOX */
+	unsigned int    sa_protocol;    /* protocol identifier */
+	struct pppol2tp_addr pppol2tp;
+}__attribute__ ((packed));
 
 /*********************************************************************
  *
Index: ppp-2.4.4/pppd/plugins/Makefile.linux
=================================--- ppp-2.4.4.orig/pppd/plugins/Makefile.linux
+++ ppp-2.4.4/pppd/plugins/Makefile.linux
@@ -10,6 +10,8 @@ MANDIR = $(DESTDIR)/share/man/man8
 LIBDIR = $(DESTDIR)/lib/pppd/$(VERSION)
 
 SUBDIRS := rp-pppoe pppoatm
+# Uncomment the next line to include the pppol2tp plugin
+SUBDIRS += pppol2tp
 # Uncomment the next line to include the radius authentication plugin
 SUBDIRS += radius
 PLUGINS := minconn.so passprompt.so passwordfd.so winbind.so
Index: ppp-2.4.4/pppd/plugins/pppol2tp/l2tp_event_rpc.x
=================================--- /dev/null
+++ ppp-2.4.4/pppd/plugins/pppol2tp/l2tp_event_rpc.x
@@ -0,0 +1,55 @@
+/* -*- c -*- */
+
+/*****************************************************************************
+ * Copyright (C) 2004,2005,2006,2007 Katalix Systems Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ * NOTE: APPLICATIONS USING THIS INTERFACE OR DERIVED FILES THEREOF MUST
+ *       EITHER BE LICENSED UNDER GPL OR UNDER AN L2TP COMMERCIAL LICENSE.
+ *	 FROM KATALIX SYSTEMS LIMITED.
+ *
+ *****************************************************************************/
+
+/*
+ * L2TP application event interface definition.
+ * Applications tell openl2tp of events using this interface. The interface
+ * is separated from the main configuration interface because event-generating
+ * clients don't need the configuration interface.
+ *
+ * Events are used as follows:-
+ * PPP_UPDOWN_IND	- tells OpenL2TP of PPP session state changes.
+ * PPP_STATUS_IND	- tells of reason of failure for async requests
+ * PPP_ACCM_IND		- tells OpenL2TP of PPP ACCM negotiated options
+ */
+
+/*****************************************************************************
+ * API definition
+ *****************************************************************************/
+
+struct l2tp_ppp_updown_msg_data {
+	int		unit;
+	string		ifname<>;
+	string		user_name<>;
+	bool		up;
+};
+
+program L2TP_EVENT_PROG {
+	version L2TP_EVENT_VERSION {
+		void L2TP_SESSION_PPP_UPDOWN_IND(uint16_t tunnel_id, uint16_t session_id, struct l2tp_ppp_updown_msg_data msg) = 1;
+		void L2TP_SESSION_PPP_STATUS_IND(uint16_t tunnel_id, uint16_t session_id, int result) = 2;
+		void L2TP_SESSION_PPP_ACCM_IND(uint16_t tunnel_id, uint16_t session_id, uint32_t send_accm, uint32_t recv_accm) = 3;
+	} = 1;			/* version 1 */
+} = 300774;			/* official number registered at rpc@sun.com */
Index: ppp-2.4.4/pppd/plugins/pppol2tp/openl2tp.c
=================================--- /dev/null
+++ ppp-2.4.4/pppd/plugins/pppol2tp/openl2tp.c
@@ -0,0 +1,179 @@
+/*****************************************************************************
+ * Copyright (C) 2006,2007 Katalix Systems Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ *****************************************************************************/
+
+/* pppd plugin for interfacing to openl2tpd */
+
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <errno.h>
+#include "pppd.h"
+#include "pathnames.h"
+#include "fsm.h"
+#include "lcp.h"
+#include "ccp.h"
+#include "ipcp.h"
+#include <sys/stat.h>
+#include <net/if.h>
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <signal.h>
+#include <linux/version.h>
+#include <linux/sockios.h>
+#include <linux/types.h>
+#include <linux/if_ether.h>
+#include <linux/ppp_defs.h>
+#include <linux/if_ppp.h>
+#include <linux/if_pppox.h>
+#include <linux/if_pppol2tp.h>
+
+#include "l2tp_event_rpc.h"
+
+extern void (*pppol2tp_send_accm_hook)(int tunnel_id, int session_id, uint32_t send_accm, uint32_t recv_accm);
+extern void (*pppol2tp_ip_updown_hook)(int tunnel_id, int session_id, int up);
+
+const char pppd_version[] = VERSION;
+
+static CLIENT *openl2tp_client = NULL;
+
+static void (*old_pppol2tp_send_accm_hook)(int tunnel_id, int session_id, uint32_t send_accm, uint32_t recv_accm) = NULL;
+static void (*old_pppol2tp_ip_updown_hook)(int tunnel_id, int session_id, int up) = NULL;
+
+/*****************************************************************************
+ * OpenL2TP RPC interface.
+ * We send a PPP_ACCM_IND to openl2tpd to report ACCM values.
+ * Async RPC is used so that we don't stall waiting for openl2tpd to send a
+ * reply. Since we're running on the same host as openl2tpd, UDP is reliable,
+ * hence there's no need to worry about whether our message arrives.
+ *****************************************************************************/
+
+static int openl2tp_rpc_client_create(void)
+{
+	if (openl2tp_client = NULL) {
+		openl2tp_client = clnt_create("localhost", L2TP_EVENT_PROG, L2TP_EVENT_VERSION, "udp");
+		if (openl2tp_client = NULL) {
+			char *err_msg = clnt_spcreateerror("openl2tp connection");
+			err_msg[strlen(err_msg) - 1] = '\0';
+			error(err_msg);
+			return -ENOTCONN;
+		}
+	}
+
+	return 0;
+}
+
+static void openl2tp_rpc_client_delete(void)
+{
+	if (openl2tp_client != NULL) {
+		clnt_destroy(openl2tp_client);
+		openl2tp_client = NULL;
+	}
+}
+
+
+static void openl2tp_send_accm_ind(int tunnel_id, int session_id, uint32_t send_accm, uint32_t recv_accm)
+{
+	int result;
+	struct timeval timeout = { 0, 0 };
+	struct l2tp_session_ppp_accm_ind_1_argument args;
+
+	if (openl2tp_client = NULL) {
+		result = openl2tp_rpc_client_create();
+		if (result < 0) {
+			goto out;
+		}
+	}
+
+	memset(&args, 0, sizeof(args));
+	args.tunnel_id = tunnel_id;
+	args.session_id = session_id;
+	args.send_accm = ntohl(send_accm);
+	args.recv_accm = ntohl(recv_accm);
+	result = clnt_call(openl2tp_client, L2TP_SESSION_PPP_ACCM_IND,
+			   (xdrproc_t) xdr_l2tp_session_ppp_accm_ind_1_argument,
+			   (char *) &args, NULL, NULL, timeout);
+	if ((result != RPC_SUCCESS) && (result != RPC_TIMEDOUT)) {
+		char *err_msg = clnt_sperror(openl2tp_client, "ppp_accm_ind");
+		err_msg[strlen(err_msg) - 1] = '\0';
+		fatal(err_msg);
+	}
+out:
+	if (old_pppol2tp_send_accm_hook != NULL) {
+		(*old_pppol2tp_send_accm_hook)(tunnel_id, session_id, send_accm, recv_accm);
+	}
+	return;
+}
+
+static void openl2tp_ppp_updown_ind(int tunnel_id, int session_id, int up)
+{
+	int result;
+	struct timeval timeout = { 0, 0 };
+	struct l2tp_session_ppp_updown_ind_1_argument args;
+
+	if (openl2tp_client = NULL) {
+		result = openl2tp_rpc_client_create();
+		if (result < 0) {
+			goto out;
+		}
+	}
+
+	memset(&args, 0, sizeof(args));
+	args.tunnel_id = tunnel_id;
+	args.session_id = session_id;
+	args.msg.up = up;
+	args.msg.unit = ifunit;
+	args.msg.ifname = strdup(ifname);
+	if (peer_authname[0] != '\0') {
+		args.msg.user_name = strdup(peer_authname);
+	} else {
+		args.msg.user_name = strdup("");
+	}
+	result = RPC_FAILED;
+	if ((args.msg.ifname != NULL) && (args.msg.user_name != NULL)) {
+		result = clnt_call(openl2tp_client, L2TP_SESSION_PPP_UPDOWN_IND,
+				   (xdrproc_t) xdr_l2tp_session_ppp_updown_ind_1_argument,
+				   (char *) &args, NULL, NULL, timeout);
+	}
+	if ((result != RPC_SUCCESS) && (result != RPC_TIMEDOUT)) {
+		char *err_msg = clnt_sperror(openl2tp_client, "ppp_updown_ind");
+		err_msg[strlen(err_msg) - 1] = '\0';
+		fatal(err_msg);
+		/* NOTREACHED */
+	}
+out:
+	if (old_pppol2tp_ip_updown_hook != NULL) {
+		(*old_pppol2tp_ip_updown_hook)(tunnel_id, session_id, up);
+	}
+
+	return;
+}
+
+/*****************************************************************************
+ * Application init
+ *****************************************************************************/
+
+void plugin_init(void)
+{
+	old_pppol2tp_send_accm_hook = pppol2tp_send_accm_hook;
+	pppol2tp_send_accm_hook = openl2tp_send_accm_ind;
+
+	old_pppol2tp_ip_updown_hook = pppol2tp_ip_updown_hook;
+	pppol2tp_ip_updown_hook = openl2tp_ppp_updown_ind;
+}
Index: ppp-2.4.4/pppd/plugins/rp-pppoe/Makefile.linux
=================================--- ppp-2.4.4.orig/pppd/plugins/rp-pppoe/Makefile.linux
+++ ppp-2.4.4/pppd/plugins/rp-pppoe/Makefile.linux
@@ -25,7 +25,7 @@ INSTALL	= install
 VERSION=3.3
 
 COPTS=-O2 -g
-CFLAGS=$(COPTS) -I../../../include/linux
+CFLAGS=$(COPTS) -I../../../include/linux -I../../../include
 all: rp-pppoe.so pppoe-discovery
 
 pppoe-discovery: libplugin.a pppoe-discovery.o
