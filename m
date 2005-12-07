From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 07 Dec 2005 13:10:56 +0000
Subject: Re: Basic Question.
Message-Id: <17302.57184.164049.487416@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <a2617ef40512061213v7823a29fr@mail.gmail.com>
In-Reply-To: <a2617ef40512061213v7823a29fr@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> One of the real problems with linux appears to be the difficulty of
> associating a unit with a physical device. Thus with ethernet, it depends
> on which hardware device the system just happens to look at first which
> gets called eth0.

OK, but it's also the case that pppd is *more* than just Linux.  In
fact, it predates Linux by quite a bit.  So, I'd argue that the
solution needs to work for other systems (BSD, Solaris) as well as
Linux.

> The aliases established in /etc/modprobe.conf seem to be
> just ignored.  Similarly with ppp, and everything else. This really
> needs a unified way of dealing with it. the unit option in pppd helps, but
> if for some reason that unit is unavailable, ppp simply grabs whatever
> anyway.
> 
> To have to set up a script which determines which units are which and
> rewrites all references to the unit number is not only a kludge but is also
> extremely prone to bugs. That is not the way to go.

I agree that's kludgy.  One of the bad parts of it is that the
interface is established and enabled *before* the filters get applied,
and that's almost certainly not what anyone concerned with security
wants.

But even if we could somehow nail down the meaning of "ppp0" and
"ppp1" and so on, I think we'd be no better off than we are today for
pppd.  The problem I see is that a system with a number of links and a
large number of peers (not just this simple configuration with two
essentially fixed ADSL links, as the original poster described) will
run into reuse problems.

In other words, "ppp0" doesn't mean the same thing over time, and it'd
be just absurd and unmanageable to allocate ppp0 through ppp9999 for
10,000 separate users and somehow keep those configurations straight.

Communicating between pppd and IP filtering (and routing and other
subsystems) by way of overloading unit number to mean "user" doesn't
seem to be a scalable or manageable answer to me.

Instead, I'd rather see these things show up as features that can be
controlled on a per-peer basis.  That'd mean at least authenticated
peer name, and probably underlying physical or virtual interface as
well (e.g., if you have ttyS0 connected to a modem on the PSTN and
ttyS1 hard-wired to an embedded system, you may have different
security and routing requirements for each).

One way to do this would be with configuration options in pppd, so
that new things could be specified in options, options.ttyname,
chap-secrets, or the command line as appropriate (per-node,
per-device, per-user, or per-invocation).  I'm not sure that's the
best way, though, and it probably requires some thought.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
