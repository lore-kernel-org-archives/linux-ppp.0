From: Jarek Poplawski <jarkao2@gmail.com>
Date: Sat, 08 Jan 2011 10:33:14 +0000
Subject: Re: [PATCH v2] net: ppp: use {get,put}_unaligned_be{16,32}
Message-Id: <4D283D6A.4050502@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1294357056-25889-1-git-send-email-xiaosuo@gmail.com>	 <20110107030145.GA8021@brick.ozlabs.ibm.com>	 <AANLkTim=1GCah0qp8HJK31LWXPb5vAZYp+d2BTQM+Q+B@mail.gmail.com>	 <20110107.171534.193718114.davem@davemloft.net>	 <4D2836BB.6000600@gmail.com> <1294482005.2709.90.camel@edumazet-laptop>
In-Reply-To: <1294482005.2709.90.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: David Miller <davem@davemloft.net>, xiaosuo@gmail.com, paulus@samba.org, harvey.harrison@gmail.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

Eric Dumazet wrote:
> Le samedi 08 janvier 2011 à 11:04 +0100, Jarek Poplawski a écrit :
> 
>> Just for the record: I agree with Paul that current code is more readable.
>> This code still requires thinking about specific bytes and the patch mixes
>> it only with word access.
>>
>> Jarek P.
>>
>>> @@ -395,16 +396,14 @@ mppe_compress(void *arg, unsigned char *ibuf, unsigned char *obuf,
>>>  	 */
>>>  	obuf[0] = PPP_ADDRESS(ibuf);
>>>  	obuf[1] = PPP_CONTROL(ibuf);
>>> -	obuf[2] = PPP_COMP >> 8;	/* isize + MPPE_OVHD + 1 */
>>> -	obuf[3] = PPP_COMP;	/* isize + MPPE_OVHD + 2 */
>>> +	put_unaligned_be16(PPP_COMP, obuf + 2);
>>>  	obuf += PPP_HDRLEN;
> 
> Compilers are stupid not generating optimal code, so we should help them
> a bit.
> 
> Yes, I agree this is ugly Jarek and makes reading of this code a bit
> more complex, but this is a move we cannot stop. Number of functions,
> macros, etc... is exploding and we must follow the trend ;)
> 
> 41 c6 44 24 02 00       movb   $0x0,0x2(%r12)
> 41 c6 44 24 03 fd       movb   $0xfd,0x3(%r12)
> 
> After patch :
> 
> 66 41 c7 44 24 02 00 fd   movw   $0xfd00,0x2(%r12)

And that's why Paul wanted more justification, because readability
gain is questionable.

Jarek P.
