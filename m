From: James Cameron <james.cameron@hp.com>
Date: Thu, 15 Apr 2004 23:28:53 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <20040415232853.GA31737@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Apr 15, 2004 at 09:26:20AM -0400, Robert P. J. Day wrote:
> ok, i'll give that a shot.  and to clarify what someone suggested earlier, 
> we shouldn't be concerned that our user space PPP is version 2.4.1, while
> the kernel code is labelled as 2.4.2, right?

In theory it shouldn't be a problem.  I have evidence (from PPTP users)
that it doesn't work, but only in the context of the MPPE module, and
when the 2.4.1 version is a patched derivative of the mainstream 2.4.1.
Since I don't think you're using MPPE, I have no solid facts to report.

> someone else here just suggested downloading the 2.4.2 user space code,
> but based on what i read, i thought that that wouldn't make a big 
> difference.  is that a fair assessment?

It should not make a big difference, but it's certainly worth trying
just to exclude it as a wild possibility.  Bah, consumer engineering.
;-)

I've had a think after reviewing the ioctl() in sys-linux.c, and an
rgrep of kernel sources for 2.4.24 ... and wondering if instrumenting
the kernel would help to determine the cause of the failure.

drivers/net/ppp_async.c:1004 is the handler for the PPPIOCGCHAN ioctl,
in ppp_asynctty_ioctl().  Your manual pppd attempt showed an EINVAL,
which isn't a return that ppp_asynctty_ioctl() explicitly gives.  It
might return ENXIO (No such device or address), or EFAULT (Bad address),
or success.

But I'm not yet sure what calls ppp_asynctty_ioctl(), I haven't dug deep
enough.  Sorry.  Maybe the caller is returning EINVAL.

Have a look at /proc/tty/ldiscs to make sure ppp is mentioned there.  If
it is not, then ppp_async_init() has not run.  The ppp line is removed
if one types "rmmod ppp_async".

Another wild question; what's the architecture of the embedded system?

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
