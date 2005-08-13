From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 13 Aug 2005 18:22:10 +0000
Subject: Re: Spontaneous LCP ConfReq after connection made
Message-Id: <17150.14930.541261.639333@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050812073342.GL28862@hp.com>
In-Reply-To: <20050812073342.GL28862@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> Unfortunately, there is no other service provider; all transmission
> towers within radio range are owned by the one provider, and no
> comparable service is available.  DSL is not available, and copper pairs
> can only do about 24kbit/sec.  It's a 24-month contract, I'm up to the
> ninth month, and the contract terms include a "supported software"
> clause.  It was working reasonably well before now.

Ugh.  Sounds like an expensive experience.

If it's not for a mobile station (assuming so, since you mentioned
DSL), the one means you didn't suggest was cable.  I take it that's
not an option.

(There's also satellite, but I certainly wouldn't recommend that due
to the latency issues.  Though I suppose that any functioning
connection is better than none.)

> Apart from the IP address change, there doesn't seem to be any reason
> for the renegotiation.  These renegotiations happen in the middle of the
> cell phone call; the cell call is not terminated.  But the provider

There are a few things that could be causing it, even if there doesn't
appear to be a cause.

In general, PPP will want to renegotiate if the lower layer appears to
have gone down and back up.  If the RF layer is telling their system
that your telephone has disconnected and come back, it may well
trigger a renegotiation on that glitch.  Another possibility (since
you mention cellular service) is that something about your location or
the phone itself is causing it to hand off frequently between sites.
(That's not _supposed_ to happen, but it's at least theoretically
possible.)

And since it gets them extra cash to have this bug and most people
won't notice, they probably aren't too highly inclined to fix it.

Here's another possibility: I once saw a bug in a particular embedded
implementation where they apparently accidentally left a timer running
after setting LCP to Opened state that caused renegotiation.  It was
triggered when the 'wrong' side sent the first LCP message -- if I
recall correctly, they were expecting that the answerer (the "server")
would send the first packet, and somehow had managed to code their
implementation to depend on that.  (Pretty hard to do, I think, when
the RFC has the state machine right in it ...)

Obviously, of course, LCP is completely symmetric, and there's just no
reason for such a bug (and it's hard for me to imagine how you could
possibly get it that wrong), but bugs are funny that way.

Using the "silent" option might help, if the problem is similar.

> charges based on their PPP records, not their cell call records.  As a
> result of the renegotiation, a new call record is placed in the service
> provider's billing system, costing me $USD 0.385 each renegotiation.
> I've had it renegotiate 30 times in a minute, before I added an if-down
> script to SIGHUP it.  The service provider has reversed these charges,

There's a fine line, I think, between deliberately foolish billing
practices and just outright fraud.

> I've not tried the PPP implementation that has been provided by the
> modem manufacturer, because it is Windows specific, I don't run Windows
> here, and as the modem is USB connected instead of serial port connected
> I don't know a way to catch the stream for analysis.  But thanks for the
> idea, I'll see if I can get the manufacturer to provide information.
> (So far they have been silent since I told them I am using Linux).

Is there any chance you could borrow someone else's machine for a day
to troubleshoot the problem?  One of the unfortunately good things
about Windows is that it's often pretty easily available.

Even if it's USB, there's a PPP-level "advanced" debug log buried in
the Windows client, and that might provide enough clues to go on.
Plus, in the good case, it fails just as miserably as Linux does,
proving to them that they have a problem and owe you a fix, and that
it's not your "unsupported" software that's at fault.

> > Getting to the bottom of such issues is essentially debugging that
> > remote peer from afar.  It's not easy at all.
> 
> Agreed.  So in addition to whinging I could try to find what innocuous
> behaviour Linux PPP is doing that apparently causes the peer to
> renegotiate.  Have you any suggestions for options to try blindly in
> case they have an effect?

As above, "silent" is one possibility.

Another would be to start refusing some of the options, such as
"nopcomp" and "noaccomp".

> I've tried "asyncmap ffffffff" and "escape

Instead of ffffffff, I'd use "default-asyncmap".  I doubt it'll help,
though.

> Have you any suggestions for things to look for in the data sent to the
> peer that seems to trigger the event?

Well, if varying the options doesn't help, and borrowing a Windows
machine doesn't get to it, and you still really want to debug this,
then the next step would probably be to start varying the timing.
Fortunately, pppd's negotiation mechanisms are all in user space, so a
few well-placed "sleep(1);" hacks might either avoid the problem or
open the hole wide enough so that you can see it happen every time.

Do they support anything besides Windows?  If they support either
standalone routers or perhaps Macs you might be able to get something
cheap on ebay to use as a gateway or NAT.  A solution like that (if
it's supported and actually works) might be cheaper than trying to fix
whatever's wrong here ... don't forget that your time is worth
something, too.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
