From: David Miller <davem@davemloft.net>
Date: Mon, 12 Oct 2009 10:32:46 +0000
Subject: Re: NOHZ: local_softirq_pending 08
Message-Id: <20091012.033246.56701176.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AD1BF06.3050103@phoenixsoftware.de>
	<1255261251.4095.143.camel@johannes.local>
	<4AD2E8C8.4060205@imap.cc>
In-Reply-To: <4AD2E8C8.4060205@imap.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tilman@imap.cc
Cc: johannes@sipsolutions.net, hidave.darkstar@gmail.com, linux-kernel@vger.kernel.org, tglx@linutronix.de, linux-wireless@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org

From: Tilman Schmidt <tilman@imap.cc>
Date: Mon, 12 Oct 2009 10:28:56 +0200

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> [CCing PPP people]
> 
> Am 11.10.2009 13:40 schrieb Johannes Berg:
>> On Sun, 2009-10-11 at 13:18 +0200, Tilman Schmidt wrote:
>> 
>>> Can you explain a bit more what that message is about?
>>> I am encountering it in a completely different context
>>> (PPP over ISDN) [...]
>> 
>> Basically, calling netif_rx() with softirqs enabled.
> 
> AFAICS that would have to be the netif_rx() call in
> ppp_receive_nonmp_frame() [drivers/net/ppp_generic.c#L1791],
> called (via others) from the tasklet work function
> ppp_sync_process() [drivers/net/ppp_synctty.c#L545].
> Should that be changed to the
> "if (in_interrupt()) netif_rx(skb) else netif_rx_ni(skb)"
> stanza from the linux.kernel.wireless.general thread then?

The PPP receive paths in ppp_generic.c do a local_bh_disable()/
local_bh_enable() around packet receiving (via ppp_recv_lock()/
ppp_recv_unlock() in ppp_do_recv).

So at least that part is perfectly fine.

ppp_input(), as called from ppp_sync_process(), also disables BH's
around ppp_do_recv() calls (via read_lock_bh()/read_unlock_bh()).

So that's fine too.

Do you have a bug report or are you just scanning around looking
for trouble? :-)
