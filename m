From: Jar <jar@pcuf.fi>
Date: Sun, 16 Nov 2008 16:20:31 +0000
Subject: Re: ppp0 and it's txqueuelen with HSDPA gsm modems
Message-Id: <4920484F.4060100@pcuf.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <48FE2309.3060907@pcuf.fi>
In-Reply-To: <48FE2309.3060907@pcuf.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Lie Arne wrote:
>> What would be "optimal" value for ppp0 device's txqueuelen, 
>> when it is used with HSDPA gsm modem for link which downlink 
>> speed is 1Mbit/s and uplink speed is 384kbit/s and ping 
>> ~80..100 ms? Is the default value 3 just OK?
>>
>> --
>> Best Regards, Jar
> 
> I would suggest using normal TCP calculation, i.e. that you dimension
> the txqueue size after the "BDP rule": bandwidth x delay product. Using
> your outbound numbers this is:
> 1,000,000 x 0.1 = 100,000 bits = 12,500 bytes. Assuming 1500 byte
> packets, this is txqueue = 12,500 / 1500 = 8.3 packets. So you could try
> txqueue size in the region 8-10, this should prevent queue starvation at
> packet drop events caused by traffic overload, even if you only have one
> single TCP flow.

OK, thanks. But is txqueuelen for transmit data only and then the 
downlink value (384kbit/s) should be used in the calculation? With 
384kbit/s the txqueuelen would be 3.2 which is quite same as ppp0 default 3.

-- 
Best Regards, Jar
