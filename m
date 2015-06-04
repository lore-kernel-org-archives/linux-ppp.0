From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 04 Jun 2015 17:37:36 +0000
Subject: Re: LCP terminated by peer [LCP TermReq id=0x1]
Message-Id: <55708CE0.5030806@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAF10NHhDYez3+puJNmoDoBCoB3RoHakiS2+WH2ppon+cEdudwA@mail.gmail.com>
In-Reply-To: <CAF10NHhDYez3+puJNmoDoBCoB3RoHakiS2+WH2ppon+cEdudwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 06/04/15 09:54, Gustavo wrote:
> I am trying to get a mobile scanner Motorola MC32N0 (next generation
> in MC3000 Series) working on a PC which is running Ubuntu 8.04, and
> another PC with Ubuntu 14.04. But I have not succeeded after trying
> and investigating a long time.

I don't have access to a manual for this device, but if it has some kind
of debugging or troubleshooting mode in it, this would probably be a
good reason to try it out.

> No errors in output command. No erros in syslog.
> And I have no idea what happens or how to find the cause.
> Files involved are attached.

The peer system is obviously upset about something; that's why it sent
LCP Terminate-Request.  Unfortunately, it didn't bother to include the
optional text explanation of the problem, a feature of that message
that's all too often ignored, so it's a little hard to see what
happened.  Whoever built that system should probably fix that defect.

One thing that stands out in your log is the pointless haggling over
CCP.  You're asking for compression via the freely available algorithms,
and he's asking for compression via Microsoft's proprietary MPPC.  (It
negotiates MPPE, but Microsoft's encryption algorithm has flags that can
[and in this case do] say "use data compression only" -- which is MPPC.)

Based on that, I'd start by adding "noccp" to the configuration.  It's
certainly not doing you any good, and may be hurting.

It also looks like you're asking him to give you DNS server addresses
using Microsoft's proprietary extensions via the "usepeerdns" option.  I
don't see this option in the configuration you supplied, but sending
IPCP Configure-Request with "ms-dns1" and "ms-dns3" is a giveaway.
That's probably not useful here, assuming that this hand-held scanner is
not going to be used as your connection to the global Internet, but it's
probably not harmful.

The peer is asking for DNS server addresses from you.  If you have some
to offer, it might be nice to do so.  You can do that by adding one or
two "ms-dns" options to your configuration.

The peer pretty obviously doesn't support the Magic Number option.
That's baffling -- why would someone not support it?! -- but that does
prompt at least two questions.  The first is whether "nomagic" has any
effect here.  The second is whether you want to talk to someone who has
design flaws like that -- who knows what else is wrong?

I don't know if an MTU of 168 octets is meaningful (!), but I'm guessing
that's something for you to work out.

For what it's worth, I'd start with the simplest possible configuration,
and disable options as I go on the assumption that an implementation
ought to support at least the defaults.  Then get fancy with VJ Header
Compression and the rest.  :-/

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
