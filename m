From: Matthias-Christian Ott <ott@mirix.org>
Date: Tue, 13 Jan 2015 23:24:11 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <54B5A91B.3050002@mirix.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 2015-01-13 21:57, Christoph Schulz wrote:
> Matthias-Christian Ott schrieb am Tue, 13 Jan 2015 18:33:04 +0100:
> 
>> The MTU of a channel of a Multilink PPP link is set from the MRU of a
>> Configure-Ack LCP packet. However, just because the is able to receive
>> packets of a certain size it doesn't mean that the link or the sender
>> are able to transmit packets of that size, so the received MTU of the
>> channel should not be set to the MRU of the peer.
> 
> Well, this seems to be not so easy. I just studied the Kernel source
> code, the pppd source code and the PPP RFCs, so I feel rather
> well-informed in a way ;-)

I dont't doubt that.

> Where are we now? I think your problem lies in this comment in lcp_reqci():
> 
>         /*
>          * He must be able to receive at least our minimum.
>          * No need to check a maximum.  If he sends a large number,
> ---> !!         * we'll just ignore it.
>          */
> 
> You think each PPP implementation has to NAK when a MRU being larger
> than our MTU is REQuested by the peer. Obviously this isn't handled this
> way, at least not by pppd. However, I think your problem is twofold. You
> did not write how big your desired MTU (at the side of peer B) really
> is. I bet that it is smaller than 1500, as you write it is smaller than
> "link MTU minus maximum IP header length minus GRE/L2TP header length".
> However, RFC 1661 requires that each implementation MUST accept packets
> that are 1500 bytes long:
> 
> 6.1.  Maximum-Receive-Unit (MRU)
> [...]
>       The default value is 1500 octets.  If smaller packets are
>       requested, an implementation MUST still be able to receive the
>       full 1500 octet information field in case link synchronization is
>       lost.
> 
> So each attempt to force peer A to request a MRU < 1500 is formally
> wrong as it might be ignored -- even if the peer ACKs this MRU.

It seems that I read over this than and what I wanted to achieve is
impossible with PPP. I think setting the channel MTU to the MRU is
unaffected by this and is still wrong though. From RFC 1661:

6.1.  Maximum-Receive-Unit (MRU)

[...]

    This option is used to indicate an implementation capability.
    The peer is not required to maximize the use of the capacity.
    For example, when a MRU is indicated which is 2048 octets, the
    peer is not required to send any packet with 2048 octets.  The
    peer need not Configure-Nak to indicate that it will only send
    smaller packets, since the implementation will always require
    support for at least 1500 octets.

Regards,
Matthias-Christian
