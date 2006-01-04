From: "Murugaiyan N" <murugaiyan@banyannetworks.com>
Date: Wed, 04 Jan 2006 15:58:53 +0000
Subject: ARP on PPP Interface
Message-Id: <NIBBLPOFOMEFBJKBJLGFGEELCKAA.murugaiyan@banyannetworks.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <17339.61453.768186.334245@gargle.gargle.HOWL>
In-Reply-To: <17339.61453.768186.334245@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

What happens through ioctl if the NOARP flag is cleared (i.e. arp is turned
on) for a ppp interface.

I would like the ppp interfaces(server side) to respond for my arp queries
from the local net with the MAC address of the ethernet iface on which the
ppp  is actually created, how do it do that?

- Murugaiyan



