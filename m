From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 03 Mar 2010 13:37:48 +0000
Subject: Re: some problem
Message-Id: <4B8E662C.9060206@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1267602954.2112.31.camel@rs.local>
In-Reply-To: <1267602954.2112.31.camel@rs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Murali K. Vemuri wrote:
> When I run the PPP, I am getting some kind of "Failed" message from Chat
> program and after few seconds, PPP sends out LCP Conf req and I am not
> getting any response.

Your chat script is malformed.  You have this:

AT+CGDCONT=1,"ip","web.sktelecom.com",,,
ATDT*98#
CONNECT

But the syntax for chat is pairs of strings in "expect send" format.
This means that each one of those strings above is something we're
expecting to see from the modem, and we send nothing at all.

What you should have is something more like this:

"" AT+CGDCONT=1,"ip","web.sktelecom.com",,,
OK 'ATDT*98#'
CONNECT

That says:

  - expect nothing at first; just send
  - send the "AT+..." string
  - expect "OK" as a response
  - then send the "ATD..." string
  - finally expect "CONNECT" as a response before exiting to PPP

See the chat man page and your modem's documentation for details.  I
don't know off-hand if the AT commands you're using are necessarily the
right ones, so there's some guesswork involved.

The log file shows this failure:

Jan  1 00:01:37 (none) local2.info chat[91]: abort on (BUSY)
Jan  1 00:01:37 (none) local2.info chat[91]: expect
(AT+CGDCONT=1,"ip","web.sktelecom.com",,,)
Jan  1 00:02:22 (none) local2.info chat[91]: alarm
Jan  1 00:02:22 (none) local2.info chat[91]: Failed

Note that we were expecting to receive a string that we should have been
sending, and that the "alarm" (time-out) went off, resulting in failure.
 That's symptomatic of a malformed chat script.

This next part is strange, and I can't explain it.  It looks like pppd
plows ahead even though the script obviously failed.  I don't know if
this is a platform bug (is this UNIX or something else?), or if it's
some sort of obscure problem in pppd.

Jan  1 00:02:22 (none) daemon.debug pppd[88]: device script returned: 768
Jan  1 00:02:22 (none) daemon.info pppd[88]: Serial connection established.

In any event, pppd should have aborted without attempting to run LCP.
LCP is unlikely to be useful at all if the chat script fails.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
