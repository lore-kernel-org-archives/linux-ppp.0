From: James Cameron <james.cameron@hp.com>
Date: Wed, 02 Jul 2008 03:38:29 +0000
Subject: Re: PPTP VPN, PPTP CONFIG
Message-Id: <20080702033828.GB5466@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W2416827856326101214924196@webmail30>
In-Reply-To: <W2416827856326101214924196@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day Tony,

I'm the author of pptpconfig, and I am beginning to regret it.

You've done some interesting things with what you've learned from it.
You might not have known what the updetach option does ... check the
pppd man page for that.

Your final question was how to write a script to try the pppd command
repeatedly.  This is a shell question.  One simple method is to write a
shell loop, like this:

#!/bin/sh
while true; do
	pppd call myserver logfd 1 nodetach
done

The updetach is changed to nodetach, so that the pppd process does not
exit until the connection is closed.

If you used updetach in an inittab referenced script, you'd get too many
processes.  This is because init might start a new one since the process
that started pppd had terminated.

Have a look at my script
http://quozl.linux.org.au/darcs/eee-maxon-bp3/usr/sbin/bp3
where I use pppd in a similar way.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
