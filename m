From: Paul Mackerras <paulus@samba.org>
Date: Mon, 07 Feb 2005 06:02:21 +0000
Subject: Re: Multilink in ppp-2.4.3
Message-Id: <16903.1133.599476.890879@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050201230627.51274.qmail@web30502.mail.mud.yahoo.com>
In-Reply-To: <20050201230627.51274.qmail@web30502.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Abdul J writes:

> For example, if I have two dial-up connection
> multilinked together. Even if the first link is
> dropped, since the second link is active the interface
> ppp0 is active and the connection still exists. But
> the problem is I am unable to redial the dropped link
> because the pppd process is still running on that link
> and the serial port is locked. If I try to redial the
> first link, I get an error:
> Feb 1 17:48:33 dhcp034 pppd[3417]: tcgetattr: No such
> device or address (line 907)

Do you get that error on the end that is dialling out, or the end that
you are dialling in to?

> My question is: Is there anyway in which I can redial
> the dropped primary (first) link once a call
> drop/hangup occurs without destroying the whole
> bundle.

You should be able to just bring it up with the same pppd command as
you used before.  If you can't that's a bug that we need to fix.

Paul.
