From: Bernard Blackham <bernard@blackham.com.au>
Date: Tue, 02 Mar 2004 23:13:08 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040302231308.GW6033@amidala.blackham.com.au>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

A while ago, Pasi wrote:
> > > > > There's still the MTU bug (with MPPE) left..

> > What bug is that?

> I've sent couple of mails about this.. I'll explain it below.

> Now, the problem is, that the web-server is already sending packets which
> have *right* size (the size client told), but the pptp-server rejects them
> because of the ppp-interface MTU is too low (in the pptp server). 
> 
> pppd/ccp.c near line 1192:
> 
> mtu = netif_get_mtu(f->unit);
> if (mtu)
>     netif_set_mtu(f->unit, mtu - MPPE_PAD);
> else
>     newret = CONFREJ;
> 
> MPPE_PAD is defined as 4.
> 
> 
> The pptp client sets the MTU to x (for example 1400), and the pptp server sets 
> the MTU to x-4 (1396). This obviously happens only when using MPPE.
> 
> The pptp-client is not able to load the web page at all, because the client
> doesn't receive any data from the web server! the pptp-server rejects the
> incoming (http) packets.
> 
> This does not happen with all web sites.

Just a metoo message - I've been experiencing the exact same
problems here. We have a poptop server serving over 100 concurrent
connections and many users have noted that they weren't able to
access the campus website.

The campus website is behind a Cisco load balancer, so this may be a
suspect in breaking PMTU. Disabling the above lines of code also
solved the problem here though and we've had few complaints since.

Regards,

Bernard.

-- 
 Bernard Blackham <bernard at blackham dot com dot au>
