From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 15 Feb 2005 15:43:24 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <16914.6300.985362.218721@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> > At a guess, your NTP time sync is causing a large jump because your
> > clock is off by a large amount.  pppd uses the gettimeofday() function
> > to compute CONNECT_TIME, and the value returned by that function is
> > UTC -- meaning that NTP will _change_ the value out from under pppd,
> > leading to incorrect calculation.
> 
> IF that is the case, you would expect the time to be negative, although
> 71582784 min is 254 seconds short of 2^32, so yours is probably the correct
> explanation.

It depends on which direction the clock was corrected.  It could have
been either fast or slow before ntpdate was done.

> Note that ntpdate is a really really terrible way of setting the time.
> Instead use say chrony, which was designed for the up and down of a modem
> connection. Run chronyd which will gradually slew the clock to the correct
> time without introducing discontinuities into the time ( which is bad for
> file creation times and modification times as well, and cause havoc
> withsome programs).

Good suggestion, though I think ntpdate is necessary if you expect to
run xntpd -- NTP itself won't sync up unless the clock is "close" to
right.

-- 
James Carlson                                 <carlsonj@workingcode.com>
