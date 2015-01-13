From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Jan 2015 22:22:47 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <54B59AB7.9060901@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/13/15 16:56, Christoph Schulz wrote:
> Hello!
> 
> James Carlson schrieb am Tue, 13 Jan 2015 16:31:29 -0500:
> 
>> Not so much "wrong" as "pointless."  Why bother to ask for less?  You
>> don't have to pad the packets out to the full MRU, so why do you care
>> what the peer has advertised as a maximum?  All that matters is that (by
>> acking the value) you've promised not to send anything bigger.  By
>> adhering to a smaller limit, you're certainly in compliance with the
>> peer's limitations.
> 
> Yes. However, the problem lies in the mechanism the Linux kernel
> determines the MTU of a link in a multilink bundle: It simply takes the
> peer's MRU we ACKed. Obviously this is not correct if we are bound to
> use a smaller (channel) MTU due to other constraints (tunnel overhead).
> But there is currently no possibility to tell the Linux kernel what
> channel MTU to use.

Ah, ok.  Are you referring to the individual link MTU rather than the
bundle's overall MTU?

If so, then, yes, that does look like a problem.  It should be possible
to limit individual link MTU values as desired, but I don't see a good
way to do it.

But, for what it's worth, running MP over a tunneled link sounds like
extreme weirdness to me.  Unless you're trying to set new records for
packet loss and link latency, why would you do that?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
