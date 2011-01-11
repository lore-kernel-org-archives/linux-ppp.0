From: Slawomir Skret <sskret@eecs.tufts.edu>
Date: Tue, 11 Jan 2011 20:30:05 +0000
Subject: ifconfig ppp0 errors
Message-Id: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I use pppd to connect two serial bus points, i.e. I use it with the 
"local" flag and not with a modem controls. It all works fine but when 
downloading files I do get some errors reported by the ifconfig:

ppp0      Link encap:Point-to-Point Protocol
           inet addr:192.168.1.202  P-t-P:192.168.1.201 
Mask:255.255.255.255
           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
           RX packets:3662 errors:381 dropped:0 overruns:0 frame:0
           TX packets:3536 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:3
           RX bytes:5454442 (5.2 MiB)  TX bytes:203944 (199.1 KiB)

I tried to use the "debug" and "kdebug" flags when starting pppd but get 
only the configuration related info but nothing during the runtime 
that would tell me why the errors occurred or what do they mean. From what 
I read, the ifconfig reports the contents of the /proc/net/dev file which 
is updated by the kernel modules but again it is a statistics reporter 
only without describing the nature of the errors.

How can I get more information about these errors?

Thanks,
Swavek

