From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 03 Mar 2010 21:40:07 +0000
Subject: Re: some problem
Message-Id: <4B8ED737.3000107@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1267602954.2112.31.camel@rs.local>
In-Reply-To: <1267602954.2112.31.camel@rs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron wrote:
> On Wed, Mar 03, 2010 at 11:41:15PM +0900, Murali K. Vemuri wrote:
>> Jan  1 00:02:37 (none) local2.info chat[109]: send (AT^M)
>> Jan  1 00:02:37 (none) local2.info chat[109]: send (AT
>> +CGDCONT=1,"ip","web.sktelecom.com",,,^M)
>> Jan  1 00:02:38 (none) local2.info chat[109]: send (ATDT*98#^M)
>> Jan  1 00:02:38 (none) local2.info chat[109]: expect (CONNECT)
>> Jan  1 00:03:23 (none) local2.info chat[109]: alarm
> 
> There's no evidence in that chat log that you are receiving anything
> back from the modem.  You should receive OK in response to AT and
> AT+CGDCONT.  Can you confirm that with a manual connection between
> keyboard and modem?

More to the point, it looks like he removed the "OK" that I had in my
sample chat script, so even if it happens, he's not waiting for it.

It's important to note that most modem-like devices will balk if you
send back-to-back AT commands.  Internally, they don't design using the
usual sorts of UARTs that ordinary computers use.  Instead, for
autobauding, they use bit-bashing techniques.  One of the consequences
of this is that if you send a new character (particularly "A") right as
the modem is attempting to respond, it will treat that as a request to
abort the previous command.

Thus, you have to stop and wait for each "OK" response, or it'll fail
miserably, and that's not what he's doing.

Miniterm, kermit, cu or equivalent sounds like the right debugging tool
at this point.  And the programmer's reference manual and tech support
line for the manufacturer might be handy.  I don't think the device
works, at least here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
