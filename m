From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 30 Oct 2009 19:10:19 +0000
Subject: Re: pppd & ntpd
Message-Id: <4AEB3A1B.9060806@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AEAFDE0.2060600@bfs.de>
In-Reply-To: <4AEAFDE0.2060600@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> It seems that ntpd is scanning the interfaces from time to time because
> it notice sometimes that ppp0 is there and stays for a while. That means
> if someone is testing and it works, it may work again if the redail is
> soon enought (interface not droped yet) but if it takes a bit longer
> (e.g. you have a phonecall) it does not work anymore.

Good that it's rescanning from time to time (probably 10 minute
intervals or so, I'd guess), but that's just a band-aid over a design
flaw in the daemon.  If the system architecture really requires all
those separate bound sockets, then it should be listening on a routing
socket to get a timely notification of interfaces coming and going, and
using a scan only as a back-up in case a message gets lost (the kernel's
writes into routing socket listeners are non-blocking and thus not
entirely reliable under stress).

Of course, if the system architecture doesn't require a zillion open
sockets, then that's even better.

In any event, not really a pppd issue, but rather an ntpd/xntpd issue.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
