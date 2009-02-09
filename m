From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 09 Feb 2009 15:17:32 +0000
Subject: Re: IFF_RUNNING support for ppp interfaces?
Message-Id: <18832.18700.496640.25336@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
In-Reply-To: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Joakim Tjernlund writes:
> James Carlson <carlsonj@workingcode.com> wrote on 09/02/2009 13:10:45:
> > I don't think that's a problem with the current code.  If you do see a
> > problem here, then I think it'd be helpful to have the problem itself
> > described in some detail, rather than focussing on what solution you'd
> > like to see implemented.
> 
> I should have been clearer. I think it is a bit rude to tear down/delete
> the ppp interface when it looses a link. Compare with ethernet, when the 
> cable
> is pulled you still see the I/F but the running status is gone so you get 
> a clue
> to what is wrong. For ppp the I/F is just deleted and you can only guess 
> the cause,
> or start looking at logs to find out what happened.

Ah, this is a much higher-level issue, and is only slightly related to
IFF_RUNNING.

The real issue is that (a) there are at least two different "kinds" of
PPP links, (b) the identity of the IP-level object doesn't say
anything about the physical entity, and (c) a bit about pppd design
itself.

With Ethernet, you (generally) know that a "net0" interface is
connected to a single hardware instance, and that IFF_RUNNING
transitions represent changes in the status of that one instance.

With PPP, things are different.  First of all, to point (a), there are
different kinds of PPP links that we have no good way of
distinguishing.  One type is (as you suggest) a point-to-point
connection between two nodes that seldom gets rewired.  This is like
Ethernet, and it'd be nice if there were a way to leave the IP
interface in place and toggle that bit when the link goes down.  It's
still conceptually the "same" interface when it goes up and down.

The other type is the dynamic kind.  The IP interface you see doesn't
represent anything at all about the "wire" because the wire is in some
way virtual -- either a PSTN connection, or tunneled as in L2TP or
PPTP.  The pppd code base actually comes from this world, and the
interface isn't at all the same when it goes up and down.  The "pppX"
interfaces don't have administrative significance in that they don't
identify the underlying link.

To point (b), the "net0" interface is normally used as an
administrative proxy for the wire itself -- the user has a 1-to-1
mapping in his head for the IP interface names and the wires he sees.
That's not so for PPP, where "ppp0" could be "tty0" in one
incarnation, but "tty1" in another.  There's no stable mapping.  (It'd
be nice in some ways if these were actually named "ttyN" ... but
that's probably a bigger issue to deal with.)

For point (c), the way pppd is designed is that the daemon itself is
in charge of the interface, so when the daemon goes away, so must the
interface.  That's unlike Ethernet, where there's no daemon at all;
it's entirely a kernel feature.  Because that user-level bit goes
away, and we don't typically want trash left behind on the system for
the user to clean up, daemon death means interface destruction.

There is an exception to this: on Solaris, you can plumb the
interfaces separately (using ifconfig or /etc/hostname.*) and then use
the "plumbed" keyword to tell pppd that it should use the _existing_
PPP interface and leave it in place when terminating.  In this case,
you get exactly what you've asked about: IFF_RUNNING is turned off
when the PPP link goes down, but the IP interface itself remains in
the list.

If you're not using Solaris, then you'll probably have to check the
documentation for your system (I'm not as familiar with the other
systems), but I suspect there may be no way to do what you're asking
with the design that exists today.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
