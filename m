From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 04 Jan 2006 16:25:23 +0000
Subject: Re: ARP on PPP Interface
Message-Id: <Pine.LNX.4.61.0601040824200.11264@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <17339.61453.768186.334245@gargle.gargle.HOWL>
In-Reply-To: <17339.61453.768186.334245@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 4 Jan 2006, Murugaiyan N wrote:

> Hi,
>
> What happens through ioctl if the NOARP flag is cleared (i.e. arp is turned
> on) for a ppp interface.
>
> I would like the ppp interfaces(server side) to respond for my arp queries
> from the local net with the MAC address of the ethernet iface on which the
> ppp  is actually created, how do it do that?

man pppd
look for proxyarp.

(Assuming you are using pppd)

