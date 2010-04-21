From: "Milan P. Stanic" <mps@arvanta.net>
Date: Wed, 21 Apr 2010 09:17:19 +0000
Subject: Re: CRC-16 or CRC-32
Message-Id: <20100421091719.GB1768@arvanta.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 2010-04-21 at 10:10, Jan Just Keijser wrote:
> ppp_async includes some CRC support BUT it only supports
> 'crc_ccitt_byte' which is a 16bit CRC. The problem now is, which
> CRC32 needs to be suppported? according to

CCITT versions according to the RFC1570.

>  http://en.wikipedia.org/wiki/Cyclic_redundancy_check
> 
> "there are three polynomials reported for CRC-12, thirteen
> conflicting definitions of CRC-16, and six of CRC-32"
> 
> the second problem is: if you want to add CRC32 support then you'd
> have to get it into the linux kernel . that will take *quite* some
> time (unless you can live with patched linux kernels).

It wouldn't be so hard to push it to the kernel because Paul Mackerras
is/was on this list and he is the ppp driver maintainer, I hope ;)

-- 
Kind regards,  Milan
--------------------------------------------------
Arvanta, IT Security        http://www.arvanta.net
Please do not send me e-mail containing HTML code.
