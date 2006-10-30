From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 30 Oct 2006 13:56:16 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <17734.1152.999122.118128@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christian writes:
> OK, maybe i do not understand everything correctly, let me in short
> explain what i have:
> 
> I have a device which gives me a function to transmit data in a hdlc
> frame, so i can just call some function like:
> 
> tx_frame(char *p, int l);

OK.  Is that in the kernel or outside of the kernel?

If it's in the kernel, then it sounds like that should be used to
construct a device driver that works as a synchronous serial
interface.  Pppd can then open the driver and work normally -- no pty
needed.  (This -- writing a device driver -- isn't a really PPP
issue.)

If it's in user space, then I believe you'll need to re-encode the
data using AHDLC so that you can pass it over a pty.

> then i tried to use pppd with stdin/stdout, but this obviously did not
> work, because there is no boundaries in stdin/stdout so it will fail
> when data packets increase in size or in speed, also i needed to enable
> the sync option which made it work for a few small slowly coming packets.
> 
> I assume sync=no hdlc,

"Sync" means that the device driver is assumed to perform basic
HDLC-like framing.  This means that when pppd writes a single frame,
it'll be transmitted raw (no prepended octets, such as HDLC address or
control, as pppd itself supplies these), with bit-stuffing and FCS
generation being the responsibility of the driver.

That is not true of ptys.

Note that the problem is *NOT* just with pppd itself.  Pppd does not
actually handle the data packets.  Even if you can "trick" pppd into
using some non-sync device as though it were sync, you still need to
deal with the fact that data packets (IP, for instance) are handled in
the kernel.

> and when not using the sync option pppd will do
> hdlc on stdin/stdout, maybe you can enlighten that to me a bit?

When "sync" isn't used, pppd assumes that the driver is asynchronous,
and it uses AHDLC (RFC 1662) coding on the line.

> I have read that i can set a pty end into N_HDLC mode, so that each read
> returns exactly 1 packet, do you think i can handle my task in that way ?

Maybe.  I've never seen that done, and I don't know of any system
where that works.  If it works on Linux, then I guess you may have
found a solution.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
