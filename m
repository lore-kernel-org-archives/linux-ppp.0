From: carlsonj@workingcode.com
Date: Tue, 22 Jun 2004 14:49:07 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <16600.18147.977219.334243@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jaspreet Singh writes:
> Is it possible to configure one PPPd as a dialin
> server and a dial out client? I have a situation where
> an incoming call should be handled and a dial on
> demand should be handled for the same port.

Handling the two instances on a single port shouldn't be a problem, as
pppd uses the traditional UUCP port locking scheme.

However, handling them from a single daemon wouldn't be supported by
the current code, and if these dial-in and dial-out instances need to
have the same IP addresses, then things get even more problematic.

-- 
James Carlson                                 <carlsonj@workingcode.com>
