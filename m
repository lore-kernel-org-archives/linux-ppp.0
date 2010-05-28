From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 28 May 2010 15:48:42 +0000
Subject: Re: Question on pppd / reset?
Message-Id: <4BFFE5DA.3010608@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PierrotLafouine wrote:
> My question is about reset.  I would like to understand more the stack
> of the system, and why it failed to reconnect.  The GPRS modem is
> connected trought full RS-232 signals, and RS-232 chips is on an ISA
> bus.  How does ppp deal with this kind of hadware configuration ?  I
> read ppp deal with modem reset, but how ?  Any idea what I should look
> at to understand more the root cause of this failure ?

It's not very different from any other tty-using application on UNIX,
but I'll give details anyway.

Loss of carrier on the modem will normally cause the RS-232 DCD (Data
Carrier Detect) signal to be de-asserted.  When this happens, the serial
driver in the host system will generate a hardware interrupt that in
turn sends SIGHUP to the process group that has this port as a
controlling terminal.

For normal use of pppd, we fork into the background and open the serial
port, so that becomes the controlling terminal for the process.  If you
run with "debug" mode in pppd and have syslog's "daemon.debug" directed
to a file, you should see SIGHUP being handled by pppd when this happens.

Internally, this causes "got_sighup" to be set, which then results in
"kill_link" being set.  We then terminate LCP, which eventually causes
the_channel->disconnect() and the_channel->cleanup() to run.  That last
one does a close() on the tty file descriptor, severing our connection
to the serial port.

The last close on the tty file descriptor should cause the driver in the
kernel to de-assert DTR (Data Terminal Ready) and RTS (Request To Send)
signals that the modem sees.  With a normally configured modem, these
should result in the modem being reset back to a known state.

What can go wrong?  Well, many things.  It helps a lot to have a
stand-alone serial analyzer when debugging things like this (Klos
Technologies makes a decent one; there are many others available),
rather than stumbling in the dark.

Here's a partial list of the sorts of things that I've seen or heard of:

  - The "modem" itself may have crashed or gotten stuck.  Note that with
    GPRS, you're really dealing with something that's more like an ISDN
    TA in terms of complexity.  It usually does protocol translation as
    well as local processing of some of the messages you send.  It's not
    just a simple character-based device as traditional wired telephone
    modems once were.

  - Timing problems on the wire combined with unusual modem issues
    sometimes cause the link to become wedged.  A classic case of this
    happens with a "smart" modem-like device seeing RTS from the host
    drop during the disconnect sequence, interpreting it as an assertion
    of flow control, and then locking up while waiting for the host to
    become ready again.  (Which of course never happens.)

  - It's possible that the serial driver has some sort of defect.  This
    isn't altogether unheard of; it's surprisingly hard to write a
    decent driver.  Defects here could cause the driver to cease
    handling interrupts (and thus never "see" the loss of DCD), or get
    "stuck" due to a mishandled transmit or receive interrupt such that
    all I/O stops.

    For what I not-too-humbly consider to be a nifty instance of such a
    problem, see:

    http://blogs.sun.com/carlson/entry/close_hang_or_4028137

  - It's possible that some other software on the system has the serial
    port open, or that a hidden fork() call in some library that pppd
    has called has leaked the tty descriptor, causing it to be held
    open.  In that case, you'd end up with pppd being unable to re-open
    the port, because it's now stuck "busy," and the modem unable to
    reset itself because DTR never drops.

  - It's possible for plug-ins or scripts used with pppd to cause
    erroneous operation.

  - It's possible for the OS you're using to have bugs related to serial
    port use (apart from the driver bugs suggested above).

  - It's possible that there are still bugs somewhere in pppd when
    serial ports are closed and reopened.  I haven't seen any, but that
    certainly doesn't mean they're not there.

If I had to bet on it, though, I'd bet on defects in the GPRS device
itself.  I haven't heard of one yet that was a worthwhile use of
someone's time and effort.  At least not mine.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
