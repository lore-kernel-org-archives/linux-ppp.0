From: tony.chamberlain@lemko.com
Date: Thu, 08 Jul 2010 12:40:12 +0000
Subject: routing
Message-Id: <W9208026513142721278592812@webmail19>
List-Id: <linux-ppp.vger.kernel.org>
References: <W3133827767292401233331800@webmail16>
In-Reply-To: <W3133827767292401233331800@webmail16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have three machines.  One, Machine A, is in China and acts as a PPP server.  It has an external IP address that I ppp to from machine B.  Machine
B is on our 192.168.5 network and has IP 192.168.5.27.  It can get out 
to Internet.  When B ppp's to A, A gets 10.0.0.98 and B gets 10.0.0.26.
A nd B need to exchange messgages and have the from and to ips be correct
(which they are).

Now I have machine C, 192.168.5.139.  I am trying to avoid having to install
PPP on it but it has to communicate with both B and A.  B is, of course, no
problem.  It can be reached via 192.168.5.27 and for some reason I cannot
figure out, 10.0.0.26 also works from C to B.

To get C to be able to communicate with A I did the following:

in C:  ip route replace 10.0.0.98 via 192.168.5.27    # Route to 98 through 27
in A:  ip route replace 192.168.5.139 via 10.0.0.26   # reverse

in B (more complicated):
   ip forward is set to 1
   iptables -t nat -A POSTROUTING -s 192.168.5.139 -o ppp0 -j MASQUERADE

This allows me to go to 10.0.0.98 from A and to 192.168.5.139 from C.
This works fine for ssh, scp, etc.  However, when an IP message is sent
from A to C, it appears the return (or FROM) IP address is B (10.0.0.26)
not A (192.168.5.139) so when A tries to respond it sends to the wrong
location (B).  I imagine it is because of the masquerade

I can't change all incoming traffic for B to C because A also needs to
correspond with B.  Is there any iptables command I can use to preserve
C's address, but also preserve B's address when the message is from B?

I can just install ppp on A but it is a pain in 5.4 and does not always
work right.

Thanks
p.s. and yes B and machines are CentOS 5.4 and A is 4.5


