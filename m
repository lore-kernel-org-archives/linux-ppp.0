From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 28 May 2010 17:28:03 +0000
Subject: Re: Question on pppd / reset?
Message-Id: <4BFFFD23.9020200@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4BFFE5DA.3010608@workingcode.com>
In-Reply-To: <4BFFE5DA.3010608@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PierrotLafouine wrote:
> James Carlson wrote:
>> PierrotLafouine wrote:
>>   
>>> My question is about reset.  I would like to understand more the stack
>>> of the system, and why it failed to reconnect.  The GPRS modem is
>>> connected trought full RS-232 signals, and RS-232 chips is on an ISA
>>> bus.  How does ppp deal with this kind of hadware configuration ?  I
>>> read ppp deal with modem reset, but how ?  Any idea what I should look
>>> at to understand more the root cause of this failure ?
>>>     
>> If I had to bet on it, though, I'd bet on defects in the GPRS device
>> itself. 
> This is also my bet, as software reboot didn't work, and a power down
> was needed to restore communication.  But now the question becomes : how
> RS-232 chips translates a DCD into ISA bus signals ?  I'll check into
> chips datasheet.

It depends on the chipset in use, but there's typically one interrupt
for the chip itself, and the driver has to read an interrupt status
register to determine which interrupt(s) need to be handled.  The driver
will have a low-level interrupt handler that vectors off based on the
contents of this register to handler routines for modem status (DCD,
CTS) change, transmit complete, and receive buffer full conditions.  The
handler routines then either set state flags and signal a higher-level
task to send the signal to the process, or perhaps send the signal
directly, depending on the internal design of the driver.  You'd need to
read the driver source to find out exactly what it's doing.

Most (though certainly not all) serial chips used in PC-like hardware
are derived from the 8250/16450/16550 series.  There are some
differences among these, but at least for understanding how the
interrupt mechanisms work, any of the available documents would likely
be sufficient.

I'm not at all sure why you'd want or need to know that, though.  I
doubt it's related to the problem you're facing.

> Your detailed answer (thank you very much) raise me an other questions :
> some embedded boards (ex: BeagleBoard) are provided with GPRS modem. 
> But looking at schematics, I notice most of them only connect Rx and Tx
> between modem and UART/RS-232.  How would pppd deal with a lost of
> carrier in these case ?  Is there a way (ex: command) to detect this
> trought data ?

In short, it can't.  You mentioned in your message that you have modem
controls hooked up, and you asked about how those work, so that's what I
answered.

On a device without standard modem controls, there are two issues:
handling connection start/end and handling flow control.  Both must be
handled "in-band" (using special characters in the data stream) when the
"out-of-band" (separate control signals) are missing.

Connection start/end using in-band signaling is pretty complex and error
prone.  The typical way this is done is by using the Hayes "TIES"
sequence ("+++") to get the modem's attention, and then using "AT"
commands to direct the modem's behavior.  And to detect a disconnected
line, where the modem went down and the peer didn't do the normal LCP
termination handshake, you will need to set up the "lcp-echo-interval"
and "lcp-echo-failure" parameters in pppd, so that the daemon can check
the status of the link periodically and shut it down if it seems to have
failed.

(Note that you can profitably use those parameters on links with
standard modem control signals as well.  They guard against a different
class of failures, and I certainly recommend that they be used when
possible.)

The in-band flow control signaling mechanism is usually XON/XOFF (hex 11
and 13, respectively).  This must be implemented in the serial driver,
and pppd's only responsibility is making sure that the accm (async
control character mask) is set to 0xA0000 so that those characters never
appear in the data itself.

Unlike the connection start/end issue, the flow-control one is fairly
simple and workable in theory, though I can certainly say that bugs in
this area are _extremely_ common.

If this is really what you need, you're pretty much on your own to
design a robust solution.  I wish you luck.  (The simple solution is
defenestration of the offending hardware.  It's all a question of how
much you value your time.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
