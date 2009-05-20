From: Marcus Better <marcus@better.se>
Date: Wed, 20 May 2009 08:50:01 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <gv0g7t$2qk$1@ger.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

James Cameron wrote:
> Are you verifying in your chatscript that the modem is attached to the
> network before attempting to dial?
> 
> #
> # cease if modem is not attached to network yet
> ABORT '+CGATT: 0'
> '' AT+CGATT?

No. That would just fail if it is not attached, right? So it's not much 
better than the current situation.

> All three logs you provided in this post showed successful connection.
> What makes you think it failed?

You will notice that only the second one has these lines:

May 19 20:36:04 better pppd[11280]: primary   DNS address 80.251.192.244
May 19 20:36:04 better pppd[11280]: secondary DNS address 80.251.192.245

Cheers,

Marcus

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoTxDkACgkQXjXn6TzcAQmhPQCeMYbso7qbkoaBzMr/eS/tLi5k
Zh0AoK0M0Mw9te2n8/5m9vVj3Sdf4nKT
=Ct5H
-----END PGP SIGNATURE-----


