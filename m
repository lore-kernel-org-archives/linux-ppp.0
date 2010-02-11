From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 14:58:53 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B741B2D.1040101@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> What would I need to do so that pppd doesn't retry for any failures? thanks.

Can you define precisely what you mean by "retry" and "failure" and what
particular cases you're concerned about?

Sorry to be obtuse here, but it's just plain unclear to me what you're
after, and I'd very much like to be helpful.

The Point-to-Point Protocol includes a negotiation mechanism that
resends messages when there's no response and sometimes when there are
disagreements between the peers.  I *suspect* you're not really
interested in that, though you seem to have expressed interest in
changing it.

The pppd implementation also includes ways to restart the entire
connection after failure.  That behavior is not the default.  You must
use options such as "demand" or "persist" in order to get the daemon to
retry after fatal problems, such as authentication rejection or
parameter negotiation failure.

If you don't want it to do that, then just don't use those options.

Please see the pppd man page for details on these options, and post a
*precise* description of what you want it to do and under what conditions.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
