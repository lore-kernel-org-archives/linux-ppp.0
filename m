From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Wed, 09 Jun 2004 05:38:26 +0000
Subject: Re: pppd segfaults on AMD64 with ms-chap
Message-Id: <20040609013826.6d567100@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <40C59FC1.6070007@quadra.ru>
In-Reply-To: <40C59FC1.6070007@quadra.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 08 Jun 2004 15:15:13 +0400
mole <mole@quadra.ru> wrote:

> I am new to this list, sorry if this problem is already solved.
> 
> I have tried to use pptp on fedora Core 2 for AMD64 and found that
> pppd segfaults on my machine when ms-chap is in use.

I just reported this same bug to the list two days ago.  See "2.4.2 on
AMD64 Linux: assumes 4-byte long".  I haven't gotten any replies yet, so
I'm going to try making the changes I found at the link I provided. 
Unfortunately, the version of sha1.c in the kernel has the same bug in
it, so I'm going to have to rebuild the kernel.  I tried just rebuilding
pppd, and that resulted in a kernel panic.  More changes are required
than your patch includes; for example, the SHA1_CTX structure itself
must be modified.

> 
> If pppd is compiled with openssl's sha then pppd doesn't segfault on 
> authentication but mppe-enabled kernel then gives me oops in mppe sha
> code.
> 
> The same kernel/pppd work fine in 32 bit mode.
> 
> The problem proved to be in the broken sha1 implementation that
> assumes that unsigned long is 32-bit wide.
> 
> The quick/minimal change to make it all work in 64-bit mode is in the 
> attached patch. But it looks like the code needs more cleanups to make
> 
> it obviously 64-bit safe.
> 
> Best,
> Oleg Makarenko
> 
> 
> 
> 
> 
> 
> 


-- 
Guy Rouillier


-- 
Guy Rouillier
