From: K-sPecial <spam@blazemail.com>
Date: Thu, 18 Nov 2004 18:06:38 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <419CE4AE.2020705@blazemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> Even if the interfaces are up and the modem is "on line," that doesn't
> mean that any particular host is actually reachable.  That sort of
> global knowledge just isn't knowable, except in retrospect: if the
> connection times out, then that host obviously can't be reached.

Well there the problem lies within, the script was meant to to check if 
a port was open every so often, if it's down, check if your online, then 
possibly wait again to see if it opens back up, say 10 minutes (maybe 
the computer rebooted, maybe crontab will restart it), check again if 
online, then point the hostname to a different ip and start checking if 
the old host is back up again (so I can change it back). So just 
checking if I could access the host is what I was *double* checking, of 
course I couldn't rely on just the fact that I can't reach the port, 
before updating it to a new ip.

 > That's what timeouts are for.  You can use the existing default
 > timeout provided by TCP, or (if that's too long) you can set up your
 > own timer with alarm() or similar functions.

Yup, i'm not sure but it seems the timeout optino that IO::Socket uses 
is just a connect timeout, it didn't seem to register when pppd died, 
could be wrong.

--K-sPecial

[ http://xzziroz.freeshell.org
   irc://xzziroz.dtdns.net       ]





