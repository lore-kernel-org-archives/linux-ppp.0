From: "Milan P. Stanic" <mps@rns-nis.co.yu>
Date: Tue, 22 Jun 2004 19:20:41 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <20040622192041.GA5699@rns-nis.co.yu>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Jun 22, 2004 at 09:58:59AM -0700, Bill Unruh wrote:
> Note that I would not use dial on demand, since the incoming connection
> is liable to want to go out as well, and that could cause problems. In
> many cases dial on demand is more trouble than it is worth.

Diald *will not* try to access ttyS? if it is locked by mgetty.
