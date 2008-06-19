From: John Hasler <john@dhh.gt.org>
Date: Thu, 19 Jun 2008 17:18:46 +0000
Subject: Re: [Bridge] kernel doesn't support bridge with a ppp interface ?
Message-Id: <87y751wdft.fsf@thumper.dhh.gt.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
In-Reply-To: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

c.j wrote:
> I'm not sure if this is even possible using standard protocols.  Bridging
> is for Ethernet; PPP is not Ethernet.

Pppd's proxyarp option won't do what you want?
-- 
John Hasler 
john@dhh.gt.org
Elmwood, WI USA
