From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Mon, 23 Jul 2007 12:35:07 +0000
Subject: Re: Can we run a PPP server & client simultaneously???
Message-Id: <1185194107.32759.7.camel@shuttle.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <11741524.post@talk.nabble.com>
In-Reply-To: <11741524.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 2007-07-23 at 08:28 -0400, James Carlson wrote:
> I think that process may have race conditions, given that if-up is
> triggered after the interface is marked 'UP', and nothing in the
> system actually waits for that script to complete.  For that reason, I
> wouldn't suggest that as a design for a new feature in the pppd code
> base.
> 
> Otherwise, though, it seems like a somewhat reasonable solution for a
> pppd user. 

CORRECT!  I do not suggest this as a design for future pppd based code.
It really needs not to be.  It is a design based on what we have and
what we needed to do to make it work.  I'm always looking for
improvements.

Also I do have changes to pppd 2.4.2 that anyone can have.  We changed
that version to allow us to specify multiple ttys on the command line.
This allowed us to support outbound pooling with pppd.

/usr/sbin/pppd ttyR0,ttyR1,ttyR2,...  57600 ....

Works like that.  When the pppd process needs to call a remote it will
look for lock files and use the first available tty.  This feature I
would suggest as something that should be added since it is useful in a
a demand implementation.  Inbound pooling is handled by a single DID and
hunt group on those lines.

If the multiple tty feature is something you guys might like to add just
let me know and I'll tarball our source and make it available.  It is
considered a derivative work of pppd since we modified the source.


