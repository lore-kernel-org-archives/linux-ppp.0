From: carlsonj@workingcode.com
Date: Thu, 30 Sep 2004 17:33:51 +0000
Subject: Re: counters overflow
Message-Id: <16732.17279.778971.646668@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <262655318.20040929092029@rsl.ru>
In-Reply-To: <262655318.20040929092029@rsl.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul Mackerras writes:
> I think I will make pppd maintain the upper 32 bits of a count in
> userspace, by having it wake up periodically and poll the 32-bit
> counters from the kernel and see if they have wrapped.

Yuck.  How often would you need to poll?

We solved the problem on Solaris by having the kernel implement both a
PPPIO_GETSTAT ioctl and a new PPPIO_GETSTAT64 ioctl.  The former still
returns 32 bit counters to applications that want them.  The latter
uses 64 bit counters.  In the user space, we call PPPIO_GETSTAT64
first, and if that fails, fall back to PPPIO_GETSTAT.

I'd expect that the same sort of thing would work fine on Linux as
well.

-- 
James Carlson                                 <carlsonj@workingcode.com>
