From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 22 Jun 2004 23:20:10 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <Pine.LNX.4.50.0406221617550.30729-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 22 Jun 2004, Milan P. Stanic wrote:

> On Tue, Jun 22, 2004 at 09:58:59AM -0700, Bill Unruh wrote:
> > Note that I would not use dial on demand, since the incoming connection
> > is liable to want to go out as well, and that could cause problems. In
> > many cases dial on demand is more trouble than it is worth.
> 
> Diald *will not* try to access ttyS? if it is locked by mgetty.

It is not clear that he is using diald. He is probably using the "new"
dial on demand option withing pppd itself. I am not sure how it works
with respect to locking of the device. 
It would make sense that it releases the lock when it is waiting and
respects locks which are present when it tries to connect. But "make
sense" and "that is how it works" need not be synonymous.


