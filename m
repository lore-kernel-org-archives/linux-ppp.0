From: carlsonj@workingcode.com
Date: Fri, 15 Oct 2004 19:02:56 +0000
Subject: Re: Problem with interface ppp0
Message-Id: <16752.7904.120089.150959@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
In-Reply-To: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Tomas Vadfors writes:
> Oct 15 00:26:18 Rohan pppd[2054]: Cannot determine ethernet address for 
> proxy ARP

That means that you have the "proxyarp" option in your configuration,
and you probably shouldn't.  If this log is not from the dial-in
server system (and it looks like it's not), then "proxyarp" isn't
right at all.

Beyond the warning message, though, it doesn't hurt.

> Oct 15 00:26:18 Rohan pppd[2054]: local  IP address 82.96.24.131
> Oct 15 00:26:18 Rohan pppd[2054]: remote IP address 82.96.24.3

That looks like a good PPP link.  Whatever's going wrong here, I don't
think that it's a PPP problem.

> and it output the following (into ppplog) after I tried as a normal user. 
> Note that
> I now had the "noauth" option in /etc/ppp/options
> 
> Oct 15 00:29:25 Rohan kdm_greet[2198]: Can't open default user face
> Oct 15 00:30:39 Rohan pppd[2315]: using the noauth option requires root 
> privilege

Perhaps 'pppd' itself isn't owned by root or doesn't have the setuid
bit on it.  It should.  Or you have 'noauth' in some unprivileged
location as well.  You need to have it in a privileged location, *IF*
you use it at all.

The fact that you need to use it, though, points out that you may well
have other problems.  Do you have a default route?  You almost
certainly should not, if this PPP link is dialing into your ISP.
Instead, you should have the "defaultroute" option in /etc/ppp/options
(or /etc/ppp/peers/*, as that's privileged as well) and pppd will
establish the default route when the link is up.

> >Note also the line
> >"Error opening resolv.conf"
> >Have you checked that /etc/resolv.conf is readable by all?
> >That it even exists?
> 
> Yep. It's a link to some other file. I think that is readable by all...

What other file?

Are the contents correct?

-- 
James Carlson                                 <carlsonj@workingcode.com>
