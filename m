From: Ross Vandegrift <ross@willow.seitz.com>
Date: Fri, 30 Jan 2004 19:05:14 +0000
Subject: pppd not setting netmask
Message-Id: <20040130190514.GB16326@willow.seitz.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello everyone,

	I'm using pppd with vtun to create dynamic VPNs to connect
remote networks.  I had everything almost working, but noticed a bad
problem with routing and traced it back to netmasks.

	I'm creating ppp tunnels with non-routeable networks to conserve
our IP space.  The first tunnel is using 10.100.100.0/30, with .1 being
the router at the office, and .2 being the remote router.

	My options file has "netmask 255.255.255.252" in it, but when
pppd comes up, ifconfig shows that ppp0 still has 255.255.255.255 for a
netmask.  How can I convince ppp0 to have the proper netmask?  The logs
don't have any error messages mentioning a problem setting the netmask
or anything.  Adding "debug" doesn't give me any extra information.

	This is bad because the connected route that gets installed is
for the opposite end of the tunnel (ie, 10.100.100.1/32) and not the
route for the 10.100.100.0/30.  This confuses OSPF quite a bit (see my
quagga-users thread with all the gorey OSPF details and routes:
http://lists.quagga.net/pipermail/quagga-users/2004-January/001382.html)
-- 
Ross Vandegrift
ross@willow.seitz.com

A Pope has a Water Cannon.                               It is a Water Cannon.
He fires Holy-Water from it.                        It is a Holy-Water Cannon.
He Blesses it.                                 It is a Holy Holy-Water Cannon.
He Blesses the Hell out of it.          It is a Wholly Holy Holy-Water Cannon.
He has it pierced.                It is a Holey Wholly Holy Holy-Water Cannon.
He makes it official.       It is a Canon Holey Wholly Holy Holy-Water Cannon.
Batman and Robin arrive.                                       He shoots them.
