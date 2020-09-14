From: Oliver Neukum <oneukum@suse.de>
Date: Mon, 14 Sep 2020 08:02:47 +0000
Subject: Re: [RESEND net-next v2 12/12] net: usbnet: convert tasklets to use new tasklet_setup() API
Message-Id: <1600070567.2534.3.camel@suse.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200914073131.803374-1-allen.lkml@gmail.com>
         <20200914073131.803374-13-allen.lkml@gmail.com>
In-Reply-To: <20200914073131.803374-13-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Allen Pais <allen.lkml@gmail.com>, davem@davemloft.net
Cc: m.grzeschik@pengutronix.de, kuba@kernel.org, paulus@samba.org, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, petkan@nucleusys.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, Romain Perier <romain.perier@gmail.com>

Am Montag, den 14.09.2020, 13:01 +0530 schrieb Allen Pais:
> From: Allen Pais <apais@linux.microsoft.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly
> and remove the .data field.

Hi,

how would bisecting be supposed to run smoothly, if this
patch were applied? We'd pass a NULL pointer.

	Regards
		Oliver
