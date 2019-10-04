From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 04 Oct 2019 14:49:17 +0000
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <f274b8fb-d472-c66d-5bc7-6af229a5f1b1@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/04/19 10:29, Kurt Van Dijck wrote:
> I don't know a system where (a) or (b) are valid. My point is that such
> system could could exist, so I learned not to inspect the header files
> looking for a type, but inspect man-pages or specifications when looking
> for a type, and so time_t is defined in time.h.

I didn't just go trolling a grepping for time_t.  sys/time.h is pretty
well-established in UNIX, and I think you're punting when you point to
ANSI C alone as the authority here.

As for documentation, how does SUSv2 seem?

https://pubs.opengroup.org/onlinepubs/7908799/xsh/systime.h.html

> Now that I know that that file is used as include for kernel code, I'd
> rather include time.h in the userspace c-files.

My point is that include/net/ isn't strictly userspace.

If you feel the need, then go ahead and include <time.h> in user level
files.  This just isn't one of those.

If you must do this in ppp_def.h, then it needs to be guarded against
*all* of the systems where including a top-level header file inside a
kernel module is the wrong thing to do, not just "ifndef SOLARIS".  Do
you know which systems those are?  I can tell you that Solaris/Illumos
is at least one such system, but I can't tell you that it's *all* of them.

I think this include is out of place here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
