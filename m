From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 11 Oct 2016 14:38:22 +0000
Subject: Re: pppd and plugin license
Message-Id: <f748fb12-0ce9-c5ca-0eaf-0f78ade7a6a7@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2c8a99fe282448d4b8c07b347fde7d78@svr-ies-mbx-01.mgc.mentorg.com>
In-Reply-To: <2c8a99fe282448d4b8c07b347fde7d78@svr-ies-mbx-01.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/11/16 09:32, Waller, Claus wrote:
> Hello, 
> 
> I have a question about the pppd and the plugin licenses.
> 
> As I can see the pppd has as license the old style BSD 4 Clause license and some of the plugins which are loaded as a dynamic library are GPL licensed.
> So my question is: Is it true that these licenses are incompatible to each other in the context of the pppd + a loaded plugin?

The mailing list is generally used for discussion of software technical
issues (development, bugs, and the like).  I don't think you'll find
many lawyers here, and I'm virtually certain that _your_ lawyer isn't on
the list.  If you need one, I highly recommend retaining competent counsel.

That said, the files in PPP itself are under various license
restrictions.  Some of the oldest are, as you noted, BSD 4-clause.
Others are BSD 3-clause.  Still others are LGPL.

The plug-ins are under a wider variety of licenses.  None of the
plug-ins are required for normal pppd operation, so I think it'd be
somewhat absurd to say that pppd itself is somehow burdened by the terms
required for any of the plug-ins.

Similarly, saying that pppd is somehow "a work based on" or "derived
from" (as described in GPLv2) any of the plug-ins is clearly wrong, so
clause 2 just doesn't apply.

I often hear people talk about licenses being "incompatible."  Most of
that talk is, I suspect, complete bunkum driven more by purity or fears
of nebulous "risks" rather than actual facts.  So I usually ignore it as
uninformed opinion.

But, of course, I'm not a lawyer, and I'm not your lawyer, so see above
if you have concerns.

(For what it's worth, when I was at Sun, our lawyers told us to package
the objects for the GPL'd plug-ins separately from the rest of the
compiled PPP packages, so that complete sources for the GPL'd parts
could be shipped as required.  But I'm almost certain that their
solution doesn't apply to anyone else other than as a possibly
interesting case study.  From experience, I don't think that any two
lawyers read the same text exactly the same way.  :-/)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
