From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 21 May 2008 14:23:53 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <18484.12409.17430.62838@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

cyx_mail writes:
> 	BTW,why the function "kill_my_pg(sig)" do a system call "kill(0,sig)" with the first parameter "0"? why not to kill himself only but a whole group?

pppd acts as a process group leader, and sending a signal to the
process group means that all children created by pppd (at least those
that haven't gone off to start new process groups) will get the
signal.  This basically cleans up any charshunt or script that might
be running in preparation to exit.

There'd be no point in pppd sending the signal to himself only.  The
whole reason that pppd is doing this at all is that it's about to
exit!  It has already gotten the signal; and talking to yourself is
often not useful.

For more information about the kill(2) system call and process groups,
see your system manual pages, or any reference book on UNIX or POSIX
programming.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
