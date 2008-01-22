From: James Teh <james.teh@netboxblue.com>
Date: Tue, 22 Jan 2008 00:33:00 +0000
Subject: Problems with proxy arp with multiple addresses on the same interface
Message-Id: <479539BC.1050303@netboxblue.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

The Linux specific get_ether_addr() function in pppd uses ioctl to get 
the netmask for an interface by interface name. Unfortunately, using the 
ip command, multiple addresses don't receive separate interface labels, 
which means that get_ether_addr() can only ever obtain the netmask for 
the first address on each in terface. This causes proxy arp to fail in 
certain cases when there are multiple addresses on the interface in 
question; specifically, when the subnet mask of the first address on the 
interface is smaller than the netmask of the desired address.

This can be worked around by using ip with the "label" parameter to 
label each interface separately, but this is undesirable, as it means 
unique labels need to be generated.

I have created a patch (largely borrowed from BSD) which uses 
getifaddrs() instead of get_ether_addr() to get the netmask. This way, 
the netmask for the specific address of the interface can be obtained.

Is this the appropriate place to submit this patch? I looked through the 
documentation, but found no mention of where patches should be submitted.

--
James Teh
Developer
NetBox Blue

Scanned by the NetBox from NetBox Blue
(http://netboxblue.com/)

