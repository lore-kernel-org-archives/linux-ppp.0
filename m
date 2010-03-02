From: Stephen Hemminger <shemminger@vyatta.com>
Date: Tue, 02 Mar 2010 04:40:57 +0000
Subject: Re: [RFC] ppp: Bridge Control Protocol
Message-Id: <20100301204057.11a7c353@s6510>
List-Id: <linux-ppp.vger.kernel.org>
References: <20100301145915.2ecaac89@nehalam>
	<20100302033944.GL26848@brick.ozlabs.ibm.com>
In-Reply-To: <20100302033944.GL26848@brick.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: David@mail.vyatta.com, "Miller <davem"@davemloft.net, linux-ppp@vger.kernel.org, bridge@linux-foundation.org, netdev@vger.kernel.org, dane@aiinet.com

On Tue, 2 Mar 2010 14:39:44 +1100
Paul Mackerras <paulus@samba.org> wrote:

> On Mon, Mar 01, 2010 at 02:59:15PM -0800, Stephen Hemminger wrote:
> 
> > This is a port of an old patch to provide BCP support.
> > BCP allows bridging PPP tunnels, it useful to do bridging between
> > virtualized environments. Original patch was done by
> > Dan Eble but was for 2.4.21.
> > 
> > Note: still needs testing. Does anyone have hardware to make
> > sure this interoperates with other implementations?
> 
> Is there a corresponding pppd patch to handle the control protocol?
> 
> Paul.

Yes, I am working on that
