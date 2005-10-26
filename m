From: "Gilles Espinasse" <g.esp@free.fr>
Date: Wed, 26 Oct 2005 20:18:18 +0000
Subject: Re: Error message with persist option
Message-Id: <02d301c5da6a$67df6790$f9b5a8c0@pii350>
List-Id: <linux-ppp.vger.kernel.org>
References: <20051026194149.GA17341@test-scsi>
In-Reply-To: <20051026194149.GA17341@test-scsi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "Gregory Colpart" <gcolpart@evolix.net>
To: <linux-ppp@vger.kernel.org>
Sent: Wednesday, October 26, 2005 9:41 PM
Subject: Error message with persist option


> Hello,
>
> I have a i386 Debian 3.1 box with a kernel 2.4.30 and pppd 2.4.3
> My DSL connnection is PPPoA with a modem PCI card Bewan ST
> (unicorn driver).
>
with ppp-2.4.3 version, is it the debian package or standard ppp-2.4.3
There is numerous ppp-2.4.3 flavour including some patches wich may help.
You should try with the debian package or with ppp-2.4.4b1 wich should
include all those fixes.
http://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=ppp
ftp://ftp.samba.org/pub/ppp/ppp-2.4.4b1.tar.gz

> When I pon/poff, it works fine. But every 24 hours, my ISP reset
> my connection and persist option fails to reactivate it.
>
>
> See my debug messages :
>
> * End of connection
>
> 21:00:03 pppd[29191]: rcvd [LCP TermReq id=0xe7]
> 21:00:03 pppd[29191]: LCP terminated by peer
> 21:00:03 pppd[29191]: Connect time 1440.0 minutes.
> 21:00:03 pppd[29191]: Sent 410466878 bytes, received 450988023
> bytes.
> 21:00:03 pppd[29191]: Script /etc/ppp/ip-down started (pid 31487)
> 21:00:03 pppd[29191]: Script /etc/ppp/ipv6-down started (pid
> 31488)
> 21:00:03 pppd[29191]: Couldn't increase MTU to 1500. Using 1492
> 21:00:03 pppd[29191]: Couldn't increase MRU to 1500. Using 1492
I don't know for ipv6 but with ipv4,you could remove MTU/MRU92
This is only necessary with PPPoE and not PPPoA

Gilles

