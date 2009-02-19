From: tony.chamberlain@lemko.com
Date: Thu, 19 Feb 2009 15:08:52 +0000
Subject: ppp revisited
Message-Id: <W5561928533241901235056132@webmail24>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I can update my question a bit.

We have a machine, 192.168.5.88, which can go out on the net.  It connects
to a PPTP VPN our customer supplies (address is 204.XX.XX.XX).  When it
connects it gets an IP address of 10.0.1.3 as in the following:

    ppp0  Link encap:Point-to-Point Protocol
          inet addr:10.0.1.3  P-t-P:10.0.1.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1456  Metric:1
          RX packets:58 errors:0 dropped:0 overruns:0 frame:0
          TX packets:72 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3

Forward is set to 1:

     sysctl net.ipv4.ip_forward
     net.ipv4.ip_forward = 1

and /etc/sysconfig/network:
     NETWORKING=yes
     HOSTNAME=Lemko88
     FORWARD_IPV4=true

And then from doing a man on ppd it said ktune and proxyarp would make
it available to other machines:

  /usr/sbin/pppd call BugTussel debug logfd 1 nodetach ktune proxyarp persist linkname host

Then from my 192.168.5.191 machine I did an

    ip route add 10.0.1.3 via 192.168.5.88 dev eth0

I could ping 10.0.1.3 but not any other machines on the VPN.  I even
tried

    ip route add 10.0.0.66 via 10.0.1.3 dev ppp0
and independently

    ip route add 10.0.1.1 via 10.0.1.3 dev ppp0
    ip route add 10.0.0.66 via 10.0.1.1

but still could not reach 10.0.0.66 (or 10.10.0.2 or others).

Does the host machine I call have to set something too?

Tony







