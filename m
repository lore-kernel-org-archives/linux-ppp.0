From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 23 Jan 2015 14:14:14 +0000
Subject: Re: pppd hangup only when traffic sent over connection
Message-Id: <54C25736.2030302@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJi99x1irCJMuwb06HpB0XFyFZpZPWa6b2E3pVGQyE_qJwk5NQ@mail.gmail.com>
In-Reply-To: <CAJi99x1irCJMuwb06HpB0XFyFZpZPWa6b2E3pVGQyE_qJwk5NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/23/15 08:51, Matt Dooner wrote:
> James,
> 
> Thanks for the quick repsonse.
> 
>> What type of connection is this?  Is it by any chance a 3GPP link?
>>  Are you sure you want to connect to this peer?
>> It's also surprising to see a link without authentication enabled, but I guess that's normal in your environment.
> 
> The peer is a rather old wireless radio connected via RS232 and the
> host is an embedded linux system in the same rack acting as a RIP
> router, among other things. That should explain the lack of
> authentication.

Great!  Can you get debug logs from that remote system?  That's the guy
that's having trouble here.

>> the absurdly low MRU 400.  What are they thinking?  What can one reasonably
>> do on an IP link with an MRU smaller than the minimum IP MTU?
> 
> Thanks for pointing this out. I noted that the MRU was low but it had
> not occurred to me that it was actually below the minimum specified by
> IP. I'll have to check with the vendor as to how they're fragmenting
> the traffic. The low MRU might be related to the nature of the
> wireless link, but the purpose of the device is to trasmit IP traffic
> after all.

Actually, that explains the odd MRU pretty well.  If they're using
something like ALOHA, the packet sizes need to be small.  Normally,
that's intentionally hidden by the hardware using something like MNP-4,
V.42, V.120, 802.11, or similar segmentation/reassembly/error-control layer.

However, in this case, it sounds like it's just a raw radio channel.
I'm surprised it's usable.

> Being an RS232 link it is a bit surprising that the peer is fussy aout
> the link quality. Swapping in a new cable makes no difference. We're
> using ppp 2.4.5 (debian 6 package) and have tested 2.4.6 with similar
> results. I have built 2.4.7 for ARM but have not been able to install
> it yet. From looking at the change logs I don't expect much of a
> difference in behaviour though.

No.  It's not the local system that has trouble (I assume that's what
you're referring to here).  It's the remote system that's experiencing
some sort of error that causes it to renegotiate the link.

You need to find out what that error is, and the information exists only
on the peer's system.

> If we replace the linux system with a Cisco router it works. The only
> difference in the negotiation is acceptance of LQR.

Well ... that's a difference.  It's hard to tell, though, without
information from the peer whether that's really the determining
difference or if it's coincidence.

I've run into problems before that ended up being all sorts of issues
unrelated to the LCP negotiation -- such as electrical issues (RS-232
signaling voltage too low, unterminated signal wires) and in-band flow
control failure.  There are too many variables in that swap.

> I agree it looks like the peer is broken as it "gives up" and fails to
> respond to the final ConfReq id=0x3.
> 
> Thanks again for the help, this is valuable information about how to
> proceed from here.

The fact that you've got an RS-232 link is good.  You can put an
analyzer on there.  There are many to choose from (Google is your
friend).  For what it's worth, I've used this one in the past:

http://www.klos.com/products/serialview/

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
