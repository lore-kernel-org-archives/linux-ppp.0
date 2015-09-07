From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 07 Sep 2015 14:26:38 +0000
Subject: Re: pppd, pptpd and radius DNS assigns
Message-Id: <55ED9E9E.6090206@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CANso6eGvSYC8WdCD5d7ZXVqb+RQhS4BXz69ZxQX2QQ8YuQ1Yew@mail.gmail.com>
In-Reply-To: <CANso6eGvSYC8WdCD5d7ZXVqb+RQhS4BXz69ZxQX2QQ8YuQ1Yew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 9/7/2015 2:46 AM, Edwardo Garcia wrote:
> Nobody?

I delayed responding because I'm not using freeradius.  I don't know who
might be.  If there's a support list for that software, you might have
better luck over there.  If not, you might be on your own.

>> I try strace but it not too helpful, maybe  I miss an option to make
>> pppd do this?

strace doesn't sound like the right sort of tool for this problem.
Instead, have you tried the pppd "debug" option?

Looking at the RADIUS source (and knowing nothing about it), it looks
like it needs to be compiled with "MSDNS" defined and that you need
RADIUS attributes 28 and 29 set.  Have you done that?

If it works with the ms-dns option from the pppd command line, then I'd
suggest that this is not a problem with pppd itself, but rather with the
RADIUS plug-in.  I'm not sure who supports that, but it looks like it
came from Roaring Penguin.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
