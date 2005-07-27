From: "Feighery,Patrick D." <FEIGHERY@mitre.org>
Date: Wed, 27 Jul 2005 15:02:36 +0000
Subject: Current size of PPP transmit queue
Message-Id: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have an application that needs to know the number of packets/bytes
that are currently in ppp's transmit queue.  My understanding is no
utility currently exists to capture and display this attribute - please
correct me if I misspeak.

I've been going the kernel (2.6.5) trying to find this queue (which I
assume is in the serial driver) so I can write an ioctl to get this
information to my application.  I'm familiar with other operating
systems, but this is my first real time going through the linux kernel.
Any pointer to this information and how I can get hold of it would be
greatly appreciated.

Many thanks, and if this is not the correct list, please accept my
apologies and could you point me to the correct one.

Pat

feighery@mitre.org


