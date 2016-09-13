From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Sep 2016 13:10:10 +0000
Subject: Re: CHAP Auth issue at CentOS-6.8
Message-Id: <57D7FAB2.9010204@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
In-Reply-To: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 09/13/2016 08:33 AM, Sekar D wrote:
> I did not see kind of issue on CentOS-5.11 . Please let me know if I
> need to change any config parameters.

It's a little hard to tell.  What are your current configuration parameters?

Have you tried running pppd with debugging enabled?  It would help to
have a trace of the connection in order to diagnose the failure mode.
The starting point is the pppd "debug" option, but if you're controlling
this connection with ifup/ifdown scripts, you'll have to look at your
system configuration to find out what pppd options are in use for that
link.  One possible answer, if all else fails, would be to run this
while the link is in the process of establishing:

  ps -fp `pgrep -d, pppd` | cat

(Yes, the "cat" is important; it tricks ps into printing the whole line.)

What kind of connection is this?  That is, what's the underlying serial
link?  Is it a physical wire on a serial port?  Is it a USB serial port?
 Is it ISDN?  Is it PPPoE or PPTP or L2TP?  Is it something else?

At a guess, the problem is on the remote end.  Typically, a user's PPP
connection is set up to be a "client" -- that is, to reply to
authentication requests from the peer and not to request authentication
from the peer.  This means that the remote system you're talking to
asked for your CHAP credentials, your system supplied them, and the
remote system denied your access based on those credentials.

If that only happens "sometimes" or is dependent on timing, then it
sounds like the remote system has some kind of usage restriction.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
