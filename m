From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 30 Oct 2006 15:13:34 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <17734.5790.526318.687444@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christian writes:
> I've done some progress in using the hdlc stuffing/destuffing from
> spandsp, it reports that it first has some good FRAME_OK, then after 3
> bytes it gets an ABORT, but still says it found a (bad) frame, which
> looks like:
> 
> received [37]: 3f f1 0 a1 9f d0 4f e8 27 f0 b3 f8 89 fc 64 7e 2 3f 81 9f
> c0 4f e0 27 f5 93 cd fb c9 e3 8d fc e4 7e 22 3f 85
> 
> would you say this is a correct ppp frame? (looks like it contains a 7e
> which should be part of hdlc i think .. )

You didn't mention whether this is *before* AHDLC encoding or *after*
or whether it represents a complete sequence of some sort or a
fragment from a data stream, but, in any event, it doesn't look like
anything at all to me.

That initial 3f f1 sequence doesn't look like any kind of PPP frame.

> >You can feel free to use this one:
> >
> >  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.c
> >  ftp://ftp.workingcode.com/pub/carlson/ppp/ahdlc.h
> >
> >  
> >
> I tried to fetch them, but i got:

I'll send you a copy by email.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
