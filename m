From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 04 May 2008 14:55:27 +0000
Subject: Re: Help! It seems that pppd can't work properly when syslogd running on background
Message-Id: <18461.52831.440259.828759@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805042001189395244@foxmail.com>
In-Reply-To: <200805042001189395244@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

cyx_mail@foxmail.com writes:
> Jan  1 00:03:09 (none) daemon.info pppd[814]: Terminating on signal 15
[...]
> Jan  1 00:03:09 (none) daemon.warn pppd[814]: Child process /sbin/pppoe -n -I br0 -e 2:00:50:ba:fa:6d:e1 -S ''5
[...]
> Jan  1 00:03:15 (none) daemon.notice pppd[814]: Connection terminated.
[...]
> Jan  1 00:03:45 (none) daemon.info pppd[819]: Terminating on signal 15
[...]

It looks to me like pppd is being terminated by rp-pppoe.

For what it's worth, I don't see anything in pppd that could
reasonably be affected by whether syslogd is running or not, and
certainly nothing that would _stop_ working simply because syslogd is
there.

My guess would have to be a bug in the underlying operating system.
Whatever it is, it's obscure.

> but I can get a successful connection when I kill syslogd ,Why?

There've been many postings about this problem over the past year or
so.  I don't think anyone knows how to fix the problem.

The common components seem to be Linux and rp-pppoe.  Pppd works fine
on other platforms and when PPPoE isn't in use.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
