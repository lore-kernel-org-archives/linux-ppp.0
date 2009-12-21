From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 21 Dec 2009 13:49:31 +0000
Subject: Re: pppoe uplink goes down several times a day, what is wrong
Message-Id: <4B2F7CEB.6070601@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B2F74DC.4040204@powercraft.nl>
In-Reply-To: <4B2F74DC.4040204@powercraft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jelle de Jong wrote:
> I am wondering what I am doing wrong, is there something I should
> change on the software side? Should I change the modem configuration?
> Stop using PPPoE?

Your debug log shows the following:

Dec 21 06:37:54 sammy pppd[2954]: primary   DNS address 213.75.63.36
Dec 21 06:37:54 sammy pppd[2954]: secondary DNS address 213.75.63.70
Dec 21 08:32:56 sammy pppd[2954]: No response to 4 echo-requests
Dec 21 08:32:56 sammy pppd[2954]: Serial link appears to be disconnected.
Dec 21 08:32:56 sammy pppd[2954]: Connect time 115.1 minutes.

That indicates that your link was up and working for almost two hours,
and then was torn down because the ISP's server suddenly stopped
responding to LCP Echo-Request messages from your system.

If it happens this way every time, then I would suspect that your ISP
may have set a time limit on connections.  Some ISPs are known for doing
such things, especially those that have a dial-up background.  They view
their service as being "on-demand" and thus an always-connected client
is one that's abusing the terms of service.  (That having everyone
connected all the time costs no more than having them connect on demand
doesn't seem to factor into those calculations.  There's no technical
accounting for business rules ...)

If it seems to be "random" rather than a fixed interval, then that's
probably not the problem.  It's possible that the ISP's server is
crashing occasionally or that it's experiencing some sort of
communications problem or that the path between you and that server (the
ATM network) is itself unreliable.  The key information that's needed to
identify such a problem would be on the ISP's systems (or may need some
investigation and analysis).

The bottom line, I think, is that your ISP is the only entity that can
investigate and solve the problem properly.  If your ISP doesn't take
your complaints about reliability seriously, then it's time to find a
new one.

(As for PPPoE, I'd certainly recommend avoiding that if you can.  It's a
horrible mess as a protocol.  In this case, though, I don't think it's
to blame for your problems.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
