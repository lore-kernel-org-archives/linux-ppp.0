From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 01 Apr 2008 23:18:04 +0000
Subject: Re: LCP Renegotiates After IP Connection
Message-Id: <Pine.LNX.4.64.0804011615540.29041@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <1207083431.8474.15.camel@pago>
In-Reply-To: <1207083431.8474.15.camel@pago>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 1 Apr 2008, James Carlson wrote:

> James Cameron writes:
>> Now, looking at your log in more detail ... I'm surprised that you get
>> an LCP ConfReq and ConfAck sequence up front consisting of 10 pairs of
>> packets, each with the same id and magic number.  It is as if the
>
> That's not a pppd problem.  We're sending Configure-Request (over and

Who is we? Are you part of this or is this a sort of royal we?

> over on the normal restart timer), and the peer is sending
> Configure-Ack each time, but isn't bothering to send
> Configure-Request.

Sould not your side start to send a ConfReq with something other than
magic?

>
> The peer is either confused or broken.  Based on the combination of
> symptoms, that's not too surprising.
>
>> embedded device is echoing the packets back to your host.
>
> No, it's not.  It's sending Configure-Ack in response.  I don't see
> anything wrong here, other than the fact that we're stuck in AckRcvd
> state because the peer won't send Configure-Request.
>
>>  But I thought
>> pppd had code to detect that, and there's no sign of that detection
>> triggering.
>
> There's no loopback here, so nothing to detect.
>
>> I suggest you use the record option and use pppdump or wireshark on the
>> result, so as to find out what is happening.
>>
>> Other than that ... sounds like the embedded device wants something
>> different.  If it works in a stable fashion with something else, a dump
>> of that data stream may be handy for comparison.
>
> I guess it depends on your tolerance level for broken devices and how
> much you value your time.  ;-}

Or the pressure to make it work by higherups.


>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
