From: Chris Wilson <chris@netservers.co.uk>
Date: Fri, 30 Jan 2004 10:32:59 +0000
Subject: Re: RFC: PPP MPPE merge into kernel 2.6
Message-Id: <Pine.LNX.4.44.0401301027210.26479-100000@chris.camcom.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130040026.GI2306@hp.com>
In-Reply-To: <20040130040026.GI2306@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

> I'd like to open a discussion on the merge of the PPP MPPE support with
> kernel 2.6.  What can be done to achieve it?  What is hindering it?
> What can we do to remove the roadblocks?

Sounds like an excellent idea, but it may be too late to have anything 
other than bug fixes merged into 2.6. 2.7/2.8 should be possible, though.

I think there is a strong argument for the support being in the kernel,
given the number of other devices that have to support it, the obvious
end-user demand (witness pptpclient and poptop :-) and the hassle for
users of finding the right patch and patching their kernels (given the
patch confusion which exists). Some users are having problems with
patching due to failed hunks, and Joe Bloggs shouldn't have to worry about 
that.

Let's go for it :-) What do we have to lose?

Cheers, Chris.
-- 
_  __ __     _
 / __/ / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_  ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\__/_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |

