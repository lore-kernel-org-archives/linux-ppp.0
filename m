From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 18 Nov 2004 18:30:59 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <16796.60003.33064.977311@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

K-sPecial writes:
> > Even if the interfaces are up and the modem is "on line," that doesn't
> > mean that any particular host is actually reachable.  That sort of
> > global knowledge just isn't knowable, except in retrospect: if the
> > connection times out, then that host obviously can't be reached.
> 
> Well there the problem lies within, the script was meant to to check if 
> a port was open every so often, if it's down, check if your online, then 
> possibly wait again to see if it opens back up, say 10 minutes (maybe 
> the computer rebooted, maybe crontab will restart it), check again if 
> online, then point the hostname to a different ip and start checking if 
> the old host is back up again (so I can change it back). So just 
> checking if I could access the host is what I was *double* checking, of 
> course I couldn't rely on just the fact that I can't reach the port, 
> before updating it to a new ip.

What's the point?

If the system is isolated from the world, then periodically noticing
that the 'port' still isn't reachable, and switching to a different IP
address should make no difference at all.

Why condition the logic on local interface status?

>  > That's what timeouts are for.  You can use the existing default
>  > timeout provided by TCP, or (if that's too long) you can set up your
>  > own timer with alarm() or similar functions.
> 
> Yup, i'm not sure but it seems the timeout optino that IO::Socket uses 
> is just a connect timeout, it didn't seem to register when pppd died, 
> could be wrong.

Again, that's not a bug.  It's a design feature of TCP/IP.  Links
going up and down intentionally do _not_ cause connections to fail.

If you care about particular interfaces for some reason, then use
SIOCGIFCONF to read the kernel's interface table or open a routing
socket (PF_ROUTE) and listen for interface add/delete messages.

-- 
James Carlson                                 <carlsonj@workingcode.com>
