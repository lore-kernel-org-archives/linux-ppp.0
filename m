From: James Carlson <carlson@workingcode.com>
Date: Fri, 02 Apr 2004 21:34:27 +0000
Subject: Re: dialin server not routing/forwarding????
Message-Id: <16493.56419.765412.151650@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <406DD9F3.6060901@ansco.com>
In-Reply-To: <406DD9F3.6060901@ansco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Milen Dimitrov writes:
> As you see the IP and the gateway for my windows PC are the same - 
> 192.168.1.171. Is this correct?

No idea.  I don't use Windows.  It looks goofy, so may as well assume
that it's ok.  ;-}

> My guess is that the linux Dial-in server doesn't route/forward packets 
> from PPP  to the rest of the LAN?

Yes, that seems like a reasonable guess.  As a further guess, I
suspect that your Linux system has a "proxy ARP" tunable somewhere,
and that you don't have proxy ARP enabled.  Since this connection
appears to be configured for proxy ARP, you'll need to turn that on.

> netmask 255.255.255.0

You might want to ditch that.  It doesn't help on point-to-point
links.

> ms-dns 192.168.1.1
> ms-dns 192.168.1.1

That's strange.  Your PC is reporting different addresses for the DNS
server.  I wonder why it's not getting these addresses ...

Try adding "debug" to your pppd configuration and making sure that
daemon.debug is redirected to a file in /etc/syslog.conf.  Please
include debug messages with your posting.

It would be nice to know how the network is configured, in order to
know if the 'proxyarp' option makes sense here.  Include 'netstat -nr'
in your next posting, or at least verify that the remote IP address on
the PPP link is inside the subnet defined by one of your
broadcast-type interfaces (such as an Ethernet interface).

Another good thing to look at would be the output of 'netstat -s'
before and after attempting to contact the network from the PC.  Look
especially at the drop counters.

-- 
James Carlson                                  <carlson@workingcode.com>
