From: bfc <chappaquasuite@yahoo.com>
Date: Thu, 06 Mar 2008 01:43:18 +0000
Subject: Re: hanging tcsetattr call
Message-Id: <15864699.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <15861511.post@talk.nabble.com>
In-Reply-To: <15861511.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Most of the time things work OK -- maybe the chat script needs work, may
there's a resource issue on the
far end, but I think it'd be interesting to know what the error case should
look like.  If you reach the end of
the time specified by a TIMEOUT chat line (or the default TIMEOUT), then I
should think chat would exit
with a non-zero, and pppd should promptly exit with an error, not hang on
tcsetattr().  BTW, I'm not using
persist or any other option to keep things going.

My pppd option file looks something like:

noauth
debug
name foobar.com
/dev/ttyS0 115200 crtscts
connect '/usr/sbin/chat -f /var/opt/foobar/chat-file

..and the chat-file:

ABORT "NO CARRIER"
ABORT "NO DIALTONE"
ABORT "ERROR"
ABORT "BUSY"
'' ATH
OK AT&F0
OK ATDT5555
TIMEOUT 120
CONNECT \d\c


-- 
View this message in context: http://www.nabble.com/hanging-tcsetattr-call-tp15861511p15864699.html
Sent from the linux-ppp mailing list archive at Nabble.com.

