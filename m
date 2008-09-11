From: Lie Arne <Arne.Lie@sintef.no>
Date: Thu, 11 Sep 2008 07:35:20 +0000
Subject: Packet drop with PPP and tty-driver
Message-Id: <39417DF3286A66428FA558987839F44F064DF60D@SINTEFXCH01.sintef.no>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

We are using our custom tty-driver for communicating between an embedded
Linux processor and a DSP running modem software. 

The pppd is started by typing "pppd /dev/our_driver0". pppd opens this
driver in non-blocking mode. At write, when our write queue is full, we
return -EAGAIN. With low traffic there is no problem, but when load
increases above PPP-link capacity, the ppp subsystem begins to throw
packets. Still the communication link is working, but this situation
poses two problems:

1. If using PPP compression, packets drops inside PPP causes performance
drop because the compression algorithm has the be resynchronized.

2. The Linux networking code output queuing system sees the ppp0
interface as a very fast interface (instead of a slow one), preventing
Linux queue backlog to happen, and thus makes it impossible to have
prioritized queuing (e.g. PRIO/TBF or HTB supporting DiffServ) in front
of the ppp interface. 

We want the PPP-link to be reliable, and relying on the Linux network
code output queue to take care of traffic overload situations (with FIFO
tail drop or QoS supported drops, e.g.).

We would appreciate any help / suggestions for what could be wrong with
our implementation: what are we doing wrong?

Best regards,
 
Arne Lie
SINTEF ICT, Dept. of Communication Systems
e-mail: arne.lie@sintef.no 
