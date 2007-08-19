From: Kevin K <k_krieser@sbcglobal.net>
Date: Sun, 19 Aug 2007 23:46:21 +0000
Subject: Re: sending raw packets via PPP
Message-Id: <F46FFDA7-6FB2-4700-9A53-0B43F8736A70@sbcglobal.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <35B9865F-38B4-4603-A2B7-F4ABACE5520F@sbcglobal.net> <18103.44797.529894.786033@gargle.gargle.HOWL>
In-Reply-To: <18103.44797.529894.786033@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Carlson <carlsonj@workingcode.com>
Cc: linux-ppp@vger.kernel.org, Linux-kernel Mailing List <linux-kernel@vger.kernel.org>


On Aug 6, 2007, at 6:30 PM, James Carlson wrote:

> Kevin K writes:
>> Is it possible to send raw packets via ppp under Linux?
>>
>> More specifically, in 2.4 series kernels such as RH's 2.4.21-47  
>> kernel?
>>
>> I've trying to modify the DHCP 3.0.1 code provided with RH 3 so I can
>> send requests via a PPP connection (standard RS-232), and it is just
>> being dropped by the stack according to ifconfig and debug statements
>> in ppp_generic.c.
>
> I'm not sure what sort of "raw" packets you're talking about (IP raw
> or something else), but you shouldn't need to send any raw packets to
> do this.  DHCP runs over UDP, and, unlike Ethernet, there's no link
> layer addressing to worry about.
>
> -- 
> James Carlson         42.703N 71.076W          
> <carlsonj@workingcode.com>


I would like to thank the people who responded to this posting for  
their help.  It helped keep me from wasting additional time trying to  
use SOCK_PACKET over PPP just because the DHCP code in Red Hat used  
it for ethernet.  (The dhclient code did it to ensure that the  
ethernet/IP/UDP headers were to their satisfaction, and to avoid some  
bugs in older versions of the Linux kernel).

I've tested through a serial/PPP connection without issues.

This is obviously not a normal configuration, having to run a DHCP  
client through PPP, but the IP addresses are assigned via a DHCP  
server, but he router we connect to via PPP won't retrieve addresses  
from the DHCP server for us.

Thanks,
Kevin
