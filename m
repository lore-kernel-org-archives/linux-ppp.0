From: Peter Hurley <peter@hurleysoftware.com>
Date: Wed, 12 Mar 2014 14:04:10 +0000
Subject: Re: Suspecting kernel timing bug in ppp or tty drivers
Message-Id: <5320695A.2070503@hurleysoftware.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B180258@post.tritech.se> <20140310194007.GC3392@kroah.com> <ED3E0BCACD909541BA94A34C4A164D4C5B180A77@post.tritech.se> <20140311185019.GA32618@kroah.com> <Pine.LNX.4.64.1403120452230.17831@yossarian>
In-Reply-To: <Pine.LNX.4.64.1403120452230.17831@yossarian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: terry white <twhite@aniota.com>
Cc: linux-ppp@vger.kernel.org, linux-serial@vger.kernel.org, =?UTF-8?B?TWF0cyBLw6Rycm1hbg==?= <Mats.Karrman@tritech.se>, Greg KH <gregkh@linuxfoundation.org>

On 03/12/2014 08:14 AM, terry white wrote:
>     my reading of this 'thread' suggests that "pppd" and/or "serial" have
> started "DEMANDING" bleeding edge kernel versions.  if that 'correct', for
> me anyway, it's going to prove problematic.  that aside, it doesn't seem
> like the most elegant solution, to problems it's meant to address ...

There have been _hundreds of changes_ to the tty core since 3.2, many
to specifically fix the type of error reported.

Very few of these changes are trivial; there are at least a dozen patchsets
with 10 or more patches. I doubt these will ever be backported to -stable;
the changes are just too extensive.

It makes sense to establish if these changes have indeed fixed the observed
error already or if more in-depth debugging is necessary to uncover the root
cause.

Regards,
Peter Hurley

