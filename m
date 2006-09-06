From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 06 Sep 2006 21:53:30 +0000
Subject: Re: serial device access from welcome script
Message-Id: <17663.17242.449862.693702@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200609061445.20406.thilo@riessner.de>
In-Reply-To: <200609061445.20406.thilo@riessner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thilo Riessner writes:
> >From a program called by the welcome script which tries to access the serial 
> port (in this case /dev/ttyI0) I get the errormessage:
>         Port or socket open error!
> I guess, that the serial port is blocked by the pppd.
> Is there any possibility to access the serial port nevertheless?

You shouldn't be trying to access the port directly.  Instead, when
the "welcome" script runs, your script's standard input and standard
output are connected directly to the tty.

You should be able to use 'read' and 'echo' (or whatever your
scripting language supports) without having to open anything.

This is true for "connect", "disconnect", "init", and "pty" as well.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
