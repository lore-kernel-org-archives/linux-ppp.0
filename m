From: tony.chamberlain@lemko.com
Date: Tue, 08 Sep 2009 16:59:22 +0000
Subject: several sites through router
Message-Id: <W286594864216051252429162@webmail32>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

We have several machines here among which are 192.168.5.66 and 192.168.5.68.
They each are running pptp and try to connect via pppd to another site
(actually in China) and establish a VPN.  Now the first machine connects
fine and sets up an VPN id of 10.0.0.26.  Problem is, the second just times
out.  It connects but never makes a connection.

What I think I finally figured out is that they are both going through router
W.X.Y.Z (I am leaving the IP address of this router anonymous which we use
to connect to the internet), so probably the VPN server in China gets confused
and does not realize it is a new machine, and so just ignores the connection
attempt or something.

Now I have control of all the machines, clients and server, and they are all
running poptop available through CentOS 4.5.  Is there anyway I can make the
server so it allowd multiple connections?  I do specify in the one client
IP address 10.0.0.26 and in the other 10.0.0.27.

Thanks


