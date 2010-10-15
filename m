From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 15 Oct 2010 11:49:38 +0000
Subject: Re: [PATCH] pppoe: Missed check for destination addr in PADT frame
Message-Id: <4CB83FD2.7070501@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
In-Reply-To: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/15/10 07:11, Leonid Lisovskiy wrote:
> Once more - this is how it should be done by RFC. But due to buggy ISP
> hardware uniqueness of session_id violated! Client doesn't know
> anything about other clients connected to the ISP, so it can't fix
> anything.

It might not necessarily be a bug in the ISP (well, except for the fact
that they're using PPPoE -- that's arguably a separate bug).

There's a known flaw in the way PPPoE assigns session ID numbers.
Instead of assigning a separate session number for each direction (as is
done with most competent tunneling protocols), PPPoE uses a single
session number that's assigned by the server.

This raises a problem.  If you have a single client talking to two or
more servers, there's no guarantee at all that the session IDs assigned
by those servers will be distinct.  If they're not, then the client must
match on MAC address.

Is this the problem you're running into?  Are you talking to two
different servers?

(This is also why the standards process, as cumbersome as it may seem,
is useful.  With decent review, it's possible to fix problems like this
before they become unfixable.  Unfortunately, that's not how PPPoE was
done.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
