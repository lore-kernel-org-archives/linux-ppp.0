From: Paul Mackerras <paulus@samba.org>
Date: Mon, 28 Jul 2008 12:27:56 +0000
Subject: Re: PPP source now in git
Message-Id: <18573.47948.220411.60756@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <18568.30079.527811.175235@cargo.ozlabs.ibm.com>
In-Reply-To: <18568.30079.527811.175235@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Marco d'Itri writes:

> Like CVS, the GIT tree too does not contain the same files of the
> official tarball releases.
> Can you delete them from the repository head?

Sure, done.

> BTW, some files in include/linux/ have diverged from the kernel
> versions, if they cannot be kept in sync maybe then they should be
> removed as well.

These days it should be possible to use the distros' versions for the
things in include/linux and include/net, I would think.  We do have
some definitions in those files that would need to be moved elsewhere,
though.

Paul.
