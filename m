From: James Carlson <carlson@workingcode.com>
Date: Fri, 05 Mar 2004 16:29:00 +0000
Subject: Re: Writing a dialer
Message-Id: <16456.43724.44500.724716@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200403031714.i23HEtJN021770@webmail2.magma.ca>
In-Reply-To: <200403031714.i23HEtJN021770@webmail2.magma.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Javier Govea writes:
> Just to thank you James, all your comments were very helpful. My execv invocation indeed
> was missing "pppd" in arg[0] and the '\0' escapes don't really affect in any way.

OK.

> But my
> real problem was that i was missing the "nodetach" option. Without this option either
> 'chat' seems to run as an independent process or 'pppd' loses control over 'chat'.

Neither of those is actually true.  Instead, if you don't use
"nodetach", then pppd *itself* will fork() and your program's wait()
call will return 'early.'  It's not that pppd "loses control" over
chat, but rather that *your* program loses control over pppd.  Chat
works the same regardless of whether "nodetach" is (or is not) used.

Pppd doesn't (and can never) "lose control" over chat, regardless of
the options used.  If it did, then chat and pppd would fail miserably,
since pppd switches the line from plain text I/O into PPP mode after
chat is done.

If you've never read "Advanced Programming in the UNIX Environment" by
W. Richard Stevens, I strongly recommend it.  Especially chapters 8
and 9.

> In any
> case by adding this option everything seems to work fine.

Sounds good.

-- 
James Carlson                                  <carlson@workingcode.com>
