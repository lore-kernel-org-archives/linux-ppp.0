From: Greg Stark <gsstark@mit.edu>
Date: Fri, 10 Dec 2004 06:30:22 +0000
Subject: Kernel memory leak with PPPoE
Message-Id: <87d5xi7ji9.fsf@stark.xeocode.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I'm not sure if this is the right list or perhaps linux-kernel. But I figure
people here will at least be interested even if it's not strictly in your
bailiwick.

The other day my ISP went down for a few days (They hadn't paid their bills to
the ILEC, doh). I discovered that there's a kernel memory leak in the pppoe
module somewhere.

Since there was no config option I have my pppd patched to keep retrying PPPoE
forever rather than giving up after a few iterations. (Why do people write
code with hard coded limitations like that anyways? argh!). 

After a few hours of PPPoE interface creation and teardown on PAP
authentication failures my router box (a poor 486 with 24M of memory) started
swapping. By the end of the first day it was swapping madly and eventually
became totally unresponsive.

The same thing happened later after I rebooted it, except I stopped pppd
completely. The problem did not go away. I'm pretty convinced it's a kernel
memory leak by the fact that the machine kept swapping after pppd died. I've
seen the same symptoms in the past too in the same circumstances (it's not a
very reliable ISP).

This isn't totally up to date source code, but I'm pretty sure the PPPoE
kernel module hasn't undergone much work in the past year or so has it?

This is Linux 2.4.21 with the ppp_generic, pppox, pppoe modules. pppd version
2.4.2b2 which I believe I actually built from CVS sources.

I know it's suboptimal to report a bug report without reproducing it with a
clean unpatched, preferably recent, version. However this is my router box and
I upgrading it to linux 2.6 would be a major project (and I believe 2.4 suits
the 486 better). And with the unpatched pppd I would have to script restarting
pppd repeatedly (and deal with the consequences of the interface disappearing
and reappearing) since the pppoe module has a hard coded constant number of
retries before it aborts.

-- 
greg

