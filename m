From: Abdul J <postabdul@yahoo.com>
Date: Fri, 15 Oct 2004 18:05:46 +0000
Subject: mlppp-link termination issue
Message-Id: <20041015180546.26617.qmail@web60106.mail.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I am using the ppp-2.4.2 version on a Redhat machine
with Kernel 2.4.20. I use multilink option to combine
(inverse multiplex) a number of satellite links to
aggregate bandwidth. This is a test setup and I
control both ends of the PPP connection.

I observed that when the first link drops
(terminated/disconnected) the ppp0 interface is
dropped even though other links of the bundle are
still connected. This results in having to restart all
the connections when the first (primary) link of the
bundle disconnects.

Though this behaviour is not in accordance with RFC
1990, the pppd man page (of ppp-2.4.2) acknowledges
this. 
"Currently, if the first pppd terminates (for example,
because of a hangup or a received signal) the bundle
is destroyed"

My question is: Are there any plans to fix this in
future releases of the ppp-package or are there any
other ppp implementations in Linux that do not suffer
from this problem? Is there any way to work around
this problem.

Please share your comments

Thanks
Abdul


		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com
