From: Ben McKeegan <ben@netservers.co.uk>
Date: Tue, 01 Dec 2009 11:00:30 +0000
Subject: Re: [PATCH] Re: [Openl2tp-users] OpenL2TP, multilink, ppp[PID] and
Message-Id: <4B14F74E.4090602@netservers.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <4279c9ed2a7083900ac678e5af7f80f9@imap.globalways.net>
In-Reply-To: <4279c9ed2a7083900ac678e5af7f80f9@imap.globalways.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Johannes Jakob wrote:
> 
> Thank you very much for your patch! It is working absolutely great and as I
> hoped it would (pppd-2.4.5)!
> 
> As I think you might have had other similar problems we have, what are your
> experiences with openl2tp for dialin users in a large scale? Are there
> problems still unsolved?
> 

We've run into various multilink related kernel bugs (not openl2tp 
specific).  I've submitted patches upstream.  One fixes lost fragments 
and has been included upstream as of 2.6.31.   The other fixes quite a 
nasty kernel BUG (panic) and will be in 2.6.32.

> 
> Currently I'm having trouble monitoring mlppp bundles. Is there any
> reasonable and reliable way to check how many ppp links are in a bundle and
> if they are up and running?

We've written our own LNS management application that gathers all this 
data together.   It reads /var/run/pppd2.tdb to learn about active 
connections and the links that make them up, talks to openl2tpd via the 
RPC interface to learn how these relate to L2TP sessions and gather L2TP 
bandwidth stats for them, and uses libpcap to monitor the L2TP 
encapsulated LCP packets which it uses to provide a continual log of 
latency and packet loss.


> Because of it's nature, there aren't any pid files in /var/run/ except for
> the bundle, ip, ifconfig and netstat aren't of any help, too.  Is there any
> status plugin, that is multilink aware?

The info is all in /var/run/pppd2.tdb.   Try dumping the database file 
with tdbdump, the format isn't too hard to figure out by example.

> 
> 
> We are still looking for a patch to get pppd to name it's interfaces
> ppp[PID] instead of ppp[incrementor], just changing the ifname didn't work
> (of course ;)

You probably need to write a plugin to do that.  We have a couple of 
bespoke pppd plugins we use to rename interfaces in various ways.  They 
are similar in a way to my radattr patch in that they try to hook in as 
soon as PPPd has decided on the interface name, but this differs 
depending on whether multilink is on or off.  Once they have control 
they do an ioctl SIOCSIFNAME to rename the interface then update pppd's 
internal device name sting (ifname) to match and also set an environment 
variable with the new name.  They first hook into the phasechange 
notifier and wait for PHASE_ESTABLISH.  If the ifname string is not 
empty at this stage (non-multilink) it can rename the interface, 
otherwise it then hooks itself into the ip_choose_hook so it can try 
again as that's the first hook on a multilink connection after ifname is 
set.

Regards,
Ben.


