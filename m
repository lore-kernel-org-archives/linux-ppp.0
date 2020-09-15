From: Allen Pais <apais@linux.microsoft.com>
Date: Tue, 15 Sep 2020 04:24:51 +0000
Subject: Re: [RESEND net-next v2 00/12]drivers: net: convert tasklets to use new tasklet_setup() API
Message-Id: <87508263-99f1-c56a-5fb1-2f4700b6b375@linux.microsoft.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200914073131.803374-1-allen.lkml@gmail.com>
 <5ab44bd27936325201e8f71a30e74d8b9d6b34ee.camel@nvidia.com>
In-Reply-To: <5ab44bd27936325201e8f71a30e74d8b9d6b34ee.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>, "davem@davemloft.net" <davem@davemloft.net>, "allen.lkml@gmail.com" <allen.lkml@gmail.com>
Cc: "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "woojung.huh@microchip.com" <woojung.huh@microchip.com>, "petkan@nucleusys.com" <petkan@nucleusys.com>, "oliver@neukum.org" <oliver@neukum.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, "paulus@samba.org" <paulus@samba.org>, "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>



>>
>> ommit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
>> introduced a new tasklet initialization API. This series converts
>> all the net/* drivers to use the new tasklet_setup() API
>>
>> This series is based on v5.9-rc5
>>
>> Allen Pais (12):
>>    net: mvpp2: Prepare to use the new tasklet API
>>    net: arcnet: convert tasklets to use new tasklet_setup() API
>>    net: caif: convert tasklets to use new tasklet_setup() API
>>    net: ifb: convert tasklets to use new tasklet_setup() API
>>    net: ppp: convert tasklets to use new tasklet_setup() API
>>    net: cdc_ncm: convert tasklets to use new tasklet_setup() API
>>    net: hso: convert tasklets to use new tasklet_setup() API
>>    net: lan78xx: convert tasklets to use new tasklet_setup() API
>>    net: pegasus: convert tasklets to use new tasklet_setup() API
>>    net: r8152: convert tasklets to use new tasklet_setup() API
>>    net: rtl8150: convert tasklets to use new tasklet_setup() API
>>    net: usbnet: convert tasklets to use new tasklet_setup() API
>>
>>
> 
> You are only converting drivers which are passing the taskelt struct as
> data ptr, most of other drivers are passing the container of the
> tasklet as data, why not convert them as well, and let them use
> container_of to find their data ? it is really straight forward and
> will help convert most of net driver if not all.
> 

from_tasklet uses container_of internally. use of container_of is 
avoided cause it end being really long.
