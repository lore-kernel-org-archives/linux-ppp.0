From: James Cameron <quozl@laptop.org>
Date: Wed, 09 Sep 2009 01:12:16 +0000
Subject: Re: several sites through router
Message-Id: <20090909011216.GE16084@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <W286594864216051252429162@webmail32>
In-Reply-To: <W286594864216051252429162@webmail32>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

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
