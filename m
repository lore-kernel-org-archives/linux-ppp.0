From: "Murugaiyan N" <murugaiyan@banyannetworks.com>
Date: Thu, 25 Dec 2003 12:56:56 +0000
Subject: RE: Linux Kernel PPPoE/PPP Interactions
Message-Id: <NIBBLPOFOMEFBJKBJLGFAEFCCEAA.murugaiyan@banyannetworks.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
In-Reply-To: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Is there any thing that needs to be done apart from doing the following.
ioctls.

But by doing this, i am not getting any packets.  How to debug why the
kernel is not sending the packets up.
Is that any thing else i miss.



/* Get the channel index from the pppoe session socket */
  if (ioctl(pppoeSessionSock, PPPIOCGCHAN, &channelIndex) = -1) {


  fd = open("/dev/ppp", O_RDWR);
  (void) fcntl(fd, F_SETFD, FD_CLOEXEC);
  if (ioctl(fd, PPPIOCATTCHAN, &channelIndex) < 0) {

  pppDevFd = open("/dev/ppp", O_RDWR);
  }

  flags = fcntl(pppDevFd, F_GETFL);

  if (flags = -1 || fcntl(pppDevFd, F_SETFL, flags | O_NONBLOCK) = -1) {
  x = ioctl(pppDevFd, PPPIOCNEWUNIT, &ifUnit);

  if (ioctl(fd, PPPIOCCONNECT, &ifUnit) < 0) {


Thanks
Murugaiyan


---------------------
Broadband Division
www.banyannetworks.com

-----Original Message-----
From: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org]On Behalf Of Paul Mackerras
Sent: Tuesday, November 16, 2004 5:15 PM
To: Murugaiyan N
Cc: Michal Ostrowski; linux-ppp@vger.kernel.org
Subject: RE: Linux Kernel PPPoE/PPP Interactions


Murugaiyan N writes:

> my understanding is for the set of system calls, the the user space
program
> should get the ppp control packets.
> But it is not happening, please point out the problem.

LCP packets (and anything else with protocol >= 0xc000) will come in
on `fd', other control packets (e.g. IPCP) will come in on pppDevFd.

Paul.
-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


