From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 04 Oct 2019 20:10:38 +0000
Subject: Re: [PATCH] time.h: include header before using time_t
Message-Id: <2342bac3-8759-d98b-631e-3c0d760e1126@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191004174046.GA868@x1.vandijck-laurijssen.be>
In-Reply-To: <20191004174046.GA868@x1.vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/04/19 14:33, Kurt Van Dijck wrote:
> On vr, 04 okt 2019 13:52:11 -0400, James Carlson wrote:
> headers under sys/ are, AFAIK, not delivered by the kernel, but by the
> toolchain. sys/time.h may have less issues than time.h, it has the same
> disease.

I've never heard of this problem.  I'm afraid I don't know what you're
referring to.

I've never heard of a compiler (or other tool chain component) that
delivers files to /usr/include/sys.  That'd be somewhat surprising to
me, but I guess it's a wide world out there.

As the name says, the stuff under sys/ is part of the _system_.  On
UNIX, the standard parts of it are described in the Single UNIX
Standard, maintained by The Open Group.  That's the documentation
pointer I provided previously.

Are there systems where system header files aren't installed by default?
 Sure.  That's somewhat commonplace.  But on such a machine you can't
compile things (including pppd) until you install the (presumably
optional) header files.

If you look closely, you'll see that pppd/main.c already includes
<sys/time.h> and it's not guarded by any conditional compilation because
it's a *STANDARD HEADER FILE*.  If there were problems of some sort with
this include file, I'd expect they'd have surfaced by now.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
