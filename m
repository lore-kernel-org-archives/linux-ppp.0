From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 15 Feb 2005 15:38:10 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.61.0502150725210.25014@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

>> Question2:
>> If in the same script /etc/ppp/ip-up.local I use following command to
>> synchronize time:
>> ntpdate ntp.someserver.org
>> And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
>> and connection time by this command:
>> echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
>>>> /etc/ppp/history
>> I often get wrong connection time in /etc/ppp/history, for example:
>>  TX: 41180 RX: 291021 for 71582784 minutes.
>
> At a guess, your NTP time sync is causing a large jump because your
> clock is off by a large amount.  pppd uses the gettimeofday() function
> to compute CONNECT_TIME, and the value returned by that function is
> UTC -- meaning that NTP will _change_ the value out from under pppd,
> leading to incorrect calculation.

IF that is the case, you would expect the time to be negative, although
71582784 min is 254 seconds short of 2^32, so yours is probably the correct
explanation.

Note that ntpdate is a really really terrible way of setting the time.
Instead use say chrony, which was designed for the up and down of a modem
connection. Run chronyd which will gradually slew the clock to the correct
time without introducing discontinuities into the time ( which is bad for
file creation times and modification times as well, and cause havoc
withsome programs).

Run chronyd, and in ipup and ipdown put

chronyc <<EOF
password <your chrony password in chrony.keys>
online
burst 3/5
EOF

and in ipdown
chronyc <<EOF
password <your chrony password in chrony.keys>
offline
EOF

chrony will also, if started with 
chronyd -r -s
correct for errors in your rtc clock so that even when you boot up, your
system time will be correct. (However if y ou are running the newest
kernels-- 2.6.7 or later, the /dev/rtc might be broken on your distro--
Mandrake's is, and I believe others are as well-- it all has to do with the
HPET which is displacing the old timer chip on motherboards)


>
> You could possibly get the current value of time() before running
> ntpdate, and the value after, and subtrace that delta from
> CONNECT_TIME.
>
> Perhaps pppd ought to be using something different to compute elapsed
> time (rather than wall clock time -- such as seconds since boot), but
> it turns out to be absurdly hard to do this in a portable way.
>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
