From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Wed, 09 Jun 2004 05:48:34 +0000
Subject: Re: 2.4.2 on AMD64 Linux: assumes 4-byte long - FIXED!
Message-Id: <20040609014834.36c0540a@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040606021936.14c69b54@localhost>
In-Reply-To: <20040606021936.14c69b54@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Sorry for the top post, it's late and I'm tired and I'm replying to my
own message anyway.  I fixed this problem, and I'm now able to use
pptp/ppp/mppe to connect to a Microsoft server at work.   The fix
requires changes to the sha1 code both in ppp-2.4.2 and in the kernel. 
To whom should I send the fixes?  This is my first kernel fix so I don't
really know how to proceed.   Hmm, I guess half the fixes go to the ppp
maintainers and the other half go to the kernel people.

On Sun, 6 Jun 2004 02:19:36 -0400
Guy Rouillier <guy-rouillier@speakeasy.net> wrote:

> I'm new here.  I hope this is the right place to post this question;
> please point me to the correct place if I've gotten it wrong.  I've
> been trying to get 2.4.2 working on Mandrake 10.0 for AMD64, using
> kernel 2.6.3.  I've downloaded this version, along with a
> corresponding 1.4.0 version of pptp, from the pptp-client site.  I'm
> getting a "Fatal signal 11", which I've traced to the SHA1_Final
> function on sha1.c during CHAP Challenge phase of connection setup.
> 
> Looking in sha1.h and sha1.c source code, I see data structures and
> functions with longs in them, which sets off alarms.  I think there
> was an assumption when this code was written that a long is 4 bytes
> long. On an AMD64 64-bit OS, a long is 8 bytes.  What leads me to
> think this is #define in sha1.c:
> 
> #define rol(value, bits) (((value) << (bits)) | ((value) >> (32 -
> (bits))))
> 
> Clearly, on a 64-bit long, this won't produce a correct rotate-left.  
> I've googled on sha1.c, and I've found several instances where the
> code has switched to using u_int32 instead of long, including one by
> the same author (Steve Reid) here:
> 
> http://cvsweb.stop1984.com/index.cgi/entropy/src/sha1.c?rev=1.12&content-type=text/x-cvsweb-markup
> 
> As a test, I tried simply changing all the longs to ints in sha1.h and
> sha1.c.  Unfortunately, I went from getting segfaults to getting
> kernel panics.  I'm suspecting this is not a valid thing to do, since
> the corresponding files that the kernel was built from still have long
> declarations.  I'm guessing these need to match, correct?  Or is pppd
> standalone, and can I change sha1.c/h without worrying about the
> kernel(which I compiled myself from Mandrake sources)?
> 
> I also tried simply changing the definition of rol above to use 64
> instead of 32.  Predictably, that didn't work.
> 
> I'm not an expert in networking.  I'd appreciate any and all
> suggestions anyone can provide to get this working.  Thanks.
> 
> -- 
> Guy Rouillier
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Guy Rouillier


-- 
Guy Rouillier
