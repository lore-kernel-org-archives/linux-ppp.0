From: James Carlson <carlson@workingcode.com>
Date: Sat, 10 Apr 2004 19:52:01 +0000
Subject: Re: pppd routing
Message-Id: <16504.20577.925270.677283@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <40799D08.40700@netscape.net>
In-Reply-To: <40799D08.40700@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

nick writes:
> Someone else says:

That "someone else" was me.

> "One of (at least) three possible things:
>    - your local name service is misconfigured (what's in
>            /etc/resolv.conf?)
> 
>      - your local routing configuration is wrong (what does
>            'netstat -nr' or 'route -n' report?)"
> 
> I looked at "netstat -nr" and "route -n", but since I run windows/linux 
> on the same laptop (and cannot connect to the net from Linux), I could 
> not capture the output into a file and send it along with the email.

That shouldn't be a problem.  Just mount up the Windows filesystem
under Linux and write the debug output on that.

> Again, I use 'usedefaultroute' (or 'defaultroute)in pppd script/conf, 
> wasn't it suppose to add the routing automatically to the routing table 
> ?

Yes, but only if it works!  If there's an existing default route (due
to prior misconfiguration of your system), then pppd won't replace the
broken default route, and you'll have exactly the symptoms you
describe.

This is a _common_ system configuration mistake, especially (for some
reason) on Linux, but without seeing the "netstat -nr" output, I can't
tell you whether or not you're running into it.

> In /var/log/messages I have 4 IPs:
> -IP_assigned to me
> -peers_IP
> -DNS_primary
> -DNS_secondary
> 
> What is the form of route command that I am supposed to run in order to 
> be able to go outside peers_ip ?

You shouldn't have to run any such command.

>  >- the peer's routing is broken (is this your ISP or some other
>  >          machine?)
> 
> Actually, I have a sprint cell phone with Vision on it, but from what I 
> read on the net, this should work, plus, I am positive it does connect, 
> because I see traffic on my cell (sending+receiving) when I do ping the 
> machine I am connected to.

OK, but that doesn't verify the default route or the DNS resolver
configuration.

>  >    - you have a misconfigured default route and/or local Ethernet
>            interface that is causing packets not to go through the PPP
>            link when they should.
> 
> This is may be the problem.

"netstat -nr", please.

>  >    - you're missing the "defaultroute" option.
> 
> I've got this.

OK.

>  >- you need to get DNS server addresses from your ISP -- either
>  >use the "usepeerdns" option and link /etc/resolv.conf to
>  >/etc/ppp/resolv.conf
> 
> How do I link /etc/resolv.conf to /etc/ppp/resolv.conf ?

Do this:

	# rm -f /etc/resolv.conf
	# ln -s /etc/ppp/resolv.conf /etc/resolv.conf

>  >*OR* create /etc/resolv.conf and add appropriate static addresses >there.
> 
> I did this.

If those addresses are correct, then you shouldn't have trouble with
DNS.  It's hard to tell, though.

There are many other possible problems.  If you can't get debug
output, I don't think anyone will be able to diagnose them for you.

Here's another random suggestion (since this is a cell phone): try
using the "default-asyncmap" option.

-- 
James Carlson                                  <carlson@workingcode.com>
