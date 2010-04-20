From: Jan Just Keijser <jan.just.keijser@gmail.com>
Date: Tue, 20 Apr 2010 14:49:57 +0000
Subject: Re: CRC-16 or CRC-32
Message-Id: <4BCDBF15.9020309@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

Arne Lie wrote:
> Jan,
>
> Hm, my observations are that if there are bit errors introduced in the PPP frame, the "ifconfig ppp0" will count such packets in the "error" tab. From this I anticipated that the PPP stack included CRC checking of its payload. By CRC-16 I mean 2 byte CRC, CRC-32 4 byte. Our customer wants 4 byte CRC. From RFC2823 I see both are mentioned. The question is, how does one select either? Perhaps it is not configurable via pppd?
>
>   
RFC2823 is about PPP SDL on SONET/SDH ; AFAIK the pppd code does not 
support this *at all* so I am not surprised that I did not find any 
references to CRCs in the headers...

So the short answer to your question would be: no, PPP v2.4.5 does not 
support CRC-16 or CRC-32.

HH,

JJK / Jan Just Keijser


>
>
>   
>> -----Original Message-----
>> From: Jan Just Keijser [mailto:jan.just.keijser@gmail.com]
>> Sent: 20. april 2010 16:16
>> To: Arne Lie
>> Cc: linux-ppp@vger.kernel.org
>> Subject: Re: CRC-16 or CRC-32
>>
>> Arne Lie wrote:
>>     
>>> Hi,
>>>
>>> A very basic question: does PPP v2.4.5 support CRC-16 or CRC-32 (or
>>>       
>> it may be configurable, in that case, how)?
>>     
>> what exactly do you mean by CRC-16 or CRC-32? ( I know what CRC means )
>> BTW, the word 'crc' does not appear anywhere in the ppp source code.
>>     

