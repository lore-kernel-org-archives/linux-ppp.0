From: tony.chamberlain@lemko.com
Date: Wed, 09 Sep 2009 12:51:41 +0000
Subject: Re:  several sites through router
Message-Id: <W60632244199201252500701@webmail44>
List-Id: <linux-ppp.vger.kernel.org>
References: <W286594864216051252429162@webmail32>
In-Reply-To: <W286594864216051252429162@webmail32>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Will openvpn allow you to assign IP address by user id?
I mean its true now that when I make the pppd call I can specify
(request) what address I want, but it would be nice if the server could
do the assigning.  Clients do rely on receiving the same IP address.
(I mean the same one, but each client gets a different IP).

-----Original Message-----
From: James Cameron [mailto:quozl@laptop.org]
Sent: Tuesday, September 8, 2009 08:12 PM
To: linux-ppp@vger.kernel.org
Subject: Re: several sites through router

This has nothing to do with pppd, but is a common problem with pptp,
in future ask on the pptpclient-devel mailing list instead.  Or even the
poptop (pptpd) mailing list.

Since I'm there anyway ... what you describe is a failure of the router
to use a unique call identifier when it readdresses the packets, or a
failure of the pptpd at the remote site to demultiplex the PPP over GRE
stream.

> Now I have control of all the machines, clients and server, and they
> are all running poptop available through CentOS 4.5.

You should use OpenVPN instead then.

-- 
James Cameron
http://quozl.linux.org.au/
--
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



