From: James Cameron <james.cameron@hp.com>
Date: Mon, 02 Feb 2004 22:16:38 +0000
Subject: Re: RFC: PPP MPPE merge into kernel 2.6
Message-Id: <20040202221638.GA5522@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130040026.GI2306@hp.com>
In-Reply-To: <20040130040026.GI2306@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Feb 02, 2004 at 12:43:29PM +0200, Pasi K?rkk?inen wrote:
> Should the MPPC support (by Jan Dubiec) be included as well?
> http://www.polbox.com/h/hs001/

I don't think so, due to the software patent issue.  While my personal
belief differs, while working for HP I am constrained to follow patents.

> It also contains some additions to the MPPE support.

Yes, 56-bit keys.  I haven't found any demand for that.  The options are
also slightly different, though that would be easy to ignore.

Jan's work though looks robust and thorough.  Having the work hosted
like that, with current patches for all current kernels, is more than
Frank is doing.  ;-)

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
