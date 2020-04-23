From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 23 Apr 2020 02:01:38 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <9547fb41-f4a8-ab9c-3413-a212df71389c@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 4/22/20 8:41 PM, Michael Richardson wrote:
> 
> James Carlson <carlsonj@workingcode.com> wrote:
>      > If it isn't, then possibly it's something else.  I think that the last
>      > time I looked at the PPPoE implementation on Linux it was a bit hokey --
>      > it ran PPP over a pty pair and then decoded the framing in user space
>      > and wrote it back out over Ethernet using PPPoE.  I hope it's not still
>      > like that, as I haven't looked at it in years, but it may well be.  An
>      > internal error in that logic could also cause a "hangup" message,
>      > although hopefully along with some kind of system log about a core file
>      > as well.
> 
> No, that's not how PPPoE has worked for at least 15 years.
> There is a PPPoE socket and the IP packets do not leave the kernel.
> I have built BMS systems that handle thousands of sessions on 8-core
> systems.

OK; thanks for the correction, and it's good to hear.  The ahdlc hacks 
I've seen were just inherently unstable.

That makes it ever more likely that this is just the provider's doing.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
