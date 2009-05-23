From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 23 May 2009 18:17:01 +0000
Subject: Re: Fooling PPP into thinking its connected
Message-Id: <18968.15773.427657.82139@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <23684368.post@talk.nabble.com>
In-Reply-To: <23684368.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

f15radar writes:
> I have 3 freewave radios (they are serial radios) that have the ethernet
> stuff disabled.  I am using PPP to connect 2 of the radios.  I want to add
> the third radio.  If I could fool PPP into thinking it was connected (its
> getting all of the data being sent between the other 2) I could add the
> third radio.  Does anyone know how I might do that?

Mostly because of the assumptions built into those first two P's, PPP
doesn't much like multidrop operation.

I can think of a couple of ways to hack this up, though.  You could
modify the third pppd so that it doesn't negotiate at all, and (as
long as the data packets packets weren't interleaved in the air) it
would work.  The crucial problems there are that each of the first two
would (uselessly) receive packets from the other, and you'd need some
static routes on both of them to get packets to the third over the PPP
links.  And, of course, you'd have to hack up pppd fairly
substantially.

The other way to do it would be to modify the kernel's PPP support so
that it can deal with HDLC addressing (as is done with PPP over Frame
Relay).  You'd still have the potential problem of interlaced messages
on the air causing dropped frames, and the (relatively simple) routing
issue, but at least pppd state machines wouldn't need hacking.

(The interlacing problem is simple to describe: when both of those two
stations transmit at once, or even nearly so, what does the third
receive?  If it gets bunches of characters from one and then then
other, without regard to the PPP frame boundaries, then the frames
won't pass through AHDLC decoding.  The third station will see frame
drops.)

If you need it to be reliable, though, your best bet would be to get
equipment that actually supports multiple distinct point-to-point
serial links, or (better yet) a packet-based multi-access mode, rather
than trying to get Point-to-Point operation out of a party line.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
