From: Matthias-Christian Ott <ott@mirix.org>
Date: Tue, 13 Jan 2015 23:39:38 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <54B5ACBA.80502@mirix.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 2015-01-14 00:24, Matthias-Christian Ott wrote:
> It seems that I read over this than and what I wanted to achieve is
> impossible with PPP. I think setting the channel MTU to the MRU is
> unaffected by this and is still wrong though. From RFC 1661:
> 
> 6.1.  Maximum-Receive-Unit (MRU)
> 
> [...]
> 
>     This option is used to indicate an implementation capability.
>     The peer is not required to maximize the use of the capacity.
>     For example, when a MRU is indicated which is 2048 octets, the
>     peer is not required to send any packet with 2048 octets.  The
>     peer need not Configure-Nak to indicate that it will only send
>     smaller packets, since the implementation will always require
>     support for at least 1500 octets.

Another aspect is that if Multilink PPP is used, it might be wrong to
set the MTU based on the MRU. If both peers know that the link MTU is
smaller than 1500 octets and want to encapsulate payloads larger than
the link MTU (that is the interface MTU is bigger than the channel MTU
and Multilink PPP fragments payloads larger the channel MTU), they can
adjust their MRRU and channel MTU accordingly and thus never send PPP
packets larger than the link MTU. If the channel MTU is set from the
MRU, this is not possible.

Regards,
Matthias-Christian
