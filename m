From: mole <mole@quadra.ru>
Date: Fri, 11 Jun 2004 07:59:34 +0000
Subject: Re: pppd segfaults on AMD64 with ms-chap
Message-Id: <40C96666.5060606@quadra.ru>
List-Id: <linux-ppp.vger.kernel.org>
References: <40C59FC1.6070007@quadra.ru>
In-Reply-To: <40C59FC1.6070007@quadra.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



James Cameron wrote:

>Matt Domsch posted a patch to one of the PPTP mailing lists today that
>causes the MPPE module to use the in-kernel implementations of SHA1 and
>ARC4.  You might find that the existing kernel code is 64-bit clean.
>
>  
>
I have tried it (original patch) without any success. I get kernel oops 
on both 32 and 64 bit kernels.

>I'm sure we'd love to hear how it goes.
>  
>
Going to try his second patch version and let you know of the results.


Oleg Makarenko
