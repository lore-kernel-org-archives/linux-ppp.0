From: James Carlson <carlson@workingcode.com>
Date: Sat, 10 Apr 2004 19:55:43 +0000
Subject: Re: pppd 2.4.2 doesn't quits.
Message-Id: <16504.20799.123016.980591@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1081497703.3268.17.camel@skyscraper>
In-Reply-To: <1081497703.3268.17.camel@skyscraper>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dmitry Koval writes:
> On Fri, 2004-04-09 at 11:01, Dmitry Koval wrote:
> 
> > I've faced the problem with pppd 2.4.2 on my VPN server.
> 
> In addition I've attached to a hanging process and got the following
> stack trace:
> (gdb) bt

That looks quite garbled.  None of the symbols there reflect anything
out of pppd.  I would guess that this could be due to some sort of
library version conflict on the system, but the output is so senseless
that it's hard to guess.

-- 
James Carlson                                  <carlson@workingcode.com>
