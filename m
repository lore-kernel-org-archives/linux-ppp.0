From: bfc <chappaquasuite@yahoo.com>
Date: Thu, 20 Mar 2008 01:04:30 +0000
Subject: modem session behavior
Message-Id: <16169308.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Wow, I'm monopolizing this group. :(

If you start minicom (with -o to prevent any initialization), and type
something like
"ATH" (following by return), and instead of jumping a line and returning OK,
the cursor
just slides back to the beginning of the line, and the modem doesn't answer,
what does
that mean?

Judging by the stty characteristics, nothing's different from usual, but
maybe
I'm getting fooled on that one.  Is there typically a mode on the modem
itself
that would cause this behavior?

I exited from minicom, and waited about a minute, restarted it the same way,
and it
was normal again.

This is a modem attached to ttyS0, FWIW.

Thanks!
-- 
View this message in context: http://www.nabble.com/modem-session-behavior-tp16169308p16169308.html
Sent from the linux-ppp mailing list archive at Nabble.com.

