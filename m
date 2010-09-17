From: tony.chamberlain@lemko.com
Date: Fri, 17 Sep 2010 13:34:07 +0000
Subject: COuple questions regarding ppp
Message-Id: <W297245581100211284730447@webmail32>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello

We had a customer, call them BT.  They set up a PPP server for us, so
that I would do a ppp connection from my machine (Linux) to their's it
would establish a connection.  My machine is a 192 and they set up a remote
IP address for me something like 10.1.1.16 or something.  Their local network
was 10.0.0.0/8 so I did an  ip route replace 10.0.0.0/8 dev ppp0 or something
like that.  Then I could route to their machines from mine.

Now, I am setting up ppp.  I have a client (call it florida) that people
from here will use at a trade show in florida.  I am setting up a server
(call it illinois).  I succesfully established a connection from florid
to illinois.  Got an IP of the following:
   inet addr:192.168.0.1  P-t-P:192.168.0.234  Mask:255.255.255.255
(this on the server.  Client is reversed of course).  On the client
(florida) is also a 192 network.  The illinois machine has no 192 network
on it, so I did an  ip route replace 192.168.5/0 dev ppp0.  When I try
from illinois to ssh to 192.168.5.191 (which I can do from florida as it is
the same network) it times out and cannot find a route.  I did do the
sysctl on each machine to set net.ipv4.ip_forward to 1.  Is there something
else I am not doing that I need to? Yes and I know I am trying to route
from ppp server to client which is opposite of BT.  And yes I can ssh to
192.168.0.234 and even 192.168.5.65 which is the IP address of florida.

The other question.  Both machines are in my control and are Linux.  florida
is CentOS 4.5 and flordia just says redhat release 5.  Anyway right now I
have no encryption.  Not sure it is necessary but I would feel better.  But
any combination of requires and refuses I try results in SIGUSR1 on the
client (florida) side.  What is a good configuration to have at both sides
so packets are encrypted?  This is not super duper top secret info so
a lower encryption method would be OK.



