From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 23 Nov 2004 16:06:20 +0000
Subject: Re: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <16803.24572.906316.493609@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200411231157.43347.arekm@pld-linux.org>
In-Reply-To: <200411231157.43347.arekm@pld-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Arkadiusz Miskiewicz writes:
> Nov 18 16:00:25 arm pppd[17641]: Using interface ppp0
> Nov 18 16:00:25 arm pppd[17641]: Connect: ppp0 <--> /dev/pts/12
> Nov 18 16:00:56 arm pppd[17641]: LCP terminated by peer
> Nov 18 16:00:59 arm pppd[17641]: Connection terminated.

Try running with debug enabled.  The 'LCP terminated by peer' message
indicates that something went wrong when trying to negotiate with the
peer system.  Perhaps there's an authentication problem.

> With 2.4.2 there was no problem with ,,tcflush failed: Bad file descriptor'' 
> on the same kernel.

I've seen it before, but I don't think it's actually harmful.

-- 
James Carlson                                 <carlsonj@workingcode.com>
