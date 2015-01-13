From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Jan 2015 21:31:29 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <54B58EB1.7080101@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/13/15 15:57, Christoph Schulz wrote:
> (lcp.c, lines 132-133), and it is only used when setting the MTU of the
> network interface. The non-multilink case:
[...]
>     netif_set_mtu(f->unit, MIN(MIN(mtu, mru), ao->mru));
>                                ^^^                ^^^^^^^

That part looks good to me.  Capping at ao->mru means that the user can
specify the "mtu" option and force the actual link MTU to be anything he
wants (up to the peer's advertised MRU).

> (multilink.c, lines 128-133). The multilink case:
> 
>     mtu = MIN(ho->mrru, ao->mru);
>               ^^^           ^^^^^^^
>     [...]
>     netif_set_mtu(0, mtu);

That also looks good.  Again, the user can specify anything he wants
with the "mtu" option.

That's why I suggested setting "mtu" in the pppd options as a reasonable
work-around.

> 6.1.  Maximum-Receive-Unit (MRU)
> [...]
>       The default value is 1500 octets.  If smaller packets are
>       requested, an implementation MUST still be able to receive the
>       full 1500 octet information field in case link synchronization is
>       lost.
> 
> So each attempt to force peer A to request a MRU < 1500 is formally
> wrong as it might be ignored -- even if the peer ACKs this MRU.

Not so much "wrong" as "pointless."  Why bother to ask for less?  You
don't have to pad the packets out to the full MRU, so why do you care
what the peer has advertised as a maximum?  All that matters is that (by
acking the value) you've promised not to send anything bigger.  By
adhering to a smaller limit, you're certainly in compliance with the
peer's limitations.

Note that the "synchronization" bit there is obscure, but refers to the
possibility of LCP renegotiation.  For some (many?) implementations, LCP
renegotiation (unfortunately!) causes link failure, so everyone avoids it.

In truth, the reason you're required to support an MRU of 1500 is that
the peer can always just Configure-Reject the option.  If he does that,
then what do you do?  If the peer rejects it, that's the end; the option
ends up with the default value, which is 1500.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
