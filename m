From: Paul Mackerras <paulus@samba.org>
Date: Thu, 25 Aug 2005 11:15:08 +0000
Subject: Re: Current size of PPP transmit queue
Message-Id: <17165.43068.108457.219674@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
In-Reply-To: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Feighery,Patrick D. writes:

> I have an application that needs to know the number of packets/bytes
> that are currently in ppp's transmit queue.  My understanding is no
> utility currently exists to capture and display this attribute - please
> correct me if I misspeak.

The flow of data is from the network code into the ppp_generic module,
and from there to the ppp_async module (assuming you're doing PPP over
an async serial port), and then to the serial driver.  Both the
ppp_generic and the ppp_async modules buffer no more than one packet.
The network code and the serial driver have queues in them.  I don't
know of any utility that can display how much is buffered at the
various points.

> I've been going the kernel (2.6.5) trying to find this queue (which I
> assume is in the serial driver) so I can write an ioctl to get this
> information to my application.  I'm familiar with other operating
> systems, but this is my first real time going through the linux kernel.
> Any pointer to this information and how I can get hold of it would be
> greatly appreciated.

Which level are you most interested in?  The ppp_generic and ppp_async
modules are probably the least interesting in terms of having the
least amount of data buffered.

In any case, adding an attribute in the sysfs filesystem is probably a
better approach than a new ioctl.

Paul.
