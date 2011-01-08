From: Jarek Poplawski <jarkao2@gmail.com>
Date: Sat, 08 Jan 2011 10:04:43 +0000
Subject: Re: [PATCH v2] net: ppp: use {get,put}_unaligned_be{16,32}
Message-Id: <4D2836BB.6000600@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1294357056-25889-1-git-send-email-xiaosuo@gmail.com>	<20110107030145.GA8021@brick.ozlabs.ibm.com>	<AANLkTim=1GCah0qp8HJK31LWXPb5vAZYp+d2BTQM+Q+B@mail.gmail.com> <20110107.171534.193718114.davem@davemloft.net>
In-Reply-To: <20110107.171534.193718114.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: xiaosuo@gmail.com, paulus@samba.org, harvey.harrison@gmail.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

David Miller wrote:
> From: Changli Gao <xiaosuo@gmail.com>
> Date: Sat, 8 Jan 2011 08:43:01 +0800
> 
>> On Fri, Jan 7, 2011 at 11:01 AM, Paul Mackerras <paulus@samba.org> wrote:
>>> On Fri, Jan 07, 2011 at 07:37:36AM +0800, Changli Gao wrote:
>>>
>>>> Signed-off-by: Changli Gao <xiaosuo@gmail.com>
>>>
>>> This patch description is inadequate.  It should tell us why you are
>>> making this change.  Does it result in smaller and/or faster code, and
>>> if so by how much on what sort of machine?  Do you think it makes the
>>> code clearer?  (I don't.)  Or is there some other motivation for this?
>>>
>>
>> Good designed APIs always make code clearer, smaller and faster. It is
>> obvious enough I think.
> 
> I have to say that every time I go read the header parsing code in the
> PPP driver, I absolutely regret it.
> 
> And Changli's patch fixes some of the readability problems.

Just for the record: I agree with Paul that current code is more readable.
This code still requires thinking about specific bytes and the patch mixes
it only with word access.

Jarek P.

> @@ -395,16 +396,14 @@ mppe_compress(void *arg, unsigned char *ibuf, unsigned char *obuf,
>  	 */
>  	obuf[0] = PPP_ADDRESS(ibuf);
>  	obuf[1] = PPP_CONTROL(ibuf);
> -	obuf[2] = PPP_COMP >> 8;	/* isize + MPPE_OVHD + 1 */
> -	obuf[3] = PPP_COMP;	/* isize + MPPE_OVHD + 2 */
> +	put_unaligned_be16(PPP_COMP, obuf + 2);
>  	obuf += PPP_HDRLEN;

