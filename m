From: "Gilles Espinasse" <g.esp@free.fr>
Date: Sat, 15 Nov 2008 07:30:56 +0000
Subject: Re: pppoe config connects, but can't ping *past* gateway. something wrong with my routes?
Message-Id: <094c01c946f4$19e0b090$f9b5a8c0@pii350>
List-Id: <linux-ppp.vger.kernel.org>
References: <7259d7020811141843i44d31119u999b70ccd717c61e@mail.gmail.com>
In-Reply-To: <7259d7020811141843i44d31119u999b70ccd717c61e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "JC Janos" <jcjanos245@gmail.com>
To: <linux-ppp@vger.kernel.org>
Sent: Saturday, November 15, 2008 3:43 AM
Subject: pppoe config connects, but can't ping *past* gateway. something
wrong with my routes?


> Hi,
>
> I'm setting up my 1st linux router/firewall for my office. I'm
> connecting to the net via ATT DSL using PPPoE.  It's connected, but
> something's wrong with my config (routing?) as I can't seem to ping
> past my gateway.
>
...
> /etc/ppp/options
> debug
> ktune
> logfile  /var/log/ppp.log
>
> noauth
> hide-password
> noipdefault
> persist
> holdoff 30
>
> noaccomp
> nobsdcomp
> noccp
> nodeflate
> nopcomp
> novj
> novjccomp
> lcp-max-configure 10
> lcp-max-failure   10
> lcp-max-terminate  3
> lcp-restart        3
>
> default-asyncmap
>
>
> /etc/ppp/ip-up.local
> echo /sbin/ip route list | awk '/^default / { print $3 }' >
/etc/default-route
> /sbin/route del default
> /sbin/route add default netmask 255.255.255.248 gw x.x.x.150
>
Why don't you use ppp defaultroute option?

Gilles

