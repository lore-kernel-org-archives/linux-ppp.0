From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 17:00:10 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404131258310.10875@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Tue, 13 Apr 2004, James Carlson wrote:

> Robert P. J. Day writes:
> > "Couldn't get channel number: Invalid argument"?  that sounds like a
> > fundamental problem at the kernel level, where the kernel itself is unable
> > to allocate something critical for PPP.
> 
> Yes.  It means that the kernel rejected the PPPIOCGCHAN ioctl on
> /dev/ppp.  This implies that the kernel's PPP driver implementation is
> very far out of sync with the version of user space code in use, or is
> otherwise damaged in some way.

ok, that might make sense.  the kernel we're using for the embedded system
is a hacked version of 2.4.22-pre8, in which the PPP files have internal
version numbers of 2.4.2.

the user space code on the system is, OTOH, ppp-2.4.1.  is that enough of
a mismatch to be causing all this grief?  i can fairly quickly upgrade to 
the user space 2.4.2 stuff if that's the obvious problem.

rday
