From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Mon, 09 Feb 2009 14:43:05 +0000
Subject: Re: IFF_RUNNING support for ppp interfaces?
Message-Id: <OF1C512EBB.91ECD4C4-ONC1257558.004C3F36-C1257558.0050E906@transmode.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
In-Reply-To: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson <carlsonj@workingcode.com> wrote on 09/02/2009 13:10:45:
> Joakim Tjernlund writes:
> > James Carlson <carlsonj@workingcode.com> wrote on 04/02/2009 18:14:44:
> > >
> > Sorry for the late reply, I got busy and forgot ..
> > 
> > > Joakim Tjernlund writes:
> > > > I wonder how IFF_RUNNING is managed in recent pppd version(s). I 
very 
> > much 
> > > > like  to
> > > > use IFF_RUNNING to see if the link working in both ends.
> > > 
> > > For most implementations, IFF_RUNNING cannot be controlled by 
anything
> > > in user space (such as pppd).  Instead, it's set/cleared by the
> > > kernel's PPP driver.
> > 
> > I haven't looked into how ppp is impl. in user/kernel space but I 
suspect
> > that user space would have to help/inform the kernel ppp driver about
> > RUNNING status.
> 
> The way it works today is that the daemon tears down the interface if
> it detects that the interface has failed.
> 
> > > Defining "working" is difficult.  Usually, the IFF_RUNNING flag is 
set
> > > if the link is either a demand link waiting for activity or if 
there's
> > > an active serial link underneath the connection, and IFF_UP is set
> > > when IPCP successfully negotiates addresses.
> > 
> > Perhaps, but one could flip RUNNING if echo replies stops or if
> > someone pulls the cable. That would be a start
> 
> The interface itself is torn down if you set the "lcp-echo-failure"
> and "lcp-echo-interval" options.
> 
> I don't think that's a problem with the current code.  If you do see a
> problem here, then I think it'd be helpful to have the problem itself
> described in some detail, rather than focussing on what solution you'd
> like to see implemented.

I should have been clearer. I think it is a bit rude to tear down/delete
the ppp interface when it looses a link. Compare with ethernet, when the 
cable
is pulled you still see the I/F but the running status is gone so you get 
a clue
to what is wrong. For ppp the I/F is just deleted and you can only guess 
the cause,
or start looking at logs to find out what happened.

Makes life a bit harder for routing daemons like Quagga too, I just
stumbled over a bug in Quaggas zebra daemon that lost config for
a ppp interface because the ppp I/F was deleted due to loss of link so
zebra removed all traces of the interface too, including some config
set by the user that was supposed to stay.

Auto delete of ppp interfaces makes it harder for routers to know if
the interface is really deleted by a user(throw away any extra config that
the user might have added) or autodelete due to link loss(keep extra 
config,
should the interface return, apply that config again).

Of course one can work around such things, but that isn't really optimal.

 Jocke
