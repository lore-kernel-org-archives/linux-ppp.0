From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Wed, 03 Mar 2010 14:03:34 +0000
Subject: Re: some problem
Message-Id: <Pine.LNX.4.64.1003030900010.11862@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1267602954.2112.31.camel@rs.local>
In-Reply-To: <1267602954.2112.31.camel@rs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Wed, 3 Mar 2010, James Carlson wrote:

> This next part is strange, and I can't explain it.  It looks like pppd
> plows ahead even though the script obviously failed.  I don't know if
> this is a platform bug (is this UNIX or something else?), or if it's
> some sort of obscure problem in pppd.

I suspect a bug in pppd. I am using pppd over pppoe, using:

pty '/usr/sbin/pppoe -I eth1 -T 120 -U -m 1412 '

pppd ploughs ahead with LCP even when the pppoe command fails when it 
cannot find its peer:

pppoe: Timeout waiting for PADO packets

>
> Jan  1 00:02:22 (none) daemon.debug pppd[88]: device script returned: 768
> Jan  1 00:02:22 (none) daemon.info pppd[88]: Serial connection established.
>
> In any event, pppd should have aborted without attempting to run LCP.
> LCP is unlikely to be useful at all if the chat script fails.
>
>
