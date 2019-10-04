From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 04 Oct 2019 17:52:11 +0000
Subject: Re: [PATCH] time.h: include header before using time_t
Message-Id: <d5c7a914-6e48-e4a7-3d6b-11807872ea5b@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191004174046.GA868@x1.vandijck-laurijssen.be>
In-Reply-To: <20191004174046.GA868@x1.vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/04/19 13:40, Kurt Van Dijck wrote:
> I think you confirm 4x what I said, but I probably expressed myself
> badly, so "show me code!", I created this patch.
> It (1) works for me and (2) does not mix userspace headers in kernel
> space anywhere.
> Would this work for you?

That seems ok, in as much as it compiles on Solaris.  But I'm still a
little confused about your apparent opposition to <sys/time.h> at the
point where time_t is actually used.

<sys/time.h> is part of the UNIX standards.  It's documented to define
time_t (among other things).  It's on-point for a header file that may
be used in kernel context.  What's the concern?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
