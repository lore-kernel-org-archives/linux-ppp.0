From: Nicholas Humfrey <njh@aelius.com>
Date: Tue, 16 Feb 2021 00:10:54 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <c0eb49d2-c33e-1ffc-db2d-1dd2e5e0a1ff@aelius.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org


On 14/02/2021 16:23, James Carlson wrote:
> On 2021-02-13 20:03, Nicholas Humfrey wrote:
>> Hi,
>>
>> I originally asked this question on the "Unix and Linux" StackExchange:
>> https://unix.stackexchange.com/questions/634033/configuring-pppd-to-accept-link-local-ipv6-address-from-remote-peer
> Do you have a debug trace?  I don't see one in that posting or here, so
> it's hard to know exactly what we're commenting on.

Debug trace is in a Gist, linked to in the StackExchange question. I 
have just updated the Gist to include both the 'client', 'server' and 
the pppd options file:

https://gist.github.com/njh/ab3282f43c72dcf6932b3693eb7dfca4


>> I have two pppd (v2.4.7) instances running, talking to each over over a
>> serial port link. But I can't work out how to get the 'client' pppd to
>> accept the link-local IPv6 interface identifier provided by the 'server'
>> pppd. I am trying to use static addresses so I know the link-local IP
>> address of the remote peer.
> Perhaps a silly question, but why?  Link locals are used only for the
> IPv6 router discovery, neighbor discovery, and routing protocol
> communication.  Why would anyone care what numbers are assigned as long
> as the two ends are distinct?

A very reasonable question! I am partly doing this as a learning 
exercise. But I think it is also useful for debugging and diagnostics. 
If they can be any two unique identifiers (to that link), it seems 
useful to be able to make them more easily human readable.

The PPP protocol describes a number of different ways to assign 
interface identifiers and pppd supports a number of them. Why does the 
functionality exist (even if a bit broken)?


>> The pppd man page says:
>>    ipv6cp-accept-local
>>      With this option, pppd will accept the peer's idea of our local IPv6
>> interface
>>      identifier, even if the local IPv6 interface identifier was
>> specified in an option.
> This means that we'll accept the peer's IPV6CP Configure-Nak message
> suggesting a different address rather than sticking to our guns.  It
> doesn't mean we won't start out with a legitimate identifier.

So I guess it is only useable when using a PPP implementation other than 
Linux pppd?

As there is no way to configure the 'server' to Nack the clients chosen 
identifier?


>> I have now managed to get it working by hacking ipv6cp.c to keep the
>> local identifier as all-zero, by disabling a couple of calls to
>> eui64_magic_nz. But I am not sure what the proper solution is.
>>
>> Does there need to be an IPv6 equivalent to 'noipdefault' to use in
>> conjunction with 'ipv6cp-accept-local'?
> Yes, I agree there could probably be an option ("noipv6default",
> perhaps) to do this, if only for testing reasons.  But given the lack of
> a compelling application for it, it's hard to see why.

I like the idea of it being explicit - and not change the 
existing/expected behaviour of the existing 'ipv6' option.


nick.

