From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 04 Oct 2019 14:29:00 +0000
Subject: Re: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <20191004142900.GC22901@x1.vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 08:52:12 -0400, James Carlson wrote:
> On 10/04/19 06:49, Kurt Van Dijck wrote:
> >> IMHO time_t is defined in sys/types.h
> > 
> > http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf
> > chapter 7.23.1.3
> > 
> 
> I believe that covers userland environments, not the kernel.
> 
> At least on Solaris (and its derivatives, such as Illumos), the symbols
> available in the kernel are defined in sys/ (or net/, netinet/, or
> similar for network bits).  The top-level header files are for userland
> libraries.  Userland libraries are not accessible within the kernel.
> 
> In this case, the common net/ppp_defs.h file is used by both user-level
> code (pppd itself) and by several kernel modules.

I see.

> 
> There may be systems on which including <time.h> within a kernel module
> is harmless (I suspect Linux is one), but I have a hard time believing
> that it's correct to do so.

You're right that the kernel code does not __necessarily__ use the same thing.
What matters here is that all kernel code must use the same thing.

> 
> Do you know of a system where either (a) <sys/time.h> does not exist or
> (b) it exists but does not define 'time_t'?  I haven't been able to find
> a system that matches either case.  I tried several flavors of Linux,
> AIX, Solaris, HP/UX, and IBM USS on z/OS.

I don't know a system where (a) or (b) are valid. My point is that such
system could could exist, so I learned not to inspect the header files
looking for a type, but inspect man-pages or specifications when looking
for a type, and so time_t is defined in time.h.

Regardless of those systems, you look for 1 header that suits userspace
and solaris kernel. Isn't that a bit ... strange.

Now that I know that that file is used as include for kernel code, I'd
rather include time.h in the userspace c-files.

Kurt
