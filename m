From: "Murugaiyan N" <murugaiyan@banyannetworks.com>
Date: Thu, 25 Dec 2003 10:24:48 +0000
Subject: RE: Linux Kernel PPPoE/PPP Interactions
Message-Id: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am trying to write my own pppoe and ppp control plane server over linux
kernel ppp 2.4.8-20.

my understanding is for the set of system calls, the the user space program
should get the ppp control packets.
But it is not happening, please point out the problem.

My box is linux 9 with 2.4.20-8 kernel, on which enable PPPoE/PPP driver.
and they are working fine with linux control plane daemon.
So the kernel is all set.  I have reproduced the code of the user space
below.


======================================
=once the pppoe session is established we open a pppoe socket and do a
connect.
that gives me pppoeSessionSock;

Then i do the following to setup a control channel for my PPPD.

  /* Get the channel index from the pppoe session socket */
  if (ioctl(pppoeSessionSock, PPPIOCGCHAN, &channelIndex) = -1) {
    ERROR(ZS_PPP_ID,  "Couldn't get channel number \r\n");
    return ERR;
  }


  fd = open("/dev/ppp", O_RDWR);
  if (fd < 0) {
    ERROR(ZS_PPP_ID,  "Couldn't open /dev/ppp\r\n");
    return ERR;
  }

  (void) fcntl(fd, F_SETFD, FD_CLOEXEC);
  if (ioctl(fd, PPPIOCATTCHAN, &channelIndex) < 0) {
    ERROR(ZS_PPP_ID,  "Couldn't attach channelIndex\r\n");
    return ERR;
  }


  pppDevFd = open("/dev/ppp", O_RDWR);
  if (pppDevFd < 0) {
    perror("Couldn't open one more /dev/ppp\r\n");
    return ERR;
  }

  flags = fcntl(pppDevFd, F_GETFL);

  if (flags = -1 || fcntl(pppDevFd, F_SETFL, flags | O_NONBLOCK) = -1) {
    perror("Warning: Couldn't set /dev/ppp (channel) to nonblock: \r\n");
  }

  x = ioctl(pppDevFd, PPPIOCNEWUNIT, &ifUnit);

  if (x < 0) {
    perror("Couldn't create new ppp unit: \r\n");
    ERROR2(ZS_PPP_ID, "Couldn't create new ppp unit: retval %d, ifUnit
%d\r\n", x, ifUnit);
    return ERR;
  }

  if (ioctl(fd, PPPIOCCONNECT, &ifUnit) < 0) {
    perror("Couldn't attach to PPP unit:");
    ERROR1(ZS_PPP_ID, "Couldn't attach to PPP unit: \r\n", ifUnit);
    return ERR;
  }

  after this do a read on the fd "fd".
  Nothing comes.
======================================
======
Why do we need to fd to get control planes packets?

Thanks in Advance,
Murugaiyan. N




---------------------
Broadband Division
www.banyannetworks.com

-----Original Message-----
From: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org]On Behalf Of Michal Ostrowski
Sent: Tuesday, October 19, 2004 7:37 PM
To: Murugaiyan N
Cc: linux-ppp@vger.kernel.org
Subject: Re: Linux Kernel PPPoE/PPP Interactions


PPPoE discovery/negotiation is done in user-space.

Once a session is established a pppoe socket is created and "attached"
to to a ppp channel.

Consequently,  pppoe session packets coming in are directly streamed
into the ppp driver.

On Tue, 2004-10-19 at 17:11 +0530, Murugaiyan N wrote:
>
> I am trying to understand the kernel mode pppoe and ppp interactions and
how
> packet flow through them.
> Someone give me some directions on where to start?
>
> what do the files /usr/src/linux/driver/net/pppox.c and pppoe.c for?
>

Basically transfer pppoe ethernet frames to and from a ppp device,
stripping and adding in a pppoe header as necessary.



> The roaring penguin code doesn't seem to interact with functions in the
> kernel space. Is is so?
>

You can build a pppoe plugin that loads into pppd to perform pppoe
negotiation and ths socket attachment described above.

--
Michal Ostrowski <mostrows@watson.ibm.com>

-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


