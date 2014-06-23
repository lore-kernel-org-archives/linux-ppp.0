From: Hernan Freschi <hjf@hjf.com.ar>
Date: Mon, 23 Jun 2014 01:10:09 +0000
Subject: Fwd: RADATTR files empty
Message-Id: <CALruTQdoqFKT1xyHmmX9n5kKeYSGanx+fHGRsDM=thYLQH0E=g@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,
I have a problem with PPP + RP-PPPOE. I'm authenticating against
FreeRADIUS which returns a valid Access-Accept packet, and two more AV
pairs, Cisco-AVPair. The problem is that the radattr.pppN files are
created, but they're empty.

In syslog I see: RADATTR plugin wrote 0 line(s) to file /var/run/radattr.ppp6.

radtest gives this output:

root@acceso-rc:~# radtest xxx xxx localhost 0 testing123
Sending Access-Request of id 2 to 127.0.0.1 port 1812
        User-Name = "xxx"
        User-Password = "xxx"
        NAS-IP-Address = 127.0.1.1
        NAS-Port = 0
        Message-Authenticator = 0x00000000000000000000000000000000
rad_recv: Access-Accept packet from host 127.0.0.1 port 1812, id=2, length1
        Cisco-AVPair = "lcp:interface-config#1=service-policy input 192"
        Cisco-AVPair = "lcp:interface-config#2=service-policy output 768"

My pppoe-server-options file:

root@acceso-rc:~# cat /etc/ppp/pppoe-server-options
plugin radius.so
plugin radattr.so
radius-config-file /etc/radiusclient/radiusclient.conf
name pppoe
auth
#login

ms-dns 10.67.220.220
ms-dns 10.67.222.222
refuse-mschap
refuse-pap
require-chap

proxyarp
nodefaultroute
debug
dump

#lock
nomultilink
nobsdcomp
ipparam CLIENTEPPPOE
