From: Frank Cusack <fcusack@fcusack.com>
Date: Mon, 02 Feb 2004 18:09:56 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040202100956.A7180@google.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Feb 02, 2004 at 12:56:52PM +0200, Pasi K?rkk?inen wrote:
> Check http://nrg.joroinen.fi/yle.log
> 
> It's a tcpdump log from pptp server (running pppd 2.4.2).
> 
> The pptp-client tries to load www.yle.fi in the web browser, but the
> pptp-server _rejects_ all the packets coming from www.yle.fi web server.
> 
> why? Because the pptp-server ppp-interface MTU is set to x-4, when
> pptp-client ppp-interface mtu is set to x. 
> x is the value that is defined in the ppp-server config file.

I see.  So the client is not running pppd?  This client will send frames
larger than the link MTU. :(

> Basicly the pptp-server tells to web-server (all the time) that the
> web-server needs to fragment the packets, because they cannot fit to the 
> ppp-tunnel (and the packets have Dont Fragment-bit set). This is part of the
> PMTUD.

Yes, that is correct operation.

> Now, the problem is, that the web-server is already sending packets which
> have *right* size (the size client told), but the pptp-server rejects them
> because of the ppp-interface MTU is too low (in the pptp server). 

The right size?  The server is doing PMTU-D (evidenced by DF bit) but
not handling ICMP frag-needed messages.  This is broken.  Consider that
*any* link in the path could have a smaller MTU.  The TCP session will
still have the same MSS because the endpoints don't know about the
smaller MTU (unless they've already performed and cached PMTU-D data
between themselves; I think most implementations do this).

RFC 2923 is some interesting things to say on this subject.

So I'm loathe to "fix" this because pppd is doing the right thing.
If the site in question isn't going to handle ICMP frag-needed, then
it shouldn't be setting DF!

It wouldn't be hard to add an option mppe-broken-pmtu-for-stupid-sites
or something equally nasty sounding.  But you will have a problem with
1500 MTU links (as oppposed to the 1400 in your example -- does pptpd
automatically reduce by 100 for some reason?)  And you can't fix the
case when some other link has a smaller MTU.  I guess there could
be another option capping the point at which the MTU isn't reduced.
Now we're talking about ugly workarounds for someone else's problem.
ugh.

I'd really rather not change correct operation.

/fc
