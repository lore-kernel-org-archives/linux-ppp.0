From: James Carlson <carlson@workingcode.com>
Date: Tue, 13 Apr 2004 16:44:53 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <16508.6405.195808.156097@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> "Couldn't get channel number: Invalid argument"?  that sounds like a
> fundamental problem at the kernel level, where the kernel itself is unable
> to allocate something critical for PPP.

Yes.  It means that the kernel rejected the PPPIOCGCHAN ioctl on
/dev/ppp.  This implies that the kernel's PPP driver implementation is
very far out of sync with the version of user space code in use, or is
otherwise damaged in some way.

> any hints as to what that error message means, and how to fix it, while
> i'm hunting?

Find out what kernel version is in use and what user space bits are in
use.  There's a mismatch somewhere.

> p.s.  thanks loads for the help thus far, i'm feeling a bit out of my 
> depth at the moment.  historically, i remember it being so much easier to 
> configure PPP, but i wasn't working with a single-board computer running
> embedded linux at the time. :-P

It shouldn't be so hard ... :-/

-- 
James Carlson                                  <carlson@workingcode.com>
