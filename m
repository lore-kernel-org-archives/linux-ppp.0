From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 03 Oct 2016 12:15:28 +0000
Subject: Re: Problem: How to force(?) pcomp and accomp
Message-Id: <ec56a132-e40c-b5f5-cef5-d241e9ef67e0@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
In-Reply-To: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/01/16 11:38, Manish Kambdur wrote:
> I didn't see any compile time options to disable address and  and
> pcomp support from pppd, but to me it seems like that's what has
> happened in OpenWRT version of pppd.

Yes, it does seem like the OpenWRT version is behaving that way.
Assuming you can't find those options present in /etc/ppp/options or
some other file related to normal pppd configuration, I think it'd be
reasonable to assume that the version of pppd used in OpenWRT has been
modified, and you should ask the maintainers of that software for help.

If this is a reasonably modern version of pppd, you should be able to
use the "dump" option to print out all of the options and the places
where those options are set.

This would hardly be the first time some distributor has modified pppd
for their distribution.  A quick google search on "openwrt patches pppd"
turns up things like this:

https://dev.openwrt.org/ticket/10095

I don't see changes for accomp/pcomp in their patch list, but it does
seem like they do make some changes before redistributing.

> I tried reading up about ppp and pppd, but I couldn't resolve this
> problem. Any help will be appreciated.

Wish I could offer more, but I think you've correctly diagnosed the problem.

For what it's worth, I think the peer you're talking to is garbage.  At
a minimum, any reasonable implementation of PPP should accept the
defaults, which means that dropping the link just because your end
doesn't want to do ACFC and PFC is pure nonsense.  How could any
competent implementation fail to operate without header compression?
How much do you trust that peer if they can't get the basics of PPP right?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
