From: Matt Keenan <tank.en.mate@gmail.com>
Date: Tue, 07 Aug 2007 08:46:51 +0000
Subject: Re: sending raw packets via PPP
Message-Id: <46B8317B.40305@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <35B9865F-38B4-4603-A2B7-F4ABACE5520F@sbcglobal.net> <18103.44797.529894.786033@gargle.gargle.HOWL> <E210D1E9-9265-48EE-91BB-E6027547F01E@sbcglobal.net>
In-Reply-To: <E210D1E9-9265-48EE-91BB-E6027547F01E@sbcglobal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin K <k_krieser@sbcglobal.net>
Cc: James Carlson <carlsonj@workingcode.com>, linux-ppp@vger.kernel.org, Linux-kernel Mailing List <linux-kernel@vger.kernel.org>

Kevin K wrote:
>
> On Aug 6, 2007, at 6:30 PM, James Carlson wrote:
>
>> Kevin K writes:
>>> Is it possible to send raw packets via ppp under Linux?
>>>
>>> More specifically, in 2.4 series kernels such as RH's 2.4.21-47 kernel?
>>>
>>> I've trying to modify the DHCP 3.0.1 code provided with RH 3 so I can
>>> send requests via a PPP connection (standard RS-232), and it is just
>>> being dropped by the stack according to ifconfig and debug statements
>>> in ppp_generic.c.
>>
>> I'm not sure what sort of "raw" packets you're talking about (IP raw
>> or something else), but you shouldn't need to send any raw packets to
>> do this.  DHCP runs over UDP, and, unlike Ethernet, there's no link
>> layer addressing to worry about.
>
> I was basing the raw mode on comments in the DHCP source code about
> problems in older Linux kernels with sending packets to
> 255.255.255.255 via normal IP.  The DHCP source code therefore wants
> to send raw packets (SOCKET_PACKET) (down to the ethernet addressing
> info).  I guess I thought I would need to do this too to fit in with
> the existing source code.
>
> I'll give it a try to see whether packets sent to 255.255.255.255 can
> make it to ppp with the IP address unchanged.
You shouldn't need to run DHCP over PPP, PPP uses LCP to configure
connections. I suspect the only time you would need to run DHCP over a
PPP link is if you had a DHCP proxy run the request over the PPP link,
but that sounds way more complicated than what you are looking for. Have
a quick look at
http://www.cisco.com/univercd/cc/td/doc/cisintwk/ito_doc/ppp.htm that
should bring you up to speed on how PPP works. You will probably find
that LCP does everything you need. If you really need some of the
functionality of DHCP (such as setting up WINS servers et al) you might
find that you need to hack a way to do this.

Matt
