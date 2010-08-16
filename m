From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 16 Aug 2010 14:07:10 +0000
Subject: Re: Intervening IPCP Configure Requests
Message-Id: <4C69460E.4000309@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <29408130.post@talk.nabble.com>
In-Reply-To: <29408130.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 08/16/10 09:33, Jouko Nikula wrote:
> First of all thanks a lot for your reply and sorry about my triple post. It seems that nabble was too complicated for me.

No problem.  I did wonder what happened there.  ;-}

> James Carlson wrote 12.08.2010 16:20:
>> Of course, you've got the source, so if you just want to hack something
>> into the middle of ipcp_reqci() in pppd/ipcp.c, go ahead.  Depending on
>> how your "validation" functions work, you might produce odd results on
>> the wire, including possibly non-converging behavior with some peers.
>> But if you're not worried about that or if it works for you, then go
>>  for it.
> 
> I did some checks and I think this might work for me. For my application it should be ok that an IPCP configure request blocks for maybe a long time, before it is either Ack'ed or connection is terminated. Do I understand correctly that blocking is the part where you think that problems could arise?

Yes, it's the blocking that I'd be worried about.  Note that this blocks
everything in PPP negotiation -- not just IPCP, but all other protocols
that might be negotiating at the same time.

If it works for you, that's great, but I don't think it's the right
general approach to the problem.

> Also do I understand correctly that you are not interested in a patch where I would allow this behaviour with synchronous hooks?

I'd be a little concerned that someone else in the future would try the
same thing and run himself into trouble ... but if the hooks can be
inserted cleanly and coherently, I wouldn't be opposed.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
