From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 06 Mar 2008 01:58:06 +0000
Subject: Re: hanging tcsetattr call
Message-Id: <Pine.LNX.4.64.0803051748540.20304@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <15861511.post@talk.nabble.com>
In-Reply-To: <15861511.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 5 Mar 2008, bfc wrote:

>
> Most of the time things work OK -- maybe the chat script needs work, may
> there's a resource issue on the
> far end, but I think it'd be interesting to know what the error case should
> look like.  If you reach the end of
> the time specified by a TIMEOUT chat line (or the default TIMEOUT), then I
> should think chat would exit
> with a non-zero, and pppd should promptly exit with an error, not hang on
> tcsetattr().  BTW, I'm not using

PPP always tries to clean up after itself. It does not simply die. 
Thus you seem to be having some serial port problems.

Why don't you put in a TIMEOut of 2 and put garbage in that next line to
see if it is the timout that is causing the trouble
TIMEOUT 2
y79876y '\d\c'



> persist or any other option to keep things going.
>
> My pppd option file looks something like:

Something like??? With computers
Assuming your "somthing like" was a misstatement:

>
> noauth
> debug
> name foobar.com
> /dev/ttyS0 115200 crtscts
> connect '/usr/sbin/chat -f /var/opt/foobar/chat-file

You are missing a terminating end single quote.


>
> ..and the chat-file:
>
> ABORT "NO CARRIER"
> ABORT "NO DIALTONE"
> ABORT "ERROR"
> ABORT "BUSY"
> '' ATH
> OK AT&F0
> OK ATDT5555
> TIMEOUT 120
> CONNECT \d\c

The \d\c should be protected by single quotes
CONNECT '\d\c'

Also run chat with -v option, and put
local2.*			/var/log/daemonlog
and show us the output in /var/log/daemonlog
so we can see what chat is trying to do.


