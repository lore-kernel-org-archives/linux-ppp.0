From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 01 Apr 2008 22:05:08 +0000
Subject: Re: LCP Renegotiates After IP Connection
Message-Id: <18418.45460.618824.427439@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1207083431.8474.15.camel@pago>
In-Reply-To: <1207083431.8474.15.camel@pago>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> Now, looking at your log in more detail ... I'm surprised that you get
> an LCP ConfReq and ConfAck sequence up front consisting of 10 pairs of
> packets, each with the same id and magic number.  It is as if the

That's not a pppd problem.  We're sending Configure-Request (over and
over on the normal restart timer), and the peer is sending
Configure-Ack each time, but isn't bothering to send
Configure-Request.

The peer is either confused or broken.  Based on the combination of
symptoms, that's not too surprising.

> embedded device is echoing the packets back to your host.

No, it's not.  It's sending Configure-Ack in response.  I don't see
anything wrong here, other than the fact that we're stuck in AckRcvd
state because the peer won't send Configure-Request.

>  But I thought
> pppd had code to detect that, and there's no sign of that detection
> triggering.

There's no loopback here, so nothing to detect.

> I suggest you use the record option and use pppdump or wireshark on the
> result, so as to find out what is happening.
> 
> Other than that ... sounds like the embedded device wants something
> different.  If it works in a stable fashion with something else, a dump
> of that data stream may be handy for comparison.

I guess it depends on your tolerance level for broken devices and how
much you value your time.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
