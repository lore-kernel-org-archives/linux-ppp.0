From: James Carlson <carlsonj@carlson.workingcode.com>
Date: Wed, 16 Jun 2004 14:07:42 +0000
Subject: PPP on a remote host
Message-Id: <16592.21550.519288.475021@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <58134.200.47.10.229.1087393775.squirrel@correo2.fceia.unr.edu.ar>
In-Reply-To: <58134.200.47.10.229.1087393775.squirrel@correo2.fceia.unr.edu.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Sergio writes:
 >     I'm trying to dial out from a RAS (we say,
 > using it in the less common way) to a terminal
 > using PPP.

What brand of RAS device is this?  Most RAS implementations have a
built-in PPP dial-out capability.  If at all possible, I recommend
using that rather than putting something together with telnet.

 >     The tool I have in the RAS to see the modem
 > is a reverse telnet to it. If I do
 > 
 > telnet some-ip some-line-number
 > 
 > I can write commands to the modem directly (if
 > I type AT, I see OK in the screen). I can dial
 > out manually (using ATDT), but I don't know how to
 > run ppp for a remote port (so, obviously, connection
 > fails).

If you can't use the local PPP dial-out on that RAS box for some
reason, then the next best thing would be to use a raw TCP connection
to the serial port, not telnet.  Most RAS implementations have two
ranges of of TCP ports -- one range speaks telnet protocol, and the
other gives raw (binary) access to the serial port.  If you use the
latter, you can use the "socket host:port" option in pppd to connect
to the serial port.  Otherwise, you'll need to use the 'pty' option
and run telnet under pppd.
