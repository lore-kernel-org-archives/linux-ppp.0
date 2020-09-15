From: Allen Pais <apais@linux.microsoft.com>
Date: Tue, 15 Sep 2020 04:20:15 +0000
Subject: Re: [RESEND net-next v2 00/12]drivers: net: convert tasklets to use new tasklet_setup() API
Message-Id: <a43cb15f-a543-3099-ee8a-63de4bd15e66@linux.microsoft.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200914073131.803374-1-allen.lkml@gmail.com>
 <20200914.132438.1323071673363556958.davem@davemloft.net>
In-Reply-To: <20200914.132438.1323071673363556958.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, allen.lkml@gmail.com
Cc: m.grzeschik@pengutronix.de, kuba@kernel.org, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, petkan@nucleusys.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org

> 
>> From: Allen Pais <apais@linux.microsoft.com>
>>
>> ommit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
>> introduced a new tasklet initialization API. This series converts
>> all the net/* drivers to use the new tasklet_setup() API
>>
>> This series is based on v5.9-rc5
> 
> I don't understand how this works, you're not passing the existing
> parameter any more so won't that crash until the final parts of the
> conversion?
> 
> This is like a half-transformation that will break bisection.

  I understand, I will re-work on it and send it out.


> 
> I'm not applying this series, sorry.
> 
