From: Oleg Makarenko <mole@quadra.ru>
Date: Tue, 31 Aug 2004 22:23:46 +0000
Subject: Re: [pptp-devel] Re: [2/2]: ppp_mppe inclusion
Message-Id: <4134FA72.2020107@quadra.ru>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040720204723.GC27576@lists.us.dell.com>
In-Reply-To: <20040720204723.GC27576@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Matt Domsch wrote:

>On Mon, Aug 30, 2004 at 05:42:05PM -0500, Matt Domsch wrote:
>  
>
>>On Fri, Jul 30, 2004 at 11:33:09PM +0400, Oleg Makarenko wrote:
>>    
>>
>>>2.  For some reason you can not use non GFP_KERNEL memory and scatter 
>>>lists or at least mix them in crypto_digest().  That is why sha_pad is 
>>>now in struct state {}.
>>>      
>>>
>
>Can you describe what happens when you do?
>
>
>  
>
It didn't crash/panic and everything seems to work fine but the digest 
was incorrect.

When I'd looked at the actual data that were passed to sha1_update() I 
saw all FF's instead of  00's (or F2's) for pad1 (pad2).

The only difference was the memory type and to verify that that is the 
reason for wrong calculated hash value  (and only as a workaround) I've 
placed pads to struct state. Struct state is already gfp_kernel so there 
were no need to bother with malloc/free :)

Actually I don't know what is wrong here and what is the right way to 
solve it. Is it by design or is it a bug in crypto?

It is easy to add one more test for sha1 using static memory and I hope 
I'll be able to reproduce the problem.

I'll try tomorrow and let you know the results.

regards,
Oleg









