From: Andy <fs@globalnetit.com>
Date: Fri, 02 Apr 2004 16:33:00 +0000
Subject: byte counts in ip-down script
Message-Id: <1080923580.10220.5.camel@dell.tranquilitynj.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This isn't really clear in the doc, I'm hoping someone knows the answer
quickly to save me from having to look through the code! -

If I have persist enabled, and the connection gets dropped and
re-established several times, are the byte counts passed to ip-down each
time it drops cumulative, or are they reset each time?

Thanks -
Andy



