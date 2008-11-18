From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 18 Nov 2008 16:53:45 +0000
Subject: Re: switching to command mode when using a PPPD with a gprs modem
Message-Id: <18722.62233.16576.905016@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul De La Rosa writes:
> Is there a way with pppd to send the '+++' command to temporarily switch
> out of data mode into command mode. I'm using a Siemens tc63 module and
> I need to check signal strength every now and then but I was trying to
> avoid bringing down the whole ppp0 interface to do that check. I tried
> spawning pppd as a child process using the same file descriptor as the
> parent so the parent could send the mode switch and signal strength
> commands but it seems that pppd is reading the data that is returned
> before the parent got it.

This is something that's been discussed a few times.  In order to do
it "right," you'd need to modify the PPP kernel driver to do this
work, so that you don't accidentally stomp too much on packets in
flight.

A slightly better way to do this (rather than the Hayes TIES signal)
is to use the enter-command-mode-on-DTR-drop configuration for the
modem, and then use that to switch back and forth reliably between
data and command mode.  It still requires driver involvement, and it
also requires explicitly doing ATH to hang up (rather than just
closing the device), but it's much more reliable.

Better still is to get a commercial-grade modem that has a separate
performance monitoring interface.  That's what we ended up doing when
I was at Bay Networks; all of the other in-band methods of signaling
are mere hackery in comparison.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
