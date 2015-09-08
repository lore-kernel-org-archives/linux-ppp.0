From: Edwardo Garcia <wdgarc88@gmail.com>
Date: Tue, 08 Sep 2015 06:28:06 +0000
Subject: Re: pppd, pptpd and radius DNS assigns
Message-Id: <CANso6eF5AW-60Z=RZRrAejOMpQHNBVTQBaWsdi1ZvbB6NRmUAg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CANso6eGvSYC8WdCD5d7ZXVqb+RQhS4BXz69ZxQX2QQ8YuQ1Yew@mail.gmail.com>
In-Reply-To: <CANso6eGvSYC8WdCD5d7ZXVqb+RQhS4BXz69ZxQX2QQ8YuQ1Yew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 9/8/15, James Carlson <carlsonj@workingcode.com> wrote:
> On 9/7/2015 2:46 AM, Edwardo Garcia wrote:
>> Nobody?
>
> I delayed responding because I'm not using freeradius.  I don't know who
> might be.  If there's a support list for that software, you might have
> better luck over there.  If not, you might be on your own.
>
>>> I try strace but it not too helpful, maybe  I miss an option to make
>>> pppd do this?
>
> strace doesn't sound like the right sort of tool for this problem.
> Instead, have you tried the pppd "debug" option?

strace using  -ff  show far more information than ppp debug which we also try.

>
> Looking at the RADIUS source (and knowing nothing about it), it looks
> like it needs to be compiled with "MSDNS" defined and that you need
> RADIUS attributes 28 and 29 set.  Have you done that?
>

Yes, this is default and is not freeradius problem as freeradius send
the information in accept packet, just pppd ignore it, my colleuge has
email someone at roaring penguin about it, but will not be available
until next couple hours so do not know if he has receive answer or not

> If it works with the ms-dns option from the pppd command line, then I'd
> suggest that this is not a problem with pppd itself, but rather with the
> RADIUS plug-in.  I'm not sure who supports that, but it looks like it
> came from Roaring Penguin.
>

> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>
