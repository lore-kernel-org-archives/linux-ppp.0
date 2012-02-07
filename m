From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 07 Feb 2012 15:30:44 +0000
Subject: Re: CPU processing time between using TCP and UDP
Message-Id: <4F3143A4.8050506@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
In-Reply-To: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Srinidhi M wrote:
> Could you please let me know, which module in TCP/IP is consuming more
> time than UDP? How can we reduce packet processing time when sending
> through TCP stack? Please let me know your thoughts.

Are you sure you wanted to post this message on the Linux PPP mailing list?

Anyway, without knowing a lot about your application, how you're
measuring things, and what environment you're running in, it's a little
hard to guess at what sort of change you might require.  But I'll give
it a try.

Have you tried setting the TCP_NODELAY option and/or redesigning around
TCP_CORK?  If your application does a lot of tiny write(2) calls, you
will sometimes see RTT delays in delivery.  This is normal, and it's
something that the stack does in order to protect the network against
misbehaving (or just inefficient) applications.  You can disable it in
order to force a write(2) to result in a transmission ... but be careful
if you do this, because doing so can result in a flood of tiny packets
if you (say) write a byte at a time.

Have you considered SCTP instead?  If you have a message-oriented
protocol (rather than a stream-oriented one), and you need reliable
delivery, SCTP may be a better option for you than TCP.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
