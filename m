From: carlsonj@workingcode.com
Date: Tue, 22 Jun 2004 16:16:34 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <16600.23394.271160.500095@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Milan P. Stanic writes:
> > However, handling them from a single daemon wouldn't be supported by
> > the current code, and if these dial-in and dial-out instances need to
> > have the same IP addresses, then things get even more problematic.
> 
> I'm using mgetty in AUTO_PPP mode and diald (dial-on-demand) daemon
> for such servers for years.

You're right; I should have said "from a single *pppd* instance."  If
that's what the original poster wanted, it doesn't yet exist, at least
that I know of.

> It would be better to have the same daemon
> to handle incoming/outgoing connections, but I don't know for such
> software. So, mgetty/diald is "good enough".

Probably so.

-- 
James Carlson                                 <carlsonj@workingcode.com>
