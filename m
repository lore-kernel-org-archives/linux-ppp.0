From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 15 Feb 2005 16:13:21 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.61.0502150808250.25790@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 15 Feb 2005, James Carlson wrote:

> Bill Unruh writes:
>>> At a guess, your NTP time sync is causing a large jump because your
>>> clock is off by a large amount.  pppd uses the gettimeofday() function
>>> to compute CONNECT_TIME, and the value returned by that function is
>>> UTC -- meaning that NTP will _change_ the value out from under pppd,
>>> leading to incorrect calculation.
>>
>> IF that is the case, you would expect the time to be negative, although
>> 71582784 min is 254 seconds short of 2^32, so yours is probably the correct
>> explanation.
>
> It depends on which direction the clock was corrected.  It could have
> been either fast or slow before ntpdate was done.

No. It must have been fast. There is no way it was 132 years slow.

>
>> Note that ntpdate is a really really terrible way of setting the time.
>> Instead use say chrony, which was designed for the up and down of a modem
>> connection. Run chronyd which will gradually slew the clock to the correct
>> time without introducing discontinuities into the time ( which is bad for
>> file creation times and modification times as well, and cause havoc
>> withsome programs).
>
> Good suggestion, though I think ntpdate is necessary if you expect to
> run xntpd -- NTP itself won't sync up unless the clock is "close" to
> right.

Which is why chrony with rtc support is so nice. Your computer is brought
up close to the correct time. Also chrony can be set up to step if the time
is way out and slew otherwise. 
(You will have to disable the resetting of the rtc clock done by many
distros on shutdown. After chrony has done a careful job of determining
exactly how far off the rtc is and how fast or slowly it runs, that
resetting upsets all those determinations. )

