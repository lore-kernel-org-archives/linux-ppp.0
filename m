From: James Cameron <james.cameron@hp.com>
Date: Tue, 20 Nov 2007 23:07:47 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <20071120230747.GA3464@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Nov 20, 2007 at 11:48:52PM +0100, Marcus Better wrote:
> It works! I patched pppd to accept the WINS settings from the other
> side:

Good to see.  I've reviewed the patch briefly, and it seems fine.  I've
not tested it, as I'm not able to reproduce the conditions easily.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
