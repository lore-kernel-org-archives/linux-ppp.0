From: Chris Fowler <cfowler@outpostsentinel.com>
Date: Tue, 22 Apr 2008 16:18:11 +0000
Subject: Re: modem session behavior
Message-Id: <1208881091.16663.40.camel@shuttle>
List-Id: <linux-ppp.vger.kernel.org>
References: <16169308.post@talk.nabble.com>
In-Reply-To: <16169308.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ah.

We use Comtrol RocketModems.  They have their own UART and own driver.


On Tue, 2008-04-22 at 09:08 -0700, bfc wrote:
> The problem was that sometimes the serial driver wouldn't send the data
> loaded into
> the FIFO.  Conversations with the modem would hang (and chat would
> eventually time
> out) -- or the connection would be made between modems, but I'd get a LCP
> timeout
> error -- from the same cause.
> 
> You may only get bit by this with particular UART hardware -- ours was
> detected
> (correctly) as a 16550A.  You should be able to find out what yours is by
> either
> grep 'serial' from /var/log/messages, or setserial -a /dev/ttyS0.  The
> problem
> did not occur on another machine with a NS16550A detected.
> 
> The problem kernel we had was 2.6.18 (and various minor versions up to
> 2.6.18-89).
> 
> 


