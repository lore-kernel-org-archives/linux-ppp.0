From: carlsonj@workingcode.com
Date: Thu, 11 Nov 2004 16:09:13 +0000
Subject: Re: PPP Timeout
Message-Id: <16787.36521.406923.445599@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
In-Reply-To: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Rana, Gaurav (STP) writes:
> I have a question about the PPPD timeout.
> 
> I am using PPPD 2.4.2 on Linux (embedded system)
> 
> I successfully establish a connection with a ISP, get an IP address, and then for testing purposes I plug out the modem wire. Subsequently, any application writing (I use write() ) to the pppd socket just hangs and then after 15 minutes or so write() returns with an error. Is there anyway I could reduce this timeout to 5 minutes or so?


Use alarm() or similar functions to set up your own timer.

This isn't a PPP (or pppd) issue at all.  This is a standard TCP/IP
mechanism.  Rather than failing right away, TCP/IP is intentionally
designed to retry for a while before just giving up.  That's because
links and routers and the network in general are not assumed to be
perfectly reliably, and that a link that has gone away may come back
or be replaced with an alternate path.

If you don't like that behavior for some reason, then you need to set
up your own timers and determine what you believe to be a "reasonable"
amount of time to wait for the response.  Beware; you're skating on
thin ice here: if you make the timer too short, then some users won't
be able to use your application on slow or congested networks.

-- 
James Carlson                                 <carlsonj@workingcode.com>
