From: Oleg Makarenko <mole@quadra.ru>
Date: Sun, 20 Jun 2004 18:37:59 +0000
Subject: Re: sha1 linux/mppe fix for 64-bit Linux
Message-Id: <40D610F4.1060607@quadra.ru>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040615124206.00006526@ma1033>
In-Reply-To: <20040615124206.00006526@ma1033>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Guy,

If you want to replace sha1.c with something more 64bit clean and feel 
that simple fix is not enough start from what seems to be the better 
(newer?) version at http://sea-to-sky.net/~sreid/sha1.c

As you can see from the above link the code was patched for 16bits and 
64bits machines.

You only need to change uint32 to posix's u_int32_t etc to use typedefs 
from system or ppp include files and get rid of main().

Then it could be dropped in instead of current sha1.c. Btw the uintNN 
changes are from Alpha guy.

>No, because I knew changes were required in two places, 
>
>and others had
>already said the patch didn't work for them, 
>
Probably it was only me :)

>I didn't try it.  I was
>under time pressure to get it working.
>  
>
The latest version works for me on both 32 and 64 bit kernels. The patch 
makes mppe code to use kernel's sha1 and arc4 implementations.

For user mode part we use something similar here and link pppd with 
libcrypto and change ms_chap.c with

#ifdef USE_OPENSSL_SHA1
#include <openssl/sha.h>
#define SHA1_SIGNATURE_SIZE SHA_DIGEST_LENGTH
#define SHA1_CTX SHA_CTX
#else
#include "sha1.h"
#endif

So we don't use ppp's sha1 implementation any more and that is why I 
don't care on how clean sha1.c is and think the simplest fix is enough.

>One question for you if I may.  Do you know why multiple data type
>systems have been introduced?  
>

No, I don't know. But I believe they are parts of different standards or 
conventions.

>For example, the kernel code uses u32
>while the pppd code uses u_int32_t.  Why not pick one and use it
>everywhere?
>  
>
and kernel also has __u32.  Others have u_int, uint, WORD, DWORD etc.

u32 and friends are linux specific, u_int32_t and alikes are from POSIX.

And "official" (C99) way is actually uint32_t. The "problematic" 
variables in sha1.c code could be declared as uint_least32_t in C99.

regards,
Oleg

