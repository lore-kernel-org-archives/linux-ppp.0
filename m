From: "Richard Plourde" <richard-plourde@sympatico.ca>
Date: Wed, 02 Jun 2004 16:25:37 +0000
Subject: pppd 2.4.2 IPX problems
Message-Id: <005201c448be$3cfbd660$6401a8c0@Zazzmachine>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Here's a tricky one for you ppp gurus!

I've compiled my Redhat Linux kernel (2.4.20-20.7) with IPX support:

CONFIG_IPX=m
CONFIG_IPX_INTERN=y.

I've also configured it to support Novell Control Protocol

CONFIG_NCP_FS=m
CONFIG_NCPFS_PACKET_SIGNING=y
CONFIG_NCPFS_IOCTL_LOCKING=y
CONFIG_NCPFS_STRONG=y
CONFIG_NCPFS_NFS_NS=y
CONFIG_NCPFS_OS2_NS=y
CONFIG_NCPFS_SMALLDOS=y
CONFIG_NCPFS_NLS=y
CONFIG_NCPFS_EXTRAS=y

I've installed ipxripd-0.8 and ncpfs-2.1.1.

I can successfully do slist and see my Novell server. So the IPX support
seems functional.

When it comes to pppd-2.4.2, I've edited the makefile to include:

IPX_CHANGE = 1
USE_MS_DNS = 1

I did the make and the make install.

When I come to connect with ppp from my Windows workstation, I get this
error in the pppd logfile:

Jun  2 11:48:31 <custserver> pppd[27805]: rcvd [IPXCP ConfReq id=0x5
<network 0> <node 02ee0016331b>]
Jun  2 11:48:31 <custserver> pppd[27805]: Unsupported protocol 'Novell IPX
Control Protocol' (0x802b) received

Since I'm pretty sure the kernel is properly compiled, I'm begining to
suspect the pppd distribution.


Has anybody encountered such a situation? Any help at this point would be
greatly appreciated!

Thanks!
Rikk



