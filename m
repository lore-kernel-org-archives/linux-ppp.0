From: "Murali K. Vemuri" <murali@uczen.co.kr>
Date: Wed, 03 Mar 2010 14:41:15 +0000
Subject: Re: some problem
Message-Id: <1267627275.2112.37.camel@rs.local>
List-Id: <linux-ppp.vger.kernel.org>
References: <1267602954.2112.31.camel@rs.local>
In-Reply-To: <1267602954.2112.31.camel@rs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James et al.,

Thanks for the response.

I think I made some progress in the right direction.....

anyway,with your suggestions, I made changes in the CHAT script and then
I reverted one change in the pppd/main.c file (that was by mistake).

after that, I re ran the pppd, and these are the messages I got:

Jan  1 00:02:36 (none) daemon.notice pppd[106]: pppd 2.4.4 started by
root, uid 0
Jan  1 00:02:37 (none) local2.info chat[109]: abort on (NO DIALTONE)
Jan  1 00:02:37 (none) local2.info chat[109]: abort on (ERROR)
Jan  1 00:02:37 (none) local2.info chat[109]: abort on (NO ANSWER)
Jan  1 00:02:37 (none) local2.info chat[109]: abort on (BUSY)
Jan  1 00:02:37 (none) local2.info chat[109]: send (AT^M)
Jan  1 00:02:37 (none) local2.info chat[109]: send (AT
+CGDCONT=1,"ip","web.sktelecom.com",,,^M)
Jan  1 00:02:38 (none) local2.info chat[109]: send (ATDT*98#^M)
Jan  1 00:02:38 (none) local2.info chat[109]: expect (CONNECT)
Jan  1 00:03:23 (none) local2.info chat[109]: alarm
Jan  1 00:03:23 (none) local2.info chat[109]: Failed
Jan  1 00:03:23 (none) daemon.err pppd[106]: Connect script failed


Again, the PPPD connection failed. But I believe, may be valid reasons?

BTW, The modem I am using is a 3G Modem (WCDMA) and this modem was
supplied to us by the vendor with some installable software for WINDOWS.

So, my current effort is to create the dialer mechanism for Linux. 
My board uses 2.6.19 kernel and uses "busybox" for most of the general
linux utilities. 

given this background, would it be fair enough to talk to the TELCO &
Modem vendor to fix up the issue or I would need to dig little further
with CHAT script ?

any suggestions plz?

Thanks in advance
Murali

On Wed, 2010-03-03 at 08:37 -0500, James Carlson wrote:
> Murali K. Vemuri wrote:
> > When I run the PPP, I am getting some kind of "Failed" message from Chat
> > program and after few seconds, PPP sends out LCP Conf req and I am not
> > getting any response.
> 
> Your chat script is malformed.  You have this:
> 
> AT+CGDCONT=1,"ip","web.sktelecom.com",,,
> ATDT*98#
> CONNECT
> 
> But the syntax for chat is pairs of strings in "expect send" format.
> This means that each one of those strings above is something we're
> expecting to see from the modem, and we send nothing at all.
> 
> What you should have is something more like this:
> 
> "" AT+CGDCONT=1,"ip","web.sktelecom.com",,,
> OK 'ATDT*98#'
> CONNECT
> 
> That says:
> 
>   - expect nothing at first; just send
>   - send the "AT+..." string
>   - expect "OK" as a response
>   - then send the "ATD..." string
>   - finally expect "CONNECT" as a response before exiting to PPP
> 
> See the chat man page and your modem's documentation for details.  I
> don't know off-hand if the AT commands you're using are necessarily the
> right ones, so there's some guesswork involved.
> 
> The log file shows this failure:
> 
> Jan  1 00:01:37 (none) local2.info chat[91]: abort on (BUSY)
> Jan  1 00:01:37 (none) local2.info chat[91]: expect
> (AT+CGDCONT=1,"ip","web.sktelecom.com",,,)
> Jan  1 00:02:22 (none) local2.info chat[91]: alarm
> Jan  1 00:02:22 (none) local2.info chat[91]: Failed
> 
> Note that we were expecting to receive a string that we should have been
> sending, and that the "alarm" (time-out) went off, resulting in failure.
>  That's symptomatic of a malformed chat script.
> 
> This next part is strange, and I can't explain it.  It looks like pppd
> plows ahead even though the script obviously failed.  I don't know if
> this is a platform bug (is this UNIX or something else?), or if it's
> some sort of obscure problem in pppd.
> 
> Jan  1 00:02:22 (none) daemon.debug pppd[88]: device script returned: 768
> Jan  1 00:02:22 (none) daemon.info pppd[88]: Serial connection established.
> 
> In any event, pppd should have aborted without attempting to run LCP.
> LCP is unlikely to be useful at all if the chat script fails.
> 

