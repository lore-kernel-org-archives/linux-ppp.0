From: James Cameron <james.cameron@hp.com>
Date: Wed, 03 Mar 2004 03:11:10 +0000
Subject: Re: pppd gotcha with ATT GPRS service using SE GC82
Message-Id: <20040303031110.GH21009@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <03F1A9D14E1F3D4A984B3EDDFA9823DEF897@bldc02.research.intel-research.net>
In-Reply-To: <03F1A9D14E1F3D4A984B3EDDFA9823DEF897@bldc02.research.intel-research.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Mar 02, 2004 at 09:54:53PM -0500, James Carlson wrote:
> I think a better answer would be to have an option that allows pppd to
> ignore the negotiated remote address and use a configured value
> instead.  [...]

I'd be curious to know if it worked after changing the address on the
PPP interface using ifconfig pointtopoint after the link came up.
That's how we're able to work around an odd remote IP on some PPTP
systems.

Or if a remote IP address was specified on the command line for pppd,
with or without ipcp-accept-remote.

-- 
James Cameron
