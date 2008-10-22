From: Lie Arne <Arne.Lie@sintef.no>
Date: Wed, 22 Oct 2008 07:11:26 +0000
Subject: RE: ppp0 and it's txqueuelen with HSDPA gsm modems
Message-Id: <39417DF3286A66428FA558987839F44F0685D8E0@SINTEFXCH01.sintef.no>
List-Id: <linux-ppp.vger.kernel.org>
References: <48FE2309.3060907@pcuf.fi>
In-Reply-To: <48FE2309.3060907@pcuf.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org 
> [mailto:linux-ppp-owner@vger.kernel.org] On Behalf Of Jar
> Sent: 21. oktober 2008 20:44
> To: linux-ppp@vger.kernel.org
> Subject: ppp0 and it's txqueuelen with HSDPA gsm modems
> 
> Hello
> 
> What would be "optimal" value for ppp0 device's txqueuelen, 
> when it is used with HSDPA gsm modem for link which downlink 
> speed is 1Mbit/s and uplink speed is 384kbit/s and ping 
> ~80..100 ms? Is the default value 3 just OK?
> 
> --
> Best Regards, Jar
Jar,

I would suggest using normal TCP calculation, i.e. that you dimension
the txqueue size after the "BDP rule": bandwidth x delay product. Using
your outbound numbers this is:
1,000,000 x 0.1 = 100,000 bits = 12,500 bytes. Assuming 1500 byte
packets, this is txqueue = 12,500 / 1500 = 8.3 packets. So you could try
txqueue size in the region 8-10, this should prevent queue starvation at
packet drop events caused by traffic overload, even if you only have one
single TCP flow.

Best regards,

Arne Lie
SINTEF ICT, Dept. of Communication Systems
e-mail: arne.lie@sintef.no 
