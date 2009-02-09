From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 09 Feb 2009 12:10:45 +0000
Subject: Re: IFF_RUNNING support for ppp interfaces?
Message-Id: <18832.7493.713937.983324@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
In-Reply-To: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Joakim Tjernlund writes:
> James Carlson <carlsonj@workingcode.com> wrote on 04/02/2009 18:14:44:
> >
> Sorry for the late reply, I got busy and forgot ..
>  
> > Joakim Tjernlund writes:
> > > I wonder how IFF_RUNNING is managed in recent pppd version(s). I very 
> much 
> > > like  to
> > > use IFF_RUNNING to see if the link working in both ends.
> > 
> > For most implementations, IFF_RUNNING cannot be controlled by anything
> > in user space (such as pppd).  Instead, it's set/cleared by the
> > kernel's PPP driver.
> 
> I haven't looked into how ppp is impl. in user/kernel space but I suspect
> that user space would have to help/inform the kernel ppp driver about
> RUNNING status.

The way it works today is that the daemon tears down the interface if
it detects that the interface has failed.

> > Defining "working" is difficult.  Usually, the IFF_RUNNING flag is set
> > if the link is either a demand link waiting for activity or if there's
> > an active serial link underneath the connection, and IFF_UP is set
> > when IPCP successfully negotiates addresses.
> 
> Perhaps, but one could flip RUNNING if echo replies stops or if
> someone pulls the cable. That would be a start

The interface itself is torn down if you set the "lcp-echo-failure"
and "lcp-echo-interval" options.

I don't think that's a problem with the current code.  If you do see a
problem here, then I think it'd be helpful to have the problem itself
described in some detail, rather than focussing on what solution you'd
like to see implemented.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
