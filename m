From: James Cameron <james.cameron@hp.com>
Date: Mon, 28 Apr 2008 01:27:45 +0000
Subject: Re: Re: Re: how to use compress modul in ppp process
Message-Id: <20080428012745.GD4399@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200804250001085508333@gmail.com>
In-Reply-To: <200804250001085508333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, Apr 26, 2008 at 08:10:50PM +0800, C.J wrote:
> Charlie wrote:
> >Do you have a good reason for apparently ignoring my statement that MPPC 
> >is usually not supported by the ppp modules in the kernel? Are you quite 
> >sure that your kernel (or kernel modules) has been specifically patched to 
> >support MPPC? If not, you cannot use MPPC, not matter how you configure 
> >your client.
> Really? But in my machine(which kernel is 2.6, Debian system) has
> ppp_mppe module but no any patch.

Debian kernels do not have MPPC support, because of (a) kernel.org
kernel does not have MPPC support, and (b) the patent issue.

The ppp_mppe module provides MPPE support, not MPPC support.

> Also has other compress module such as bsd_comp, deflate.

This is not relevant.

> Does this mean that kernel support it and I can use it? 

No.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
