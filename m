From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Sun, 06 Jun 2004 06:19:36 +0000
Subject: 2.4.2 on AMD64 Linux: assumes 4-byte long
Message-Id: <20040606021936.14c69b54@localhost>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm new here.  I hope this is the right place to post this question;
please point me to the correct place if I've gotten it wrong.  I've been
trying to get 2.4.2 working on Mandrake 10.0 for AMD64, using kernel
2.6.3.  I've downloaded this version, along with a corresponding 1.4.0
version of pptp, from the pptp-client site.  I'm getting a "Fatal signal
11", which I've traced to the SHA1_Final function on sha1.c during CHAP
Challenge phase of connection setup.

Looking in sha1.h and sha1.c source code, I see data structures and
functions with longs in them, which sets off alarms.  I think there was
an assumption when this code was written that a long is 4 bytes long. 
On an AMD64 64-bit OS, a long is 8 bytes.  What leads me to think this
is #define in sha1.c:

#define rol(value, bits) (((value) << (bits)) | ((value) >> (32 -
(bits))))

Clearly, on a 64-bit long, this won't produce a correct rotate-left.  
I've googled on sha1.c, and I've found several instances where the code
has switched to using u_int32 instead of long, including one by the same
author (Steve Reid) here:

http://cvsweb.stop1984.com/index.cgi/entropy/src/sha1.c?rev=1.12&content-type=text/x-cvsweb-markup

As a test, I tried simply changing all the longs to ints in sha1.h and
sha1.c.  Unfortunately, I went from getting segfaults to getting kernel
panics.  I'm suspecting this is not a valid thing to do, since the
corresponding files that the kernel was built from still have long
declarations.  I'm guessing these need to match, correct?  Or is pppd
standalone, and can I change sha1.c/h without worrying about the kernel
(which I compiled myself from Mandrake sources)?

I also tried simply changing the definition of rol above to use 64
instead of 32.  Predictably, that didn't work.

I'm not an expert in networking.  I'd appreciate any and all suggestions
anyone can provide to get this working.  Thanks.

-- 
Guy Rouillier
