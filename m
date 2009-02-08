From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Sun, 08 Feb 2009 19:23:40 +0000
Subject: Re: IFF_RUNNING support for ppp interfaces?
Message-Id: <OF916C07CE.8CD1EDF8-ONC1257557.006A2CDC-C1257557.006A98FF@transmode.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
In-Reply-To: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson <carlsonj@workingcode.com> wrote on 04/02/2009 18:14:44:
>
Sorry for the late reply, I got busy and forgot ..
 
> Joakim Tjernlund writes:
> > I wonder how IFF_RUNNING is managed in recent pppd version(s). I very 
much 
> > like  to
> > use IFF_RUNNING to see if the link working in both ends.
> 
> For most implementations, IFF_RUNNING cannot be controlled by anything
> in user space (such as pppd).  Instead, it's set/cleared by the
> kernel's PPP driver.

I haven't looked into how ppp is impl. in user/kernel space but I suspect
that user space would have to help/inform the kernel ppp driver about
RUNNING status.

> 
> Defining "working" is difficult.  Usually, the IFF_RUNNING flag is set
> if the link is either a demand link waiting for activity or if there's
> an active serial link underneath the connection, and IFF_UP is set
> when IPCP successfully negotiates addresses.

Perhaps, but one could flip RUNNING if echo replies stops or if
someone pulls the cable. That would be a start

 Jocke

