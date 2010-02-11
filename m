From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 17:01:22 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B7437E2.1000406@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> Thanks James.
>>From man page:
> updetach
>     With this option, pppd will detach from its controlling terminal
> once it has successfully established the ppp connection (to the point
> where the first network control protocol, usually the IP control
> protocol, has come up).
> 
> How about if chap authentication fails ? then updetach won't work.

If authentication fails, then pppd exits with an error code as
documented.  The man page entry for updetach documents the _latest_
point at which the daemon will exit, not the earliest point.

Basically, by using updetach, you can rely on the exit code from pppd to
tell you whether it was successful in starting the session (exit code 0)
and is now running in the background, or whether it failed to start
(exit code != 0).

I suspect this is the behavior you're looking for.

> what is controlling terminal here ?

It's a UNIX term.  Processes may or may not have what's called a
"controlling terminal."

When you start a process from a shell, the controlling terminal is
usually your tty.  This allows you to (for instance) press ^C and
interrupt that process.  It's what also terminates any lingering
processes with SIGHUP when you log out.

Processes that run as daemons generally disconnect from the controlling
terminal, so that they are no longer affected by the user who originally
started the process (unless explicitly sent a signal with "kill").

For more information, you may want to try googling the term.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>

