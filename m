From: "Sergio" <sergio@fceia.unr.edu.ar>
Date: Wed, 16 Jun 2004 13:49:35 +0000
Subject: PPP on a remote host
Message-Id: <58134.200.47.10.229.1087393775.squirrel@correo2.fceia.unr.edu.ar>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
    I'm trying to dial out from a RAS (we say,
using it in the less common way) to a terminal
using PPP.
    The tool I have in the RAS to see the modem
is a reverse telnet to it. If I do

telnet some-ip some-line-number

I can write commands to the modem directly (if
I type AT, I see OK in the screen). I can dial
out manually (using ATDT), but I don't know how to
run ppp for a remote port (so, obviously, connection
fails).
    Many thanks
       Sergio



