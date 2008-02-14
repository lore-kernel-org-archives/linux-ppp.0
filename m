From: bfc <chappaquasuite@yahoo.com>
Date: Thu, 14 Feb 2008 02:16:53 +0000
Subject: Re: if-up et al script relocation
Message-Id: <15472625.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <15468731.post@talk.nabble.com>
In-Reply-To: <15468731.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Thanks everyone.

We've been using a custom build for some time, and wanted to get away from
that.  Inertia being what it is, we let an
old version linger for too long (2.4.1?) and now need to move to 2.4.4 for
various fixes and its structureed differently enough
to cause a bit of real work.

I meant ip-up ip-down... not if-up if-down, DUH.  (I've made this mistake
repeatedly.)

The plugin is an interesting thought, though perhaps beyond the current
scope/schedule.  At least that would let us
continue moving forward as new pppd versions came out (we just follow RHEL
versions).

So I guess it comes down to customizing any existing ip-up/ip-down/auth-up
scripts (based on the tty), but I do like the thought of combining all of
our logic into one script.  That would reduce the clutter, and could look
something like a service script.
It can be a switch on the action, doing our little things based on the
arguments we need.

Thanks again for your responses!
-- 
View this message in context: http://www.nabble.com/if-up-et-al-script-relocation-tp15468731p15472625.html
Sent from the linux-ppp mailing list archive at Nabble.com.

