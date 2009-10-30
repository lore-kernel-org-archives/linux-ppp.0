From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 30 Oct 2009 15:06:02 +0000
Subject: Re: pppd & ntpd
Message-Id: <4AEB00DA.7020908@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AEAFDE0.2060600@bfs.de>
In-Reply-To: <4AEAFDE0.2060600@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> Hi list,
> the question is a bit of topic, but
> has someone a dial-in server with ntpd running ?
> we have noticed that  'ntpd 4.2.4p6' seems
> to have problems accepting connections from ppp0.
> 
> i "fixed" the problem with a kill -1 in ip-up.
> 
> did someone see such problem before ?

Yes.  Most of the ntpd/xntpd variants out there read the system
interfaces just once when they start (SIOCGIFCONF) in order to bind a
local address on every interface, and then do not check automatically
for new interfaces (either by periodic SIOCGIFCONF or more reasonably by
routing sockets).

I know there are folks in the OpenSolaris world working on this problem
(specifically by using socket options that eliminate the need for
binding all addresses individually in the first place), but I'm not sure
what's going on for Linux.  It's worth asking the ntp folks about.

In the meantime, a kill -HUP sounds fairly reasonable.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
