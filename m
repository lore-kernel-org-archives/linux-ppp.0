From: GauloisID <David.Babin@dmic.fr>
Date: Thu, 11 Dec 2008 15:48:49 +0000
Subject: PPP Recovery
Message-Id: <20958060.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi all,

I Would like to setup a permanent connection with a local rs232 GPRS modem.
I Use kernel 2.6.24 and PPP 2.4.4.

My connection work fine (DNS, ICMP...), but sometimes my GPRS provider drop
my connection due to timeout, moving....

Is there any way to tell ppp that sent packet (TCP/UDP) have retransmission
timeout to indicate that the connection is dead ? In this case it would be
easy to re-negociate the link.

Thanks for help.

-- 
View this message in context: http://www.nabble.com/PPP-Recovery-tp20958060p20958060.html
Sent from the linux-ppp mailing list archive at Nabble.com.

