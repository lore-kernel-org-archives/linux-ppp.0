From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 15 Feb 2005 00:31:10 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.61.0502141617270.6973@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 15 Feb 2005, GrantC wrote:

> On Mon, 14 Feb 2005 15:32:36 -0800 (PST), you wrote:
>
>> On Sat, 12 Feb 2005, Serge Koksharov wrote:
>>
> ...
>>> If in the same script /etc/ppp/ip-up.local I use following command to
>>> synchronize time:
>>> ntpdate ntp.someserver.org
>>> And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
>>> and connection time by this command:
>>> echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
>>>>> /etc/ppp/history
>>> I often get wrong connection time in /etc/ppp/history, for example:
>>> TX: 41180 RX: 291021 for 71582784 minutes.
>>
>> What do you get if you just record CONNECT_TIME ? It sounds to me like some
>> counter is rolling over.
>> Note that this almost certainly has nothing to do with using ntp.
>> I do not know how your system  or pppd gets the variable CONNECT_TIME.
>
> Elapsed seconds from connection up until down.

Yes, that is what it is supposed to be, but is that what it is? (Obvously
not sometimes). Anyway the question I was asking was what was setting that
environment variable and how is it calculated.

Looking at the source, the Connect time should be a positive number with no
rollover until well into the 21 century.



>
> You may need to separate the seconds --> minutes conversion to a
> variable in your script, or:
>
> Bash script math example: VOL=$((DEFAULT_VOLUME * 65535 / 100))
> perhaps you need whitespace around the operator in your script?
>
> As far as connection speed goes, if 'chat' sees it, perhaps set
> an env variable to be picked up by your ip-up script?

YOu would have to hack chat to make it do that-- parse the CONNECT message
from teh modem and then put that into an environment variable visible to
the calling program (env variables usually die with the child).

