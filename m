From: Dmitry Koval <koval@donapex.net>
Date: Sat, 10 Apr 2004 18:13:38 +0000
Subject: Re: pppd 2.4.2 doesn't quits.
Message-Id: <1081620817.3133.6.camel@skyscraper>
List-Id: <linux-ppp.vger.kernel.org>
References: <1081497703.3268.17.camel@skyscraper>
In-Reply-To: <1081497703.3268.17.camel@skyscraper>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 2004-04-09 at 11:01, Dmitry Koval wrote:

> I've faced the problem with pppd 2.4.2 on my VPN server.

In addition I've attached to a hanging process and got the following
stack trace:
(gdb) bt
#0  0x00a4ec32 in _dl_sysinfo_int80 () from /lib/ld-linux.so.2
#1  0x00b4ebe6 in __lll_mutex_lock_wait () from /lib/tls/libc.so.6
#2  0xbfef28c0 in ?? ()
#3  0x00b9c238 in __DTOR_END__ () from /lib/tls/libc.so.6
#4  0x00000001 in ?? ()
#5  0x00b3dda3 in _L_mutex_lock_316 () from /lib/tls/libc.so.6
#6  0x08653bb8 in ?? ()
#7  0x08071519 in rcsid ()
#8  0xbfef2aa8 in ?? ()
#9  0xbfef2a44 in ?? ()
#10 0x00b99d40 in map () from /lib/tls/libc.so.6

As I understand it's hangs after exiting in the libc code.
But in this case why I didn't see 'exit' message in the log?

Any pointers?

-- 

