From: K-sPecial <spam@blazemail.com>
Date: Thu, 18 Nov 2004 21:07:05 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <419D0EF9.7080903@blazemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> Sure ... but why does it hurt to change the IP address when "the link"
> is down?
> 

Because I don't want the script to go into the loop of checking if it's 
back up again if it wasn't down in the first place. I guess it wouldn't 
hurt because all that would happen is it would update the hostname with 
the ip it's already at (the "old" ip) and things would be gravy. But 
remember at the time I said it waits 10 minutes or whatever is specified 
before updating if it thinks it's down (connect() doesn't succeed on the 
port), what if in these 10 minutes your Internet came available, then 
unless it checks if it's online, the ip would be changed to the ip to 
change to when the service on the port can't be reached because of that 
services computer.

> That's precisely the point.
> The thing that makes a host unreachable might be zero, one, or many
> hops away.  Worrying about the local interface(s) or about one
> particular local router is just useless.

Yay! We *do* agree.

> Anway, as I've said multiple times now, you can determine precisely
> whether PPP is up or down (and get notifications when it goes up and
> down) by using any of SIOCGIFCONF, PF_ROUTE, or /etc/ppp/ip-{up,down}.
> You do not need to have the socket connection aborted with an error in
> order to find out this information.

Yes, for ppp that is great, thanks, thanks alot.

--K-sPecial

[ http://xzziroz.freeshell.org
   irc://xzziroz.dtdns.net       ]




