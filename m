From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 18 Nov 2004 19:29:20 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <16796.63504.718948.307282@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

K-sPecial writes:
> > If the system is isolated from the world, then periodically noticing
> > that the 'port' still isn't reachable, and switching to a different IP
> > address should make no difference at all.
> 
> No, I think we are confusing each other, the port is open to begin with, 
> the script changes it's ip so when the service goes unavailable it can 
> be redirected to another computer running the same service. Basicly for 
> when you don't have enough control of the computer the service is 
> initialy running on to implment this from there.

Sure ... but why does it hurt to change the IP address when "the link"
is down?

> > If you care about particular interfaces for some reason, then use
> > SIOCGIFCONF to read the kernel's interface table or open a routing
> > socket (PF_ROUTE) and listen for interface add/delete messages.
> > 
> 
> Well, I don't care about the interface, since as I earlier stated, an 
> interface can be up yet the internet still not accessable such as when 
> your router is connected to you via ethernet.

That's precisely the point.

The thing that makes a host unreachable might be zero, one, or many
hops away.  Worrying about the local interface(s) or about one
particular local router is just useless.

Anway, as I've said multiple times now, you can determine precisely
whether PPP is up or down (and get notifications when it goes up and
down) by using any of SIOCGIFCONF, PF_ROUTE, or /etc/ppp/ip-{up,down}.
You do not need to have the socket connection aborted with an error in
order to find out this information.

-- 
James Carlson                                 <carlsonj@workingcode.com>
