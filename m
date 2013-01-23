From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 23 Jan 2013 17:06:02 +0000
Subject: Re: PPP on TP-Link router?
Message-Id: <5100187A.9030009@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <50FF425E.4000208@mbm.vn>
In-Reply-To: <50FF425E.4000208@mbm.vn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/23/13 10:51, terry white wrote:
> ... ciao:
> 
>     please excuse the my prior post.
>   
>     i was in the process of deciding, if asking whether a 'tcpdump' of the 
> exiting interface, worth consideration.  and then ...

It couldn't hurt.  But it'll probably show the same thing that the logs
are showing, which is that you're sending and receiving just fine, but
the peer can't hear you.  (The only other thing I think it could reveal
would be that your system is sending malformed packets due to a bug, but
I think that's unlikely given that [a] other people have used this
software successfully and [b] you are receiving data from the peer so at
least something works.)

At that point, you have to determine where your packets are being
dropped.  tcpdump won't show you whether the bits actually make it out
on the wire; it only can show what was scheduled for transmission in the
local driver.  An external packet sniffer could show whether you're
sending viable packets.  Other possible sources of information would be
error counters in the peer's Ethernet driver and any of the
switches/bridges that may stand between your system and the peer.

In any event, it's a very difficult sort of failure to debug unless
you've got the right tools and administrative access.

Perhaps a different angle of attack would help.  Is there some other
system that is able to talk to this peer?  Does Windows or a Mac or
something else talk to it successfully?  If so, then getting a packet
capture with wireshark (or similar) and comparing the sessions in detail
between the working one and the failing one would be quite interesting.

A fair possibility here (based on my sad experiences with PPPoE) is that
the peer is flaking out because one of the optional PPPoE attributes
that it believes to be "necessary" was omitted by your system, and a
mere configuration change will fix the problem.  PPPoE is like that.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
