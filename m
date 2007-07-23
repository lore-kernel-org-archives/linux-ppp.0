From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 23 Jul 2007 11:59:00 +0000
Subject: Re: Can we run a PPP server & client simultaneously???
Message-Id: <18084.38916.801219.418904@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <11741524.post@talk.nabble.com>
In-Reply-To: <11741524.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

LeeD writes:
> Is it possible for linux to support both a PPP server and PPP client (with
> dial on demand) simultaneously on the same serial port?

They can't be _active_ at the same time, but two defined PPP instances
can share a single serial port.  (PPP doesn't have servers or clients.)

> I have a PPP client setup to support dial on demand, however this locks the
> serial port preventing any call answering programs (such as mgetty) from
> using the same serial port and modem.

It's not supposed to do that.  In pppd, main.c blocks for demand first
(waiting for packets in handle_events()), and only calls start_link()
-- which ends up locking the port only when requested via the 'lock'
option -- when there's actual traffic.

So, I don't see how the current code could do what you're describing,
but I'd guess that this is a bug of some sort.

> I have seen server advertised which offer both PPP client and server, so how
> to they do it?

That's a much more complicated question, I think, because you end up
having to deal with 'attaching' an inbound connection to an existing
IP interface configured as demand dial.  This is something that I
think Linux cannot currently do.

On the Annex communications server, we wrote special demand-dial
management code to look up a dormant interface by address and bring it
to life when the peer called us.  That way, the return traffic (reply
packets) wouldn't trigger an outbound attempt that would fail.

On Linux, you may be able to get away with it if both links have
different sets of IP addresses.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
