From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 12 Jul 2010 14:43:19 +0000
Subject: Re: syslog pppd and pptp usefulness of log information
Message-Id: <4C3B2A07.8030303@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2A5BBC.4020105@powercraft.nl>
In-Reply-To: <4C2A5BBC.4020105@powercraft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jelle de Jong wrote:
> On 29-06-10 22:46, Jelle de Jong wrote:
>> I would appreciate it if somebody can explain why am I having this 
>> information and how the quality vs quantity is configured?
> 
> Somebody that can help?

I don't think you're going to find what you're seeking in terms of
configuration, because the debug messages were not quite designed to do
what you ask.  Pppd just doesn't have much in the way of user accounting
built in.  (In particular, I don't think detecting "repeating failed
attempts" is going to be possible inside pppd itself, as there's no good
place to store the history.  Even if one were created, distributed
authentication mechanisms such as RADIUS and PAM+NIS will make hash of it.)

The other issue is that the text of the debug log messages is not
necessarily documented as something that you can rely on.  It's possible
(however unlikely) that your favorite messages could change from release
to release of pppd, causing problems for any backend processing of the
system logs.  (Frankly, that's a common problem with all syslog-based
information, and not just messages from pppd.  The messages are usually
treated as a debugging interface for humans, not something that is
expected to be parsed by other programs.)

The documented things you can rely on are the script interfaces
(/etc/ppp/auth-up, /etc/ppp/ip-up, and so on).  There isn't currently a
documented way to detect authentication failure, at least as far as I know.

Of course, if you or someone else is volunteering to write accounting
interfaces for pppd, I suspect that'll be most welcome.  There's likely
a lot that could be done here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
