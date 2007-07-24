From: Lee Davies <ldavies@comtechm2m.com>
Date: Tue, 24 Jul 2007 08:07:10 +0000
Subject: Re: Can we run a PPP server & client simultaneously???
Message-Id: <46A5B32E.4030409@comtechm2m.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <11741524.post@talk.nabble.com>
In-Reply-To: <11741524.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


>>
>> I have a PPP client setup to support dial on demand, however this 
>> locks the
>> serial port preventing any call answering programs (such as mgetty) from
>> using the same serial port and modem.
>
> Stop using dial on demand. It is completely useless when you are 
> connected
> as a server anyway. Ie, if you want to use outgoing ppp, just run a 
> progrm
> to start it instead of trying to do on demand.

Sorry Bill I forgot to mention that I'm using the linux box as a GPRS 
router. When any PC connected to my Linux router box accesses any thing 
remotely, the router will automatically fire up the GPRS modem. This bit 
works well :-)

However I'd like the ability to dial up the router from work and poll a 
few devices connected to it. Since I only have one serial port and one 
modem, it would be nice to configure the Linux box to support 
dial-on-demand and as a dial up server.

Regards,

Lee
