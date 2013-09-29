From: Lars Mueller <admin@perfect-privacy.com>
Date: Sun, 29 Sep 2013 10:08:38 +0000
Subject: Wrong remote IP, bug or feature?
Message-Id: <5247FC26.8040200@perfect-privacy.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
I have set remoteip in the pppd.conf to an 10.x.x.x  range, i would 
expect that users get an IP in this range from the server.
However, some users misconfigurations set the remoteip to a 192.x.x IP 
given by the user. So my ip-up and ip-down scripts on the server gets 
called with a user given, wrong, 192.x.x. IP, and not the server 
provided 10.x.x.x
Should a user be allowed to do this or is this a bug? If yes, can i 
block users from providing their own IPs?
As the ip-up and ip-down scripts set per-user firewall rules, it is 
quite a security issue if a user has the possibility to provide an IP of 
his choice, rather than the IP that is given to him by the server.

Thanks in advance

Lars



cat /etc/pptpd.conf :
option /etc/ppp/options.pptpd
connections 200
noipparam
localip 10.14.15.1
remoteip 10.14.15.2-255

cat /etc/ppp/options.pptpd:
mtu 1450
mru 1450
receive-all
defaultroute
default-mru
ktune
name pptpd
refuse-pap
refuse-chap
refuse-mschap
require-mschap-v2
require-mppe-128
ms-dns 192.162.102.50
ms-dns 115.187.74.91
proxyarp
lock
nobsdcomp
   novj
novjccomp
nologfd

