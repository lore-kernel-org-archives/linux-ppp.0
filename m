From: Paul Mackerras <paulus@samba.org>
Date: Sun, 19 Aug 2007 03:45:44 +0000
Subject: Re: [patch 06/14] make sure that the linkpidfile is always created
Message-Id: <18119.48360.784999.623669@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070819014009.321424748@bongo.bofh.it>
In-Reply-To: <20070819014009.321424748@bongo.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Marco d'Itri writes:

> Subject: [patch 06/14] Bug#284382: ppp: linkpidfile is not created upon detachment
> From: <herbert@gondor.apana.org.au>
> 
> Package: ppp
> Version: 2.4.2+20040428-2
> Severity: wishlist
> 
> When pppd detaches from the parent normally, that is, without nodetach
> or updetach set, the linkpidfile is not created even when linkname is
> set.
> 
> This is because the create_linkpidfile call in detach() is only made
> if the linkpidfile is filled in.  However, linkpidfile is never filled
> in until create_linkpidfile has been called.
> 
> IMHO the call should be made uncondtionally in detach() since
> create_linkpidfile does its own check on linkname anyway.

There is an unconditional call to create_linkpidfile in main() at line
475.  The call in detach is only there to rewrite the file in the case
where it has already been created by the parent and needs to be
updated to reflect the new process ID after detaching (since detaching
involves a fork).

> Please note that the version of pppd in woody always wrote the
> linkpidfile after detaching.  It did so in main() however.  That
> call has now been removed which is why I'm seeing this problem.

It's still there in my version.  Was it a debian-specific patch that
removed it, perhaps?

Paul.
