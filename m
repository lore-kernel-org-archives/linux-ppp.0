From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 25 Aug 2015 12:04:36 +0000
Subject: Re: HDLC frame timing
Message-Id: <55DC59D4.7050209@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAHZee8gDhYwwub+cjFF=8RsDZiG=rFwVo7MrwWofvoJSyZrbdA@mail.gmail.com>
In-Reply-To: <CAHZee8gDhYwwub+cjFF=8RsDZiG=rFwVo7MrwWofvoJSyZrbdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 08/25/15 05:09, Vertical Limit wrote:
> Hi all,
> 
> I am currently working on a system using pppd over a special radio
> link. Would it be possible to insert a small time break (around 2ms)
> between two consecutive HDLC frames? I could imagine compiling a
> special customized pppd version for this purpose. I think there is no
> pppd option for achieving this. Could someone help me by pointing me
> to the right lines of codes or giving a better solution?

This isn't really under PPP's control.

First of all, the data path itself (the IP frames containing user data)
does not run through the user-space pppd daemon.  So, even if you did
modify it, you would be changing only the way pppd does its negotiation
and nothing about the normal operation once the link is established.

Secondly, there's no place in the kernel PPP driver I can see where you
could delay something.  I suppose, in theory, you could completely
rewrite it to include some sort of delay queue on the transmit side
along with a timer-driven mechanism, but I think that's barking up the
wrong tree.  Timing isn't this driver's job.

Instead, I think what you want to do is to create a custom HDLC
(synchronous serial port) driver that has the properties that you
desire, and then run unmodified PPP over that.

Good luck on your Aloha project.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
