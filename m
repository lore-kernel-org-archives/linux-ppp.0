From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Tue, 06 Apr 2010 16:47:20 +0000
Subject: Re: pppd fails when init connection with kernel 2-6-28.10
Message-Id: <Pine.LNX.4.64.1004061245250.9013@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <28152335.post@talk.nabble.com>
In-Reply-To: <28152335.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Tue, 6 Apr 2010, Sonia Martinez wrote:

> I was using linux kernel 2.6.22 with pppd 2.4.4 in an embedded hardware
> (powerpc architecture) with a GPRS serial module. I was able to make a GPRS
> connection, but now I've upgraded kernel version to 2-6-28.10 and pppd to
> 2.4.5 and it doesn't work. These are the log messages after sending the
> ATD*99***1# command, when pppd is started:
>
> 2000/03/21,18:51:26  daemon.warn pppd[772]: Warning: couldn't open ppp
> database /var/run/ppp/pppd2.tdb
> 2000/03/21,18:51:26 daemon.notice pppd[772]: pppd 2.4.5 started by root, uid
> 0
> 2000/03/21,18:51:26 daemon.err pppd[773]: Fatal signal 11
> 2000/03/21,18:51:26 daemon.info pppd[773]: Exit.
...
>
> Has somebody the same problem with this kernel? I've tested the 2.4.4 and
> has the same problem, so I guess is the kernel version.

http://en.wikipedia.org/wiki/Signal_11

The problem is not the kernel - you either have faulty hardware, or a bug 
in pppd, or in one of the libraries it uses (or in the compiler you are 
using).
