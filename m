From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Feb 2005 21:33:26 +0000
Subject: Re: Client requesting its authentication
Message-Id: <Pine.LNX.4.61.0502241329140.8903@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 24 Feb 2005 ben_gal@libero.it wrote:

> On Thu, Feb 24, 2005 at 01:15:54PM -0500, James Carlson wrote:
>>> Because I've written a patch to pppd that permits eap-tls authentication.
>>> eap-tls provide mutual authentication, so if you (client) connect to a server,
>>> you want to be sure of its identity, so the authentication can't be
>>> skipped.
>>
>> My understanding of EAP-TLS is that you really don't want EAP to be
>> requested by both sides.
>
> Mine is the same :)
>
>> Instead, one side should request it, and the
>> EAP method *itself* provides mutual authentication.
>
> Ok.
> The server must request it.

There IS NO SERVER. ppp is a point to point protocol in which both sides
have entirely equal status. If you want eap, then ask for it. do not try to
force the other side to ask for it. Both are entirely equal peers.


> But if the server doesn't request authentication?
> The client will connect to an untrusted server.
> We don't want this to happen.

Then ask the other side  to authenticate itself. What is difficult about
that?


>
>> Having both sides request EAP (or any authentication protocol) within
>> LCP means that both sides are intending to independently authenticate
>> the other.  In other words, you'd end up with each side independently
>> and simultaneously sending EAP Request messages and expecting EAP
>> Response messages in return.
>>
>> That doesn't sound like what you want.
>
> No, this isn't. I want the server asking the client EAP.
> And the client refuse connection if there's no authentication.

Why? YOu have this totally weird social model, and are trying to fit the
world into that social model, a world for which it does not fit. 
If you want something, ask. do not sit there waiting and dropping hints for
the other side to ask. This sounds like a bad marriage situation to me.


>
> Because the server must ask.

Why? where does this constraint come from? The wife cannot ask for sex,
only the husband can, and all the wife can do is drop hints? Bad model for
ppp negotiations.


