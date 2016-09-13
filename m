From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Sep 2016 15:02:35 +0000
Subject: Re: CHAP Auth issue at CentOS-6.8
Message-Id: <57D8150B.5070100@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
In-Reply-To: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 09/13/2016 09:25 AM, Sekar D wrote:
> Hi James,
> 
> Thanks for helping me.
> 
> Yes. It happens only when I bring up DSL line before 2 minutes. The
> same DSL lines are working fine without any issue at CentOS-5.11. I
> could see the issue only at CentOS-6.8. So I would like to know that I
> need to configure more to avoid these issues.

One other thing you might consider doing, now that we know that this is
a PPPoE connection: try running wireshark and capturing traffic from a
failed connection, a long delay, and then a successful one.

At a guess, PPPoE is the problem.  I suspect the logs will show PADT
messages coming from your system (which may or may not be malformed),
along with either no response from the peer, or retransmitted messages
from the peer that are being ignored by your system.

My current hypothesis is that PPPoE is keeping the previous connection
up too long, and the peer doesn't like seeing you log in more than once
at a time.

I don't believe anything is going wrong with PPP itself.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
