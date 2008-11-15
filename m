From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 15 Nov 2008 14:35:49 +0000
Subject: Re: pppoe config connects, but can't ping *past* gateway. something wrong with my routes?
Message-Id: <18718.56901.462737.559729@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <7259d7020811141843i44d31119u999b70ccd717c61e@mail.gmail.com>
In-Reply-To: <7259d7020811141843i44d31119u999b70ccd717c61e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

JC Janos writes:
> /etc/ppp/ip-up.local
> 	echo /sbin/ip route list | awk '/^default / { print $3 }' > /etc/default-route
> 	/sbin/route del default
> 	/sbin/route add default netmask 255.255.255.248 gw x.x.x.150
[...]
> and to my gateway,
> 
> 	ping -c 1 99.164.169.50
> 		PING 99.164.169.50 (99.164.169.50) 56(84) bytes of data.
> 		64 bytes from 99.164.169.50: icmp_seq=1 ttl%5 time.9 ms

It looks like your routes are misconfigured.  Your default route in
this case should point to the other end of this link -- 99.164.169.50
as you've shown -- and not to one of your own local addresses.  By
using a local address, you've basically told the kernel to drop all
your packets, and it's just doing what you've asked it to do.

As another poster suggested, you should use the "defaultroute" option
instead of this ip-up hackery.  If you really do need all of this
complex manual configuration in the ip-up script, then consider using
the $IPREMOTE environment variable or $5 in /etc/ppp/ip-up.  (I'm not
sure how Linux handles the command line arguments for that script, but
pppd itself passes the remote address as $5 when it invokes
/etc/ppp/ip-up.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
