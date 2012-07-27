From: Edgard Lima <edgard.lima@gmail.com>
Date: Fri, 27 Jul 2012 22:49:32 +0000
Subject: DCD and EOF
Message-Id: <CAK9rZUB745VY28ptj29dNDCXVGg0CAF3H0_iDZoTkbpNwQmA9A@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

I'm in charge of change ppp code to try to speed up connection establishment
and redial in case of connection lost as soon as possibly,

By reading the FAQ
http://ppp.samba.org/FAQ.html

I've found ?

Q: When the modem hangs up, without the remote system having
terminated the connection properly, pppd does not notice the hangup,
but just keeps running. How do I get pppd to notice the hangup and
exit?
A: Pppd detects modem hangup by looking for an end-of-file indication
from the serial driver, which should be generated when the CD (carrier
detect) signal on the serial port is deasserted. For this to work:

The modem has to be set to assert CD when the connection is made and
deassert it when the phone line hangs up. Usually the AT&C1 modem
command sets this mode.
The cable from the modem to the serial port must connect the CD signal
(on pin 8).
Some serial drivers have a "software carrier detect" mode, which must
be *disabled*. The method of doing this varies between systems. Under
SunOS, use the ttysoftcar command. Under NetBSD, edit /etc/ttys to
remove the "softcar" flag from the line for the serial port, and run
ttyflags.


So where is this EOF check in the PPPD code?
How could I be sure the serial device driver answer with EOF when DCD
line is up? Could you please point out this on serial driver code?

Thanks in Advance,
Edgard

-- 
Edgard Lima
http://EdgardLima.com
http://www.linkedin.com/in/edgardlima
edgard.lima@gmail.com
