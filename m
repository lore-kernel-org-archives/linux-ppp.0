From: "Jorge Daniel Sequeira Matias" <martin@andorinha.ist.utl.pt>
Date: Tue, 27 Jun 2006 22:38:01 +0000
Subject: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org


  Hi everyone,

  I'm running a PPTP VPN Server for almost 4 years now. This server is 
running in a Debian Linux (unstable).
  The configuration for the last 1 year and a half was the following:

  Computer 2x Intel Xeon 2.6GHz and 512MB RAM
  Linux v2.6.11.6 (vanilla) with MPPE patch
  Debian distribution with the following packages
     - pppd 2.4.3-20050321
     - libradius1 0.3.2-8
     - radiusclient1 0.3.2-8

  With this configuration I had reach a peek of aprox. 600 hundred PPTP 
connections simultaneously. The computer gets heavy loaded doing MPPE 
compression/decompression with 40Mbits/sec of PPP traffic but didn't have 
any problem with this setup. The authentication process is using a pool of 
RADIUS servers.

   This machine is also a firewall, and now a new feature was needed: PPTP 
VPN connections from the inside.

  The problem:

   After the upgrade to a Linux v2.6.15.4 (vanilla) with no patches to use 
the new "ip_conntrack_pptp" module, I started to get "pppd" processes 
hanging in "S" state and consuming CPU power.

---- Here is a bit of debug commands ----
machine:# strace -p 18859
Process 18859 attached - interrupt to quit
ioctl(8, TIOCSETD (Issued Ctrl+C here after a few seconds)<unfinished ...>
machine:# ps aux | grep 18859
root     18859  2.1  0.2  2696 1360 ?        S    09:52  17:27 
/usr/sbin/pppd local file /etc/ppp/options.pptpd 115200 10.2.255.254:
machine:# ps ax | grep 18859
18859 ?        S     17:30 /usr/sbin/pppd local file /etc/ppp/options.pptpd 
115200 10.2.255.254:10.2.0.71 ipparam 10.1.7.232 plugin 
/usr/lib/pptpd/pptpd-logwtmp.so pptpd-original-ip 10.1.7.232
machine:# lsof -p 18859
COMMAND   PID USER   FD   TYPE     DEVICE    SIZE     NODE NAME
pppd    18859 root  cwd    DIR        9,1    4096        2 /
pppd    18859 root  rtd    DIR        9,1    4096        2 /
pppd    18859 root  txt    REG        9,1  265880  4424041 /usr/sbin/pppd
pppd    18859 root  mem    REG        0,0                0 [heap] (stat: No 
such file or directory)
pppd    18859 root  mem    REG        9,1   64924  1720713 
/lib/tls/libresolv-2.3.2.so
pppd    18859 root  mem    REG        9,1   13976  1720706 
/lib/tls/libnss_dns-2.3.2.so
pppd    18859 root  mem    REG        9,2  147456   711080 
/var/run/pppd2.tdb
pppd    18859 root  mem    REG        9,1   47024  5095932 
/usr/lib/pppd/2.4.3/radius.so
pppd    18859 root  mem    REG        9,1   34748  1720707 
/lib/tls/libnss_files-2.3.2.so
pppd    18859 root  mem    REG        9,1   33440  1720709 
/lib/tls/libnss_nis-2.3.2.so
pppd    18859 root  mem    REG        9,1   73304  1720704 
/lib/tls/libnsl-2.3.2.so
pppd    18859 root  mem    REG        9,1   28616  1720705 
/lib/tls/libnss_compat-2.3.2.so
pppd    18859 root  mem    REG        9,1 1254468  1720699 
/lib/tls/libc-2.3.2.so
pppd    18859 root  mem    REG        9,1  113040  3621129 
/usr/lib/libpcap.so.0.7.1
pppd    18859 root  mem    REG        9,1    9872  1720701 
/lib/tls/libdl-2.3.2.so
pppd    18859 root  mem    REG        9,1   30360  4637043 
/lib/libpam.so.0.76
pppd    18859 root  mem    REG        9,1   18876  1720700 
/lib/tls/libcrypt-2.3.2.so
pppd    18859 root  mem    REG        9,1    4272  3621647 
/usr/lib/pptpd/pptpd-logwtmp.so
pppd    18859 root  mem    REG        9,1   90024  4637078 /lib/ld-2.3.2.so
pppd    18859 root    0u   CHR     136,64               66 /dev/pts/64
pppd    18859 root    1u   CHR     136,64               66 /dev/pts/64
pppd    18859 root    2u   CHR        1,3          4472977 /dev/null
pppd    18859 root    3u  unix 0xd5341500         34918748 socket
pppd    18859 root    4u   CHR        1,3          4472977 /dev/null
pppd    18859 root    5u  sock        0,4         34918753 can't identify 
protocol
pppd    18859 root    6u  sock        0,4         34918754 can't identify 
protocol
pppd    18859 root    7u   REG        9,2  147456   711080 
/var/run/pppd2.tdb
pppd    18859 root    8u   CHR     136,64               66 /dev/pts/64
pppd    18859 root    9u   CHR      108,0          4474356 /dev/ppp
pppd    18859 root   10u   CHR      108,0          4474356 /dev/ppp
------ End of debug info ----

Every day I have about 5 new "pppd" processes hanging in this state.

I upgraded to a Linux 2.6.16.16 with no patches and the "ip_conntrack_pptp" 
enable. Every other piece of software remains the same. The problem is the 
same. I still have compiled a Kernel with no "ip_conntrack_pptp" to see this 
was causing the problem but appears not to be the case.

This is kernel config:
#
# Wan interfaces
#
# CONFIG_WAN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_PPP=y
# CONFIG_PPP_MULTILINK is not set
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_ASYNC=y
CONFIG_PPP_SYNC_TTY=y
CONFIG_PPP_DEFLATE=y
CONFIG_PPP_BSDCOMP=y
CONFIG_PPP_MPPE=y
# CONFIG_PPPOE is not set
# CONFIG_SLIP is not set
# CONFIG_SHAPER is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set

------------------------------------------------------------------------------------------------------

Anyone else has this problem?

Best Regards,
Jorge Matias
CIIST - Centro de Informática do
Instituto Superior Técnico
Universidade Técnica de Lisboa

