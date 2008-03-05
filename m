From: bfc <chappaquasuite@yahoo.com>
Date: Wed, 05 Mar 2008 22:19:00 +0000
Subject: hanging tcsetattr call
Message-Id: <15861511.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


It seems when my chat script times out, i'll get an "alarm" notification from
chat, then chat exits, and
pppd hangs for a while on a tcsetattr() call -- it's trying to restore the
terminal characteristics of
our serial port.  

Eventually it syslogs:
Mar  5 17:09:25 box pppd[21132]: tcsetattr: Interrupted system call (line
1001)

Evidentally the pppd can no longer use the device, perhaps it's been reset
from having an session attempted
but not succeeding?  Anyone else ever see this problem?

Should there be any signal flow that causes this to go correctly, e.g. a
SIGCHLD going to the pppd?
Or does pppd just see a non-zero exit value from chat, and should gracefully
shut itself down?

Thanks!
-- 
View this message in context: http://www.nabble.com/hanging-tcsetattr-call-tp15861511p15861511.html
Sent from the linux-ppp mailing list archive at Nabble.com.

