From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 12 Feb 2010 12:55:05 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B754FA9.4040302@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 02/11/10 21:12, Ashmath Khan wrote:
> Thanks James.
> 
> Here is the current options file for our pppd.
> plugin pppoe.so eth1
> nodetach
> nodefaultroute
> persist

As I said before, you don't want the "persist" option.  That tells pppd
to wait a bit, then reopen the serial link and try again after any link
establishment failure.

> maxfail 0

And that tells pppd (when "persist" is set) to try "forever" to get a
link.  You also don't want that.

> lcp-max-failure 5
> lcp-max-configure 10
> lcp-max-terminate 2
> lcp-restart 3

Those are mostly the defaults.  You really don't want to set those.

In general, pppd works best when configured least.  The default settings
are generally chosen wisely so that they work well for the largest
possible group of users.

Your best bet is to configure *precisely* and *only* the things that you
know for certain you need to configure, and do so with reference to the
pppd man page for each one.

> So I think setting maxfail to 1 should do the trick i.e, pppd should
> exit immediately after a failed connection attempt. Will pppd exit if
> lcp echo timesout as well ?

That's a different kind of failure.  If you need to manage failures that
occur after the link is up and running (as opposed to offering different
authentication or dialing options for problems detected during link
establishment; as I originally thought you were doing), then you need
"nodetach" instead of "updetach".  The "nodetach" option keeps pppd from
ever becoming a daemon.  It stays in the foreground until the session
terminates.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
