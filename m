From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 13 Sep 2016 23:06:46 +0000
Subject: Re: CHAP Auth issue at CentOS-6.8
Message-Id: <alpine.LMD.2.03.1609131605180.575@physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
In-Reply-To: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Tue, 13 Sep 2016, James Carlson wrote:

> On 09/13/2016 08:33 AM, Sekar D wrote:
>> I did not see kind of issue on CentOS-5.11 . Please let me know if I
>> need to change any config parameters.
>
> It's a little hard to tell.  What are your current configuration parameters?
>
> Have you tried running pppd with debugging enabled?  It would help to
> have a trace of the connection in order to diagnose the failure mode.
> The starting point is the pppd "debug" option, but if you're controlling
> this connection with ifup/ifdown scripts, you'll have to look at your
> system configuration to find out what pppd options are in use for that
> link.  One possible answer, if all else fails, would be to run this
> while the link is in the process of establishing:
>
>  ps -fp `pgrep -d, pppd` | cat

-www argument to ps should do the same thing without cat.

>
> (Yes, the "cat" is important; it tricks ps into printing the whole line.)
>
