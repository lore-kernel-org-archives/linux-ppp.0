From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 14 Oct 2004 16:16:03 +0000
Subject: Re: even after PPP connection established, pings don't work
Message-Id: <Pine.LNX.4.58.0410140914320.24520@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

YOu need to give us detailed info. 
The output of ifconfig -a, route -n
You should also check your firewall that the firewall allows connections
out on the ppp link (by default it will not)
You also need to chech that ping has not been disabled.


On Thu, 14 Oct 2004, Robert P. J. Day wrote:

> 
>   at the moment, i don't have access to the test box (dang, not enough
> of them to go around), but i'm currently baffled by the fact that
> connecting from my embedded board running linux with PPP 2.4.1 to
> another linux system running PPP 2.4.2 seems to work just fine, until
> i try to ping.  then ... nothing.
> 
>   we have the embedded system with on-board modem, connected to
> teltone box, connected to external modem, connected to host.  starting
> pppd on the embedded system, everything works fine, dialing,
> connection, *both* systems claim to have established a PPP
> connection, *both* systems show the PPP connnection in their
> "ifconfig" output, there are no error messages in the log files ...
> all in all, you'd think everything was fine.
> 
>   but running ping on either side just hangs.
> 
>   now, the one complication is that the host is already on the network
> and has a configured eth0 and a default gateway.  and we don't want to
> mess with that so, on the host, we deliberately leave off the
> "defaultroute" option.  from what i read, this shouldn't cause any
> problems.  as long as there's a PPP interface, i should be able to
> directly ping the IP address at the *other* end of that interface,
> even if my default route in the routing table refers entirely to
> another interface and gateway, no?
> 
> rday
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
