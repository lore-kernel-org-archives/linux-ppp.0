From: James Carlson <carlson@workingcode.com>
Date: Tue, 13 Apr 2004 17:07:31 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <16508.7763.247617.592624@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> ok, that might make sense.  the kernel we're using for the embedded system
> is a hacked version of 2.4.22-pre8, in which the PPP files have internal
> version numbers of 2.4.2.
> 
> the user space code on the system is, OTOH, ppp-2.4.1.  is that enough of
> a mismatch to be causing all this grief?  i can fairly quickly upgrade to 
> the user space 2.4.2 stuff if that's the obvious problem.

Unfortunately, it's not that simple.  The Linux kernel version
numbering is completely separate from ppp's version numbering.  Pppd
runs on quite a few systems other than Linux (in fact, it ran on BSD
systems *first*), so it's mostly confusing coincidence that the
numbers look similar.

Look at README.linux in the ppp-2.4.1 source directory.

ppp-2.4.1 should support a 2.4.22 kernel just fine, so it's possible
that this one module (ppp_generic.o) is stale or mangled, or that your
kernel was compiled with an odd set of include files.

-- 
James Carlson                                  <carlson@workingcode.com>
