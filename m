From: Milen Dimitrov <milend@ansco.com>
Date: Fri, 02 Apr 2004 21:24:03 +0000
Subject: dialin server not routing/forwarding????
Message-Id: <406DD9F3.6060901@ansco.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
I just setup a dialin server on RedHat 9.
Dial in server is a member of LAN with common gateway 192.168.1.1.
I can browse internet from dial-in server and I can ping any other PC in 
the LAN.

 From a windows PC i can dial in and connect to the server but I cannot 
browse Internet.
When connected to the dial-in server my windows PC has the following 
ipsettings and I cannot ping
any other PC in the LAN except dial in server (192.168.1.10) I'm 
connected to:
c:\>ipconfig /all
PPP adapter test2PPP:
       Connection-specific DNS Suffix  . :
       Description . . . . . . . . . . . : WAN (PPP/SLIP) Interface
       Physical Address. . . . . . . . . : 00-53-45-00-00-00
       DHCP Enabled. . . . . . . . . . . : No
       IP Address. . . . . . . . . . . . : 192.168.1.171
       Subnet Mask . . . . . . . . . . . : 255.255.255.255
       Default Gateway . . . . . . . . . : 192.168.1.171
       DNS Servers . . . . . . . . . . . : 192.168.1.2
                                                     192.168.1.3

As you see the IP and the gateway for my windows PC are the same - 
192.168.1.171. Is this correct?

My guess is that the linux Dial-in server doesn't route/forward packets 
from PPP  to the rest of the LAN?
How I can prove if it's true or not?
Which config files/log files to be check out?
Which tools I can use to debug it?

Thank you for the help in advance!
Milen
=================
Please see some of config files bellow:
1. /etc/sysctl.conf
contains the line:
--------------------------
net.ipv4.ip_forward = 1
--------------------------
so cat /proc/sys/net/ip4fw/ip_forward
shows "1"

/etc/ppp/options
contains:
-----------------------
-detach
asyncmap 0
netmask 255.255.255.0
proxyarp
lock
crtscts
modem
noauth
ms-dns 192.168.1.1
ms-dns 192.168.1.1
---------------------

/etc/ppp/options.ttyS0
contains:
-----------------------
192.168.1.10:192.168.1.171
-----------------------



