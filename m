From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Tue, 25 Jan 2005 19:21:59 +0000
Subject: Link Quality Monitoring support?
Message-Id: <20050125192159.GA4603@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm trying to figure out a way to monitor the quality of our ppp links.  It
would seem that RFC1989 would provide a perfect way to do it, but it does not
appear that pppd 2.4.3 supports it.

I see in the TODO file that link quality monitoring is listed and I do see a
_bit_ of code regarding it in the source.

So a couple questions--

Any timeframe on this being implemented in pppd?  Next release?  Two years
from now?

How are the rest of you currently accomplishing similar monitoring?  I have
considered writing a small daemon that pings each connection in some sort of
efficient way and keeps track of average packet loss.  Perhaps there's a more
elegant solution already out there.

Thanks for any feedback on this...
Ray
