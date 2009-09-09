From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Wed, 09 Sep 2009 13:21:13 +0000
Subject: Re: several sites through router
Message-Id: <Pine.LNX.4.64.0909090920180.24657@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W286594864216051252429162@webmail32>
In-Reply-To: <W286594864216051252429162@webmail32>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Wed, 9 Sep 2009, tony.chamberlain@lemko.com wrote:

> Will openvpn allow you to assign IP address by user id?

This is not the right place to be asking questions about openvpn. Please 
read the documentation, and find the appropriate support forum.

> I mean its true now that when I make the pppd call I can specify
> (request) what address I want, but it would be nice if the server could
> do the assigning.  Clients do rely on receiving the same IP address.
> (I mean the same one, but each client gets a different IP).
>
> -----Original Message-----
> From: James Cameron [mailto:quozl@laptop.org]
> Sent: Tuesday, September 8, 2009 08:12 PM
> To: linux-ppp@vger.kernel.org
> Subject: Re: several sites through router
>
> This has nothing to do with pppd, but is a common problem with pptp,
> in future ask on the pptpclient-devel mailing list instead.  Or even the
> poptop (pptpd) mailing list.
>
> Since I'm there anyway ... what you describe is a failure of the router
> to use a unique call identifier when it readdresses the packets, or a
> failure of the pptpd at the remote site to demultiplex the PPP over GRE
> stream.
>
>> Now I have control of all the machines, clients and server, and they
>> are all running poptop available through CentOS 4.5.
>
> You should use OpenVPN instead then.
>
>
