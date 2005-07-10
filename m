From: Greg Stark <gsstark@mit.edu>
Date: Sun, 10 Jul 2005 17:10:18 +0000
Subject: options in plugins?
Message-Id: <87wtny1tad.fsf@stark.xeocode.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I'm not sure if development on pppd is still active. It seems there are dozens
of patches floating around and no upstream releases coming. Is it? Is this
still the list to reach the upstream maintainers?

My question is whether there's a way to add options in a plugin. It seems the
options list is a static array in plugins.c and plugins are loaded using
dlsym. So unless I've missed some piece of infrastructure there isn't.

This is really unfortunate. My ultimate goal is to make the timeouts and
retries in pppoe configurable just as they are for LCP. Currently they're set
to 5s with unbounded exponential backoff and a max of 3 retries. That makes
any temporary outage of even about 30s result in a complete failure.

I've hacked my personal copy to just retry every 5s forever but in an ideal
world there would be a pppoe-restart and pppoe-maxfail just like lcp-restart
and maxfail that could be set in the options or peers files.

But I don't see any reasonable way to do that without writing a lot of code.
Nor am I clear whether such a patch would eventually get released. There's not
much point in writing it just for myself -- I have my personal version hacked
up for my use already. If development is dead then there's not much point in
fixing this problem so generally.

-- 
greg

