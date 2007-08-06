From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 06 Aug 2007 23:30:05 +0000
Subject: Re: sending raw packets via PPP
Message-Id: <18103.44797.529894.786033@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <35B9865F-38B4-4603-A2B7-F4ABACE5520F@sbcglobal.net>
In-Reply-To: Kevin K's message of 6 August 2007 17:45:39
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin K <k_krieser@sbcglobal.net>
Cc: linux-ppp@vger.kernel.org, Linux-kernel Mailing List <linux-kernel@vger.kernel.org>

Kevin K writes:
> Is it possible to send raw packets via ppp under Linux?
> 
> More specifically, in 2.4 series kernels such as RH's 2.4.21-47 kernel?
> 
> I've trying to modify the DHCP 3.0.1 code provided with RH 3 so I can  
> send requests via a PPP connection (standard RS-232), and it is just  
> being dropped by the stack according to ifconfig and debug statements  
> in ppp_generic.c.

I'm not sure what sort of "raw" packets you're talking about (IP raw
or something else), but you shouldn't need to send any raw packets to
do this.  DHCP runs over UDP, and, unlike Ethernet, there's no link
layer addressing to worry about.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
