From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Sun, 20 Jun 2004 03:29:11 +0000
Subject: Re: sha1 linux/mppe fix for 64-bit Linux
Message-Id: <20040619232911.2d4fa6d1@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040615124206.00006526@ma1033>
In-Reply-To: <20040615124206.00006526@ma1033>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Oleg, thanks for the reply.  I've been out of town all week and just
received your messages.  Responses inline.

On Wed, 16 Jun 2004 00:00:42 +0400
Oleg Makarenko <mole@quadra.ru> wrote:

> Hi Guy,
> 
> Guy Rouillier wrote:
> 
> >The major set of changes was to convert long data types to data types
> >with explicit length.  Basically, I changed longs to 32-bit data
> >values and unsigned chars to 8-bit values.  
> >
> 
> Do you really need to change unsigned char to u8? Does algorithm break

My reason for doing this was three-fold.  (1) In the later version of
this code I located from the original author, he had changed it like
that.  As long as I was going through all the code anyway, I figured I
would follow his example and make every data type explicit.  As you say,
it doesn't hurt anything.  (2) I wanted to make the kernel part and the
pppd part of the code parallel.  Because I made them all explicit in
one, I made them all explicit in the other.   Ease of maintenance.  (3)
I wanted to do everything in one pass.  Because it required a kernel
rebuild, I didn't want to do just some minimal part I thought would
work, only to find out it still generated a segfault or kernel panic. 
Then I'd have to make additional changes and rebuild the kernel again.

> 
> without that change? Or are to trying to preform some optimization?
> 
> While it doesn't hirt to change unsigned char to u8 and unsigned 
> int/long to u32 it only makes sense when the int/long size does
> matter.
> 
> int32_t i;
> 
> is not a good replacement for plain
> 
> int i;
> 
> it only makes reader wonder why in hell it does matter if i is only
> used in for (i = 0; i < 8; i++)
> 
> Agree?

For counters I agree.  But int is again an ambiguous data type.   Who
knows what subsequent changes may occur that cause incompatibilities
with a 32-bit integer?  I probably did go overboard, but it makes the
code more bulletproof.

> 
> For the  sha1.c code the only 4-bit unclean place is a macro
> definition for rol, blk0 and hence R0, R1 etc . These macros all
> expect 32-bits arguments (as you have found in your previous mails)
> 
> That is why the only needed change to make it work on AMD64 (and 
> hopefully not to break it on other platforms) is
> 
>  SHA1_Transform(unsigned long state[5], const unsigned char
>  buffer[64]){
> -    unsigned long a, b, c, d, e;
> +    u_int32_t a, b, c, d, e;
>      typedef union {
>         unsigned char c[64];
> -       unsigned long l[16];
> +       u_int32_t l[16];
>      } CHAR64LONG16;
>      CHAR64LONG16 *block;
> 
> (replace u_int32_t with u8 for linux code part).

I don't think this is sufficient. a,b,c,d,e are assigned values from
state[5], so those two data types should agree.  To use your example, a
subsequent programmer may wonder why you are using type-safe variables
but ambiguous parameters in the same function.

> 
> That is the change (see attachment for the patch) I use for several
> days without any problems.

That may be, but it is still ambiguous.

> 
> Why to change other (not broken) parts of code? Do you gain some 
> speed/size/other benefits with your unsigned char->u8 changes?

Again, consistency, ease of maintenance, eliminate ambiguity, respect
the original author.

> 
> >I also included a wrapper sha1()
> >function that I found in later versions of the code by the author,
> >Steve Reid.
> >  
> >
> 
> What is the point to define a new function sha1() that is never used
> in the code? Probably something else is missed from your patch?

Because the original author has introduced it, and the ppp authors may
choose to replace separate invocations of SHA1_Init(), SHA1_Update(),
SHA1_Final() with a single sha1() call.  Simple code/time saver where it
can be used.

> 
> It is better to read man etc for diff/patch usage but still here is a 
> quick guide.

Tried that, didn't help.  Tried asking for help, got none.

> 
> Try to get clean ppp code and save it to (say) ppp-cvs20040615/ 
> directory, make the directory copy to something like ppp.orig/, make
> all your changes in the ppp-cvs20040615/ directory (for both
> linux/sha1.* and pppd/sha1.*  files) and then run
> 
> diff -urN ppp.orig ppp-cvs20040615 > guy-x86_64.patch

Thanks, that's essentially what I did.

> 
> Hope that helps
> 
> And in case you've missed it there is a patch on pptp-devel list to
> get rid of sha1.c in kernel code. This patch doesn't work for me so I
> still use a trivial fix to sha1.c but it seems the way to go. Did you
> try it?

No, because I knew changes were required in two places, and others had
already said the patch didn't work for them, I didn't try it.  I was
under time pressure to get it working.

One question for you if I may.  Do you know why multiple data type
systems have been introduced?  For example, the kernel code uses u32
while the pppd code uses u_int32_t.  Why not pick one and use it
everywhere?

> 
> regards,
> Oleg
> 
> 


-- 
Guy Rouillier


-- 
Guy Rouillier
