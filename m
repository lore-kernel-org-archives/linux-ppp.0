From: Bernard Blackham <bernard@blackham.com.au>
Date: Sat, 06 Mar 2004 17:11:57 +0000
Subject: [PATCH] mppe & PMTUD bug. (was Re: ppp-2.4.2 released)
Message-Id: <20040306171157.GU18440@amidala.blackham.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2004 at 11:09:58AM +0200, Pasi K?rkk?inen wrote:
> > Just a metoo message - I've been experiencing the exact same
> > problems here. We have a poptop server serving over 100 concurrent
> > connections and many users have noted that they weren't able to
> > access the campus website.
> > 
> > The campus website is behind a Cisco load balancer, so this may be a
> > suspect in breaking PMTU. Disabling the above lines of code also
> > solved the problem here though and we've had few complaints since.
> > 
> 
> Good to hear. 
> 
> Even if this is not a pppd bug, I think we should create some kind of
> workaround (option?) for this?

Patch is attached. With this patch, and specifying nomppe-lower-mtu
in pptpd-options, all is happiness and light here :)

> Other ppp-servers don't seem to have this same problem.. so it makes you
> feel that pppd is broken :)

Indeed. :(

Paul - could this be included in pppd as a workaround?

Cheers,

Bernard.

-- 
 Bernard Blackham <bernard at blackham dot com dot au>

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mppe_lower_mtu.diff"

Index: ppp/pppd/ccp.c
===================================================================
RCS file: /cvsroot/ppp/pppd/ccp.c,v
retrieving revision 1.46
diff -u -r1.46 ccp.c
--- ppp/pppd/ccp.c	1 May 2003 12:30:28 -0000	1.46
+++ ppp/pppd/ccp.c	6 Mar 2004 16:37:01 -0000
@@ -72,6 +72,7 @@
  */
 #ifdef MPPE
 bool refuse_mppe_stateful = 1;		/* Allow stateful mode? */
+bool mppe_lower_mtu = 1; /* Set to 0 to disable dropping the MTU by 4 */
 #endif
 
 static option_t ccp_option_list[] = {
@@ -161,6 +162,15 @@
       "allow MPPE stateful mode", OPT_PRIO },
     { "nomppe-stateful", o_bool, &refuse_mppe_stateful,
       "disallow MPPE stateful mode", OPT_PRIO | 1 },
+    
+    /* Option to avoid lowering our MTU by 4 (as should be done) to avoid
+     * breakage with devices that don't handle PMTUD
+     */
+    { "mppe-lower-mtu", o_bool, &mppe_lower_mtu,
+      "lower the MTU by 4 bytes for MPPE connections", OPT_PRIO | 1 },
+    { "nomppe-lower-mtu", o_bool, &mppe_lower_mtu,
+      "don't lower the MTU by 4 bytes for MPPE connections", OPT_PRIO },
+
 #endif /* MPPE */
 
     { NULL }
@@ -1190,9 +1200,16 @@
 		     * allocate MPPE_PAD extra bytes in xmit buffers.
 		     */
 		    mtu = netif_get_mtu(f->unit);
-		    if (mtu)
-			netif_set_mtu(f->unit, mtu - MPPE_PAD);
-		    else
+		    if (mtu) {
+			/* Dropping the MTU seems to break Path MTU discovery
+			 * particularly where load-balancers are involved.
+			 * Not dropping the MTU may mean the occasional packet
+			 * goes unencrypted due to them being 4 bytes larger
+			 * and CCP thinking it's not worth encrypting.
+			 */
+			if (mppe_lower_mtu)
+			    netif_set_mtu(f->unit, mtu - MPPE_PAD);
+		    } else
 			newret = CONFREJ;
 		}
 
Index: ppp/pppd/pppd.8
===================================================================
RCS file: /cvsroot/ppp/pppd/pppd.8,v
retrieving revision 1.76
diff -u -r1.76 pppd.8
--- ppp/pppd/pppd.8	15 Jan 2004 05:09:00 -0000	1.76
+++ ppp/pppd/pppd.8	6 Mar 2004 16:37:01 -0000
@@ -614,6 +614,10 @@
 Enables the use of PPP multilink; this is an alias for the `multilink'
 option.  This option is currently only available under Linux.
 .TP
+.B mppe-lower-mtu
+Lowers the MTU by 4 bytes for MPPE connections. This is the correct
+behaviour but breaks accessing some sites. This is the default.
+.TP
 .B mppe-stateful
 Allow MPPE to use stateful mode.  Stateless mode is still attempted first.
 The default is to disallow stateful mode.  
@@ -757,6 +761,11 @@
 .TP
 .B nomppe-128
 Disable 128\-bit encryption with MPPE.
+.TP
+.B nomppe-lower-mtu
+Disables lowering the MTU by 4 bytes for MPPE connections. This is sometimes
+required to access servers behind load balancing devices that break Path
+MTU Discovery.
 .TP
 .B nomppe-stateful
 Disable MPPE stateful mode.  This is the default.

--OXfL5xGRrasGEqWY--
