From: Oleg Makarenko <mole@quadra.ru>
Date: Fri, 30 Jul 2004 19:33:09 +0000
Subject: Re: [2/2]: ppp_mppe inclusion
Message-Id: <410AA275.5060506@quadra.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040404010506010906080807"
List-Id: <linux-ppp.vger.kernel.org>
References: <20040720204723.GC27576@lists.us.dell.com>
In-Reply-To: <20040720204723.GC27576@lists.us.dell.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------040404010506010906080807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matt Domsch wrote:

>On Tue, Jul 20, 2004 at 03:45:40PM -0500, Matt Domsch wrote:
>  
>
>>This mail will be followed by two patches, for comment on proposed
>>solution.  I've compiled this, but am not able to test this week.
>>    
>>

Great work, Matt. Thank you for your patches. Any chances to see them 
integrated in 2.6 any time soon?

The only problem is that they do not work for me and never did :) I get 
kernel panic with your patches and wonder how others don't get the same 
result?

Please find attached somewhat (I hope) improved patches that finaly do 
work for me

The problems with your original patches:

1. setup_sg(). Do you really need to split the data this way? The 
documentation on crypto api and scatterlists is not very helpful so I 
could be wrong here but in my reading  of crypto/digest.c/update() (for 
ex)  you may just have a single sg[0] even if the data doesn't fit into 
a single page.  All pages just need to be contiguous. It probably 
doesn't hirt but is it really needed?  I have removed this split from 
your patch just to test it. Seems to work fine.

2.  For some reason you can not use non GFP_KERNEL memory and scatter 
lists or at least mix them in crypto_digest().  That is why sha_pad is 
now in struct state {}.

3.  In get_new_key_from_sha() the code like 

   crypto_digest_update(state->sha1, sg, state->keylen)

looks suspicious as the last parameter (in my reading of digest.c) 
should be the number of elements in sg[] array not the data length. That 
seems to be the reason for my kernel panics. With your setup_sg() the 
last parameter should be 1 or 2. Or may be you could replace all four 
digest_update calls with a single call with properly initilaized sg[4] 
(to make some use from scatterlist) . See the modified patch for details.

4. in ppp_generic.c/pad_compress_skb() the following code:

       } else if (len == 0) {
               /* didn't compress, or CCP not up yet */
               kfree_skb(new_skb);
               new_skb = NULL;
               ...
        return new_skb;

also looks suspicious as later I read

               skb = pad_compress_skb(ppp, skb);
               if (!skb)
                       goto drop;

I think you don't want to drop packets with len == 0.  At least the 
previous mppe enabled ppp_generic.c code don't do that.  I've changed 
new_skb = NULL above to new_skb = skb, see the patch. IPCP can not be 
established without this modification.

Please try these patches and let me know your results. Hope they can be 
useful for you.

And btw,
What do think on crypto api in kernel? It looks like a performance 
killer for the small size block ciphers and especially for the arc4 
(with its single byte block), doesn't it? Or have I missed something?
Why do we need so many calls just to encrypt a single byte (see the for 
loop in crypto/cipher.c/crypt())?
Does it make any sense to cond_resched() for every encrypted (i.e. for 
every sent) byte (as crypt() does for arc4)?
Some benchmarks against this new patches would be very interesting.

=oleg


--------------040404010506010906080807
Content-Type: application/x-gzip;
 name="ppp_mppe1-moleg.patch.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="ppp_mppe1-moleg.patch.gz"

H4sICPQoCUEAA3BwcF9tcHBlMS1tb2xlZy5wYXRjaAClV21z2jgQ/gy/Ytub6YXYBgPhJeSS
SYfSa6dpyqXN3Jeb8ThYgAe/nSTn5W7y329XksG8DUmPD4Dl1bOrR7vPSkE4nYKT82uIwiR/
dFr1br1XT3k4awQ8vGdcNBImG1mWeTOWMB5O6pM10zjL2H7TquM4r0CutFz3xHE7TtMFtzto
twctt+4WH7DcE9etWpb1iggMZM9pnULLHbR7g7Zb7564/X6vt4S8vATntNe1u2DRT6cJl5dV
qBDQYxxKL0+idLI4wufaWRWeq1C1hPRlOIEwwVAYCMnziQSx8O5yJPS4amV+4E3SOONMCE8s
7o6MCWLAMX7ZW3PQqFa1/q1alc03CXsgiDN8FSYSIpYUf80bT4T/MDgncOciYPfORSxzsPTz
I4XhXNC3smWPkvueyPwJK0zUlLnPA2/O/IBxr+SiWETK/6en8XjsffpwczW6JmgTOUL5EZKr
KCqvxobfP4699z++ff08rKlYpnD0xljUgGiqZBwDXBx9Gd1ce6ObG3iLLgaQpBCzOOVPcESR
QLaQtb+StwqkwpnMeQLXt1dX9PxsgPeyABeluGuEQAEiH4zfsyJgm8YrgJ/9OE4ZB13jlMZx
iVxMhzCKgD1mbCIFvG8M4e5JMoEZBvOAw3EDZxDQ+RbXBHBkBj3KSyQPo8JAfOmj45aOjwI0
AetXxopArbLRjh1f7oCmxIV37wxp08ifCXgH34fecDj2bsc1szmLKWdMZz5u2JmhDsMvZbMi
M8slmdiU17XSaBTp4VbtjKiiAUixHFbUKE6egUWCQRHc+Tm4JgKcFIRB8usqh21AojFMzBEJ
eQZPTGqQUrRFiqlIVllqIjbeDD59w7F2/Bv6Nc9fx+MRcPZ3HqJTkHNfwgODIFVuBUsCyBOW
TPhTJllg5ky5HzNRB/gxZ+W0eKCsMFnrNGmZD8xMEfM0jwIIeJqhE6YhEOFPBPAT5SuMs+gJ
kCtp5sgSupfxVKZwxyZ+jmtSUfsYHP4ZIrjPWWmSQGxI8viO8boebuwsQUyKQTl+ii5jAVXh
sggPkl0uT7P2VdbgYBWQe8DIhsaRilsx6xsa1GvFJeoL4wVZc/+eAYk5hkTLInmHzJdzWzWB
ptvt2tgprCZ+7GZb9wFMJIlyglzhHqKaLdgqpcI0ISpAVYepQlWDpia+fR17N7fXNaqYtRqF
N5ipOI9kg96pvcAxkokrTNHNMUxbymunslM6d+rxLiGyCUGL1ZrA4iitYIltyoiMf0JmlVjv
E4gSFUrD4lzIZa80tXsgsYh1U2AB3OUSN+aBNBaDKDKuroMBxJoRjTSsHp+Ltb5U9ImDnaq/
ZPLFsu/QnNfqPk75aeFXIR5U/qXVZhqtB195TQsgzM0eYJgsN4GC3I0usBp+URtA86Uy09QX
S/96lCs5IsBVy9o6zOkDXCFcKtv18W0z2+isSAKi1aXp9u0eiUu7Z/e1tmh5OyMzNWmArrdb
J3koHGy+hYplqX2gDBB1+egxzlMuzElVOe6cdpXjbot+lWMdJ5oq37oglN6cG71B5SoERyAH
mBXeht7EfCtHrEPW6i/XORywg0dFXcFKmcRSlGCPPngaUO2S6gIlldpQA7XuYP/lJ0wmUR6w
hnpBNwqHkOvz7ZvHPsvdV5991ps3n+ag03nZzecA4vLi0x10WvVOu9Ny+yedduniQ52uqzpe
0fB0y7sVqK2oQtQtw2RW1qw4DfJIVx4UtxU9BscoxIyf6ePtiHaV6gT0ziaMBSTYT2vnEAT0
oxnSI+exPlbkiQhniXKvK3gzR16Ev8qGAx5256Hxgbm31qAgFHjSkLZqOyX9wza9FECcqY9N
yep0Zs4N297X0KloVUEWknGqN+e0X2zOLwGb0pXzw+jj1fsfI2/46Yv3ffTH7eh6OKq4ZqqF
7j+QXSixVQqYIgN0vqvTmwbdPgqY4WdPHfz2fJp9/at6VjINZ5BmBLlEVHArMCzZbbwuLEFQ
3WdyjgK+AaeDMqe6zchT5I/b4Aul2khenmUpx7OzvXYgiJmcp4FQRz9MzOp/rNaxKNwQAAA=
--------------040404010506010906080807
Content-Type: application/x-gzip;
 name="ppp_mppe2-moleg.patch.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="ppp_mppe2-moleg.patch.gz"

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
--------------040404010506010906080807--
