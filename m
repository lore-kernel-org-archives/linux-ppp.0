From: "Gilles Espinasse" <g.esp@free.fr>
Date: Mon, 27 Dec 2004 19:47:03 +0000
Subject: Re: pppoatm: tring to insert module pppoatm.o, although plugin pppoatm.so is loaded.
Message-Id: <003d01c4ec4c$d7ac4f00$f9b5a8c0@PII350>
List-Id: <linux-ppp.vger.kernel.org>
References: <ALEGKCGFAAHCNBMHOENDKEAICJAA.sadiq.shaikh@analog.com>
In-Reply-To: <ALEGKCGFAAHCNBMHOENDKEAICJAA.sadiq.shaikh@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "Sadiq Shaikh" <sadiq.shaikh@analog.com>
To: <linux-ppp@vger.kernel.org>
Sent: Tuesday, December 28, 2004 12:54 AM
Subject: pppoatm: tring to insert module pppoatm.o, although plugin
pppoatm.so is loaded.


> Hi,
>
> I'm working on pppoatm. Recently i have downloaded
> ppp-2.4.3. I'm running into problem, its will be great
> if someone answer my questions.Thank you in advance.
>
> 1) Why ppp0 interface is not created ?
because of 2)

> 2) why its trying to insert module, when i added it as plugin.

You need both a module for the kernel and a plugin for pppd

> 3) I'm using ppp-2.4.3, linux kernel 2.4.18, any issues with this
> combination ?
>
CONFIG_PPPOATM=m is available on my rh7.3 2.4.18-3 .config, I don't know for
a standard kernel.

I don't know what is the driver you try to support but if it compile on
2.4.18 and is old, you may need small changes with 2.4.20, 2.4.21 and
2.4.22. Later no more changes than in 2.4.22 should be necessary if I
remember well.


