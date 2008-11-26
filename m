From: James Cameron <james.cameron@hp.com>
Date: Wed, 26 Nov 2008 22:06:39 +0000
Subject: Re: pptp failure
Message-Id: <20081126220639.GB3579@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W68317226172691227707264@webmail41>
In-Reply-To: <W68317226172691227707264@webmail41>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Nov 26, 2008 at 01:47:44PM +0000, tony.chamberlain@lemko.com wrote:
> Box B shows this from debug:
>   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x354ce8ff> <pcomp> <accomp>]
>   rcvd [LCP ConfReq id=0x1 <auth chap MS-v2> <mru 1460> <magic 0x99302d60>]
>   (then some more sent and receiveds)

Looks normal.  Nothing unusual.  I presume Box B is working fine?  You
didn't explicitly say.

> Box A just show repeat:
>   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xe58c245e> <pcomp> <accomp>]
>   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xe58c245e> <pcomp> <accomp>]
>   Script pptp X.X.X.X --nolaunchpppd  finished (pid 18300), status = 0x0
>   Modem hangup
>   Connection terminated.
> (I Xed out the actual VPN IP address which is the same as Box B).
> 
> So for some reason, Box A is not getting a response back.

This shows pppd is not receiving any data from the peer.  Without data,
pppd will not succeed.

Diagnose this further by verifying the arrival of GRE packets, protocol
47, on the network interface that the TCP port 1723 connection should
have established on.  If no packets arrive, then the problem is outside
your host.

> I see it is a different magic number.  Could that have anything to do
> with it?

No.  The magic numbers are random.

> After
> a short time it gets a SIGUSR:
>    pptpconfig: pppd process terminated by signal 16 (failed)
>    pptpconfig: SIGUSR1

Should not be relevant.  pptpconfig is deprecated, and I'm the author.
It is a PHP-GTK wrapper around pppd.  pptpconfig has several problems
that I'm not fixing, but I don't recall if any of them might cause this
symptom.  I suggest you try to exclude pptpconfig from your test.

> Any idea what is happening?  I did recently install cisco vpn client
> on Box A, but pptp was working after to that.

I don't know what the effect of that software is.

Suggest you also reveal version of pppd and version of pptp.

Reply CC mailing list.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
