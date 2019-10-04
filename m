From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 04 Oct 2019 18:33:23 +0000
Subject: Re: [PATCH] time.h: include header before using time_t
Message-Id: <20191004183323.GB868@x1.vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191004174046.GA868@x1.vandijck-laurijssen.be>
In-Reply-To: <20191004174046.GA868@x1.vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 13:52:11 -0400, James Carlson wrote:
> On 10/04/19 13:40, Kurt Van Dijck wrote:
> > I think you confirm 4x what I said, but I probably expressed myself
> > badly, so "show me code!", I created this patch.
> > It (1) works for me and (2) does not mix userspace headers in kernel
> > space anywhere.
> > Would this work for you?
> 
> That seems ok, in as much as it compiles on Solaris.  But I'm still a
> little confused about your apparent opposition to <sys/time.h> at the
> point where time_t is actually used.
> 
> <sys/time.h> is part of the UNIX standards.  It's documented to define
> time_t (among other things).  It's on-point for a header file that may
> be used in kernel context.  What's the concern?

headers under sys/ are, AFAIK, not delivered by the kernel, but by the
toolchain. sys/time.h may have less issues than time.h, it has the same
disease.

But maybe I'm incompetent on the matter, my knowledge besides linux on
this matter is very limited.

Kurt
