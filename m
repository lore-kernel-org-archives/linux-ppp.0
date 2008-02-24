From: James Teh <james.teh@netboxblue.com>
Date: Sun, 24 Feb 2008 05:13:14 +0000
Subject: Re: Problems with proxy arp with multiple addresses on the same interface
Message-Id: <47C0FCEA.7040503@netboxblue.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000405050901020504040008"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------000405050901020504040008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I didn't receive any response to this query, so am attaching the patch 
to this message regardless in the hope that it might be useful to someone.

This patch is largely based on the pppd BSD code by Jun-ichiro itojun 
Hagino <itojun@iijlab.net>.

Jamie

James Teh wrote:
> Hi all,
> 
> The Linux specific get_ether_addr() function in pppd uses ioctl to get 
> the netmask for an interface by interface name. Unfortunately, using the 
> ip command, multiple addresses don't receive separate interface labels, 
> which means that get_ether_addr() can only ever obtain the netmask for 
> the first address on each in terface. This causes proxy arp to fail in 
> certain cases when there are multiple addresses on the interface in 
> question; specifically, when the subnet mask of the first address on the 
> interface is smaller than the netmask of the desired address.
> 
> This can be worked around by using ip with the "label" parameter to 
> label each interface separately, but this is undesirable, as it means 
> unique labels need to be generated.
> 
> I have created a patch (largely borrowed from BSD) which uses 
> getifaddrs() instead of get_ether_addr() to get the netmask. This way, 
> the netmask for the specific address of the interface can be obtained.
> 
> Is this the appropriate place to submit this patch? I looked through the 
> documentation, but found no mention of where patches should be submitted.
> 
> -- 
> James Teh
> Developer
> NetBox Blue
> 

Scanned by the NetBox from NetBox Blue
(http://netboxblue.com/)


--------------000405050901020504040008
Content-Type: text/plain;
 name="ppp-2.4.3-getifaddrs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppp-2.4.3-getifaddrs.patch"

diff -Nur ppp-2.4.3.orig/pppd/sys-linux.c ppp-2.4.3/pppd/sys-linux.c
--- ppp-2.4.3.orig/pppd/sys-linux.c	2004-11-12 20:24:43.000000000 +1000
+++ ppp-2.4.3/pppd/sys-linux.c	2007-11-22 09:54:56.000000000 +1000
@@ -117,6 +117,7 @@
 #endif
 #include <netinet/in.h>
 #include <arpa/inet.h>
+#include <ifaddrs.h>
 
 #include <linux/ppp_defs.h>
 #include <linux/if_ppp.h>
@@ -1742,87 +1743,80 @@
 			   struct sockaddr *hwaddr,
 			   char *name, int namelen)
 {
-    struct ifreq *ifr, *ifend;
     u_int32_t ina, mask;
-    char *aliasp;
-    struct ifreq ifreq, bestifreq;
-    struct ifconf ifc;
-    struct ifreq ifs[MAX_IFS];
-
+    struct ifaddrs *ifap, *ifa;
+    struct ifaddrs *bestifa = NULL;
     u_int32_t bestmask=0;
-    int found_interface = 0;
+    char *aliasp;
 
-    ifc.ifc_len = sizeof(ifs);
-    ifc.ifc_req = ifs;
-    if (ioctl(sock_fd, SIOCGIFCONF, &ifc) < 0) {
-	if ( ! ok_error ( errno ))
-	    error("ioctl(SIOCGIFCONF): %m (line %d)", __LINE__);
+    /*
+     * Scan through looking for an interface with an Internet
+     * address on the same subnet as `ipaddr'.
+     */
+    if (getifaddrs(&ifap) != 0) {
+	error("getifaddrs: %m");
 	return 0;
     }
 
-/*
- * Scan through looking for an interface with an Internet
- * address on the same subnet as `ipaddr'.
- */
-    ifend = ifs + (ifc.ifc_len / sizeof(struct ifreq));
-    for (ifr = ifc.ifc_req; ifr < ifend; ifr++) {
-	if (ifr->ifr_addr.sa_family == AF_INET) {
-	    ina = SIN_ADDR(ifr->ifr_addr);
-	    strlcpy(ifreq.ifr_name, ifr->ifr_name, sizeof(ifreq.ifr_name));
-/*
- * Check that the interface is up, and not point-to-point
- * nor loopback.
- */
-	    if (ioctl(sock_fd, SIOCGIFFLAGS, &ifreq) < 0)
-		continue;
-
-	    if (((ifreq.ifr_flags ^ FLAGS_GOOD) & FLAGS_MASK) != 0)
-		continue;
-/*
- * Get its netmask and check that it's on the right subnet.
- */
-	    if (ioctl(sock_fd, SIOCGIFNETMASK, &ifreq) < 0)
-		continue;
-
-	    mask = SIN_ADDR(ifreq.ifr_addr);
-
-	    if (((ipaddr ^ ina) & mask) != 0)
-		continue; /* no match */
-	    /* matched */
-	    if (mask >= bestmask) {
-		/* Compare using >= instead of > -- it is possible for
-		   an interface to have a netmask of 0.0.0.0 */
-		found_interface = 1;
-		bestifreq = ifreq;
-		bestmask = mask;
-	    }
+    for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
+	if (!ifa->ifa_addr || ifa->ifa_addr->sa_family != AF_INET)
+	    continue;
+	ina = ((struct sockaddr_in *) ifa->ifa_addr)->sin_addr.s_addr;
+	/*
+	 * Check that the interface is up, and not point-to-point
+	 * or loopback.
+	 */
+	if ((ifa->ifa_flags &
+	     (IFF_UP|IFF_BROADCAST|IFF_POINTOPOINT|IFF_LOOPBACK|IFF_NOARP))
+	     != (IFF_UP|IFF_BROADCAST))
+	    continue;
+	/*
+	 * Get its netmask and check that it's on the right subnet.
+	 */
+	mask = ((struct sockaddr_in *) ifa->ifa_netmask)->sin_addr.s_addr;
+	if ((ipaddr & mask) != (ina & mask))
+	    continue;
+	if (mask >= bestmask) {
+	    /* Compare using >= instead of > -- it is possible for
+	       an interface to have a netmask of 0.0.0.0 */
+	    bestifa = ifa;
+	    bestmask = mask;
 	}
+	
     }
 
-    if (!found_interface) return 0;
-
-    strlcpy(name, bestifreq.ifr_name, namelen);
-
+    if (!bestifa) {
+	freeifaddrs(ifap);
+	return 0;
+    }
+    
+    strlcpy(name, bestifa->ifa_name, namelen);
     /* trim off the :1 in eth0:1 */
     aliasp = strchr(name, ':');
     if (aliasp != 0)
 	*aliasp = 0;
 
     info("found interface %s for proxy arp", name);
-/*
- * Now get the hardware address.
- */
-    memset (&bestifreq.ifr_hwaddr, 0, sizeof (struct sockaddr));
-    if (ioctl (sock_fd, SIOCGIFHWADDR, &bestifreq) < 0) {
-	error("SIOCGIFHWADDR(%s): %m", bestifreq.ifr_name);
-	return 0;
-    }
 
-    memcpy (hwaddr,
-	    &bestifreq.ifr_hwaddr,
-	    sizeof (struct sockaddr));
+    /*
+     * Now scan through again looking for a link-level address
+     * for this interface.
+     */
+    for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
+	if (strcmp(bestifa->ifa_name, ifa->ifa_name) != 0)
+	    continue;
+	if (ifa->ifa_addr->sa_family != AF_PACKET)
+	    continue;
+	/*
+	 * Found the link-level address - copy it out
+	 */
+	memcpy(hwaddr, ifa->ifa_addr, sizeof(struct sockaddr));
+	freeifaddrs(ifap);
+	return 1;
+    }
 
-    return 1;
+    freeifaddrs(ifap);
+    return 0;
 }
 
 /*

--------------000405050901020504040008--
