From: Nathan Williams <nathan@traverse.com.au>
Date: Fri, 24 Oct 2008 02:07:29 +0000
Subject: plugin pppoatm and multilink
Message-Id: <7at5jd$6u1m7m@ipmail04.adl2.internode.on.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I have been trying to use pppd 2.4.4 with multilink:

debian:~# pppd plugin pppoatm.so 0.8.35 multilink nodetach
Plugin pppoatm.so loaded.
using channel 8
Starting negotiation on 0.8.35
ioctl(SIOCSIFMTU): No such device

I have looked in the plugin code and discovered in send_config_pppoa, 
ioctl() fails because the interface name (ifname) isn't set.  Without 
the multilink option, ifname is "ppp0".
If I enclose the code in an if(!multilink), it appears to work.  It 
looks like the MTU gets set later in mp_join_bundle() anyway, but I'm 
not too familiar with the code.
Any comments would be greatly appreciated.

Regards,
Nathan

--- ppp-2.4.4.orig/pppd/plugins/pppoatm/pppoatm.c    2006-05-21 22:44:41
+++ ppp-2.4.4.new/pppd/plugins/pppoatm/pppoatm.c        2008-10-24 12:02:42
@@ -173,18 +173,20 @@ static void send_config_pppoa(int mtu,
                               int pcomp,
                               int accomp)
  {
-       int sock;
-       struct ifreq ifr;
-       if (mtu > pppoatm_max_mtu)
-               error("Couldn't increase MTU to %d", mtu);
-       sock = socket(AF_INET, SOCK_DGRAM, 0);
-       if (sock < 0)
-               fatal("Couldn't create IP socket: %m");
-       strlcpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
-       ifr.ifr_mtu = mtu;
-       if (ioctl(sock, SIOCSIFMTU, (caddr_t) &ifr) < 0)
-               fatal("ioctl(SIOCSIFMTU): %m");
-       (void) close (sock);
+       if(!multilink){
+               int sock;
+               struct ifreq ifr;
+               if (mtu > pppoatm_max_mtu)
+                       error("Couldn't increase MTU to %d", mtu);
+               sock = socket(AF_INET, SOCK_DGRAM, 0);
+               if (sock < 0)
+                       fatal("Couldn't create IP socket: %m");
+               strlcpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
+               ifr.ifr_mtu = mtu;
+               if (ioctl(sock, SIOCSIFMTU, (caddr_t) &ifr) < 0)
+                       fatal("ioctl(SIOCSIFMTU): %m");
+               (void) close (sock);
+       }
  }

  static void recv_config_pppoa(int mru,



------------------------------------------------------------------
Nathan Williams
nathan@traverse.com.au
http://www.traverse.com.au
Tel:  +613 9486 7775
Fax: +613 9482 7754
------------------------------------------------------------------ 

