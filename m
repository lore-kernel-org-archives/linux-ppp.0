From: Vertical Limit <vertlim@gmail.com>
Date: Wed, 09 Sep 2015 14:34:19 +0000
Subject: Re: HDLC frame timing
Message-Id: <CAHZee8iPDKKjMKs=NXJ-K6eTB8sMU-2iFS1CWwof67-N4i8ksA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAHZee8gDhYwwub+cjFF=8RsDZiG=rFwVo7MrwWofvoJSyZrbdA@mail.gmail.com>
In-Reply-To: <CAHZee8gDhYwwub+cjFF=8RsDZiG=rFwVo7MrwWofvoJSyZrbdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

today I found time to work on my problem and so I spent some hours
greping around in the kernel sources trying to understand how the
whole ppp/hdlc/serial system works.

-) I found the hdlc.c, hdlc_ppp.c sources in drivers/net/wan/. Here I
can see, e.g., how the PPP header fields (address, control, protocol,
etc.) are pushed to the socket buffers containing the raw data to
transmit. So this seems to be the wrong place to do what I want and I
think this is the "kernel PPP driver" part you were talking about. I
also don't see a possibility to delay anything here.

-) In addition, I found the ppp_async.c and ppp_synctty.c sources in
drivers/net/. I guess, for me, the async version is of interest
because here I can really see where the start/stop flags and the CRC
is added to the data. The synctty version is for devices, which don't
need the start/stop flags, right? Because there is for example a CLK
signal determining the begin and end of a frame?

So would it be a very bad idea to simply add a constant delay/sleep of
2ms in the ppp_async.c file? For example in the ppp_async_send()
function? Do I also need to call the ppp_async_flush_output() function
all the time, so it is guaranteed that the frame really goes
physically on the line after each skb? Or is sleeping at this stage
messing everything up?

And what would I need to do, if I would not alter the original
ppp_async.c but create a copy of it with the added delay
characteristic? How can I tell ppp(d) then to use my customized PPP
line discipline?

Kind regards,
Thomas

2015-08-25 14:04 GMT+02:00 James Carlson <carlsonj@workingcode.com>:
> On 08/25/15 05:09, Vertical Limit wrote:
>> Hi all,
>>
>> I am currently working on a system using pppd over a special radio
>> link. Would it be possible to insert a small time break (around 2ms)
>> between two consecutive HDLC frames? I could imagine compiling a
>> special customized pppd version for this purpose. I think there is no
>> pppd option for achieving this. Could someone help me by pointing me
>> to the right lines of codes or giving a better solution?
>
> This isn't really under PPP's control.
>
> First of all, the data path itself (the IP frames containing user data)
> does not run through the user-space pppd daemon.  So, even if you did
> modify it, you would be changing only the way pppd does its negotiation
> and nothing about the normal operation once the link is established.
>
> Secondly, there's no place in the kernel PPP driver I can see where you
> could delay something.  I suppose, in theory, you could completely
> rewrite it to include some sort of delay queue on the transmit side
> along with a timer-driven mechanism, but I think that's barking up the
> wrong tree.  Timing isn't this driver's job.
>
> Instead, I think what you want to do is to create a custom HDLC
> (synchronous serial port) driver that has the properties that you
> desire, and then run unmodified PPP over that.
>
> Good luck on your Aloha project.  ;-}
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
