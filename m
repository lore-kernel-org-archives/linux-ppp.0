From: James Cameron <james.cameron@hp.com>
Date: Tue, 22 Jul 2008 00:04:01 +0000
Subject: Re: PPP difficulties regarding connection establishment and bogus
Message-Id: <20080722000401.GC5579@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
In-Reply-To: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Jul 21, 2008 at 12:34:48PM +0300, Paulius Zaleckas wrote:
> Sure. See attachment.

Fascinating.  It is almost as if negotiating for ms-dns* should not be done
until successful negotiation of addr.

Has some rational basis ... without having an addr, the peer could not
possibly obtain ms-dns* from the network.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
