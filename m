From: "Gilles Espinasse" <g.esp@free.fr>
Date: Thu, 28 Dec 2006 18:57:35 +0000
Subject: Re: Help with PPPoE
Message-Id: <035701c72ab2$0a450830$f9b5a8c0@pii350>
List-Id: <linux-ppp.vger.kernel.org>
References: <4593E72B.30603@freemail.gr>
In-Reply-To: <4593E72B.30603@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "jfj" <jfj@freemail.gr>
To: <linux-ppp@vger.kernel.org>
Sent: Thursday, December 28, 2006 4:47 PM
Subject: Help with PPPoE


> Hi.
>
> I have kernel 2.6.17.13 with "PPP over Ethernet" compiled in (not a
module)
> and pppd 2.4.4b1.  I have added the option "plugin rp-pppoe.so" to
> /etc/ppp/options.
>
> Now when I type
>
> pppd eth0
>
> I get
>
> unrecognized option 'eth0'
>
> But wasn't the plugin supposed to enable this device?
>
> If I use this script in /etc/ppp/peers/mydsl
>
> #
> # PPP over Ethernet options (using roaring pinguin external program)
> #
> plugin rp-pppoe.so
It work for me with this exact line
plugin rp-pppoe.so eth0
...
Then you should be able to do
pppd call mydsl

Gilles

