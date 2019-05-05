From: walter harms <wharms@bfs.de>
Date: Sun, 05 May 2019 18:40:30 +0000
Subject: Re: PPPOE on Arm
Message-Id: <5CCF2E1E.1000508@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <5CCF1A2D.30808@bfs.de>
In-Reply-To: <5CCF1A2D.30808@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Am 05.05.2019 19:57, schrieb Marco d'Itri:
> On May 05, walter harms <wharms@bfs.de> wrote:
> 
>> I was using PPPOE on a raspi and it terminated with "invalid value",
> Which raspi model and which distribution, exactly?
> 
raspi3 with raspian (it was for testing, only)
I tried also different kernels but no success.

>> while the same setup on x86_64 worked fine.
> Is your pppd configuration unusual in any way?
> 
not really, but i need a VLAN (eth0.7)

this is the line i used for testing, it includes everything.

/usr/bin/setsid /usr/sbin/pppd pty '/usr/sbin/pppoe -p /var/run/pppoe.conf-pppoe.pid.pppoe -I eth0.7 -T 80 -U  -m 1412' noipdefault noauth
default-asyncmap defaultroute hide-password nodetach mtu 1492 mru 1492 noaccomp nodeflate nopcomp novj novjccomp user xxxxx lcp-echo-interval 20
lcp-echo-failure 3


>> is anyone working with PPPOE ?
> I use pppd and the PPPoE plugin from Debian 9 on a 32 bit armv7l system 
> (i.e. armhf) and it works fine.
> 
