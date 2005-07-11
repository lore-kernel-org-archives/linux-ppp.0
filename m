From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 11 Jul 2005 10:52:17 +0000
Subject: Re: options in plugins?
Message-Id: <17106.20321.572648.290053@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <87wtny1tad.fsf@stark.xeocode.com>
In-Reply-To: <87wtny1tad.fsf@stark.xeocode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Grant Coady writes:
> On 10 Jul 2005 13:10:18 -0400, Greg Stark <gsstark@mit.edu> wrote:
> >
> >I'm not sure if development on pppd is still active. It seems there are dozens
> >of patches floating around and no upstream releases coming. Is it? Is this
> >still the list to reach the upstream maintainers?
> 
> It is a very quiet list, I emailed someone last year to see if they 
> taking patches and no response.  Only monitoring this group couple 
> weeks, seems little traffic, holiday season?

It's a fairly quiet list most of the time, as the code base is fairly
mature.

There ought to be a FAQ on getting changes integrated with a given
project, as it seems to be an obscure art.  In short, just sending a
bunch of diffs to the maintainers rarely (if ever) works.  The sorts
of things we want to know are:

  - What exactly are you doing?  Are you fixing a problem you saw or
    adding a new feature?  If it's a problem, what are the symptoms
    and can it be reproduced?  If it's a new feature, how does it fit
    in with existing features, and why were the existing features "not
    enough" to do what was needed?

  - What testing have you done?  Have you checked for memory leaks?
    Have you checked for compatibility with other implementations (if
    necessary)?

  - Are you _sure_ this is the right fix, or are you just soliciting
    comments?  Is there perhaps a bigger (and unfixed) problem lurking
    behind this one?

It's not that it's some sort of "club," but if we don't know who you
are and what you're doing, it's not always clear what to do about the
bags of bits we sometimes get.

> >But I don't see any reasonable way to do that without writing a lot of code.
> >Nor am I clear whether such a patch would eventually get released. There's not
> >much point in writing it just for myself -- I have my personal version hacked
> >up for my use already. If development is dead then there's not much point in
> >fixing this problem so generally.
> 
> Scratch your itch, see if anyone else agrees with solution?

As others have pointed out, this feature already exists.  No need to
scratch anything.

-- 
James Carlson                                 <carlsonj@workingcode.com>
