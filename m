From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 18:09:02 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404131400010.7674@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Tue, 13 Apr 2004, James Carlson wrote:

> Unfortunately, it's not that simple.  The Linux kernel version
> numbering is completely separate from ppp's version numbering.  Pppd
> runs on quite a few systems other than Linux (in fact, it ran on BSD
> systems *first*), so it's mostly confusing coincidence that the
> numbers look similar.
> 
> Look at README.linux in the ppp-2.4.1 source directory.
> 
> ppp-2.4.1 should support a 2.4.22 kernel just fine, so it's possible
> that this one module (ppp_generic.o) is stale or mangled, or that your
> kernel was compiled with an odd set of include files.

i've run through checking files and recompiling just to be on the safe 
side, and i'm pretty much out of ideas.

the user space PPP utils on both systems (embedded and fedora core laptop) 
are 2.4.1.  the kernel space PPP code is (internally) 2.4.2 on both.  
we're using the ELDK 3.0 PPC toolchain for cross-compiling everything
for the embedded system, kernel and utils included.

connecting with PPP both out of, and into, the laptop works fine.
it's only when i switch to using the embedded system as the client that
i get that maddening:

  Serial connection established.
  Couldn't get channel number: Invalid argument

as i understand it, this message represents some sort of
incompatibilty/mismatch between the user space PPP code and the kernel
code on the embedded system.  it has nothing to do with the server side,
since it hasn't even got that far, is that accurate?

like i said, i'm baffled.  the code versions suggest that they'd be 
compatible, both the user space code and the kernel were compiled with the
same cross-compiler, i'm pretty sure i've got the right kernel config
parameters for basic PPP.

i suspect it's time to just go drink heavily.  argh.


rday
