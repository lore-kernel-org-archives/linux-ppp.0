From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 06 Dec 2005 21:59:45 +0000
Subject: Re: Basic Question.
Message-Id: <Pine.LNX.4.61.0512061355570.26238@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <a2617ef40512061213v7823a29fr@mail.gmail.com>
In-Reply-To: <a2617ef40512061213v7823a29fr@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 6 Dec 2005, James Carlson wrote:

> Clifford Kite writes:
>> | I have two adsl Links and I would like to start adsl1 always in ppp0
>> |and the adsl2 always in the ppp1, otherwise  when I reboot and the
>> |adsl1 fail to connect,  the adsl2 start in ppp0 and my
>> |firewall rules screw up !
>>
>> Man pppd, see whether the option "unit <num>" is what you want.
>
> ... or use the /etc/ppp/ip-up script interface to rewrite the firewall
> rules on the fly.
>
> (Agreed; there needs to be a better way to deal with this issue.)
>

One of the real problems with linux appears to be the difficulty of
associating a unit with a physical device. Thus with ethernet, it depends
on which hardware device the system just happens to look at first which
gets called eth0. The aliases established in /etc/modprobe.conf seem to be
just ignored.  Similarly with ppp, and everything else. This really
needs a unified way of dealing with it. the unit option in pppd helps, but
if for some reason that unit is unavailable, ppp simply grabs whatever
anyway.

To have to set up a script which determines which units are which and
rewrites all references to the unit number is not only a kludge but is also
extremely prone to bugs. That is not the way to go.

