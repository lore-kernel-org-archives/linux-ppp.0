From: K-sPecial <spam@blazemail.com>
Date: Thu, 18 Nov 2004 18:54:01 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <419CEFC9.4040504@blazemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> What's the point?
> 
> If the system is isolated from the world, then periodically noticing
> that the 'port' still isn't reachable, and switching to a different IP
> address should make no difference at all.

No, I think we are confusing each other, the port is open to begin with, 
the script changes it's ip so when the service goes unavailable it can 
be redirected to another computer running the same service. Basicly for 
when you don't have enough control of the computer the service is 
initialy running on to implment this from there.

> Again, that's not a bug.  It's a design feature of TCP/IP.  Links
> going up and down intentionally do _not_ cause connections to fail.
> 
> If you care about particular interfaces for some reason, then use
> SIOCGIFCONF to read the kernel's interface table or open a routing
> socket (PF_ROUTE) and listen for interface add/delete messages.
> 

Well, I don't care about the interface, since as I earlier stated, an 
interface can be up yet the internet still not accessable such as when 
your router is connected to you via ethernet.

--K-sPecial


