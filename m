From: Paul Mackerras <paulus@samba.org>
Date: Tue, 05 Jun 2012 22:35:30 +0000
Subject: Re: Upcoming 2.4.6 release
Message-Id: <20120605223530.GA8758@bloggs.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20120602100037.GE17089@pale.ozlabs.ibm.com>
In-Reply-To: <20120602100037.GE17089@pale.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Jun 05, 2012 at 08:02:39PM +0300, Daniel Golle wrote:

> I guess you are aware of
> https://dev.openwrt.org/browser/trunk/package/ppp/patches
> 
> Just as I haven't encountered any of them on git://ozlabs.org/~paulus/ppp.git
> 
> Most of them make sense and apply cleanly, few are OpenWrt-specific.
> 
> I'd suggest importing:

The problem with distro patches like this is that they very often
don't have any authorship information, sign-off or a decent patch
description.  Unless a patch is really trivial I need to know who the
author is and that the author gives permission for me to include it.
Without a decent patch description I have to reverse-engineer why
the changes are being made, which is often not at all obvious.  For
example, what's the use case for 100-debian_ip-ip_option.patch?
What are the circumstances where 101-debian_close_dev_ppp.patch would
find a ppp_fd already open?  And so on.

I see that several of the patches on that page have a sign-off from
Philip Prindeville, so presumably he wrote them and can give me a nod
to include them.  Philip?

Paul.
