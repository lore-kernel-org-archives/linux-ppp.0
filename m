From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Dec 2008 17:26:14 +0000
Subject: Re: PPP Recovery
Message-Id: <18753.19766.302530.950114@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20958060.post@talk.nabble.com>
In-Reply-To: <20958060.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

GauloisID writes:
> I Would like to setup a permanent connection with a local rs232 GPRS modem.
> I Use kernel 2.6.24 and PPP 2.4.4.
> 
> My connection work fine (DNS, ICMP...), but sometimes my GPRS provider drop
> my connection due to timeout, moving....
> 
> Is there any way to tell ppp that sent packet (TCP/UDP) have retransmission
> timeout to indicate that the connection is dead ? In this case it would be
> easy to re-negociate the link.

If you actually want it to be up at all times, then the pppd "persist"
option may be what you want.  If you want it to trigger a new link
when TCP or UDP sends a packet and the link is down, then you want
"demand."

If you want the system to detect a "dead" link -- one where the
low-level connection is still present, but the peer is no longer
running PPP -- then you'll probably want to set up both the
"lcp-echo-interval" and the "lcp-echo-failure" options.

For all of these options, see the man page.

However, beware: GPRS is weird in many ways.  Having unexpected
behavior (compared to "normal" PPP links) is just par for the course,
so, though the above options should help, it's at least possible that
you may encounter situations that pppd can't handle.  I wouldn't be
too surprised if you ended up writing some sort of little monitoring
application that kills off and restarts pppd when there's trouble.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
