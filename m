From: tony.chamberlain@lemko.com
Date: Thu, 22 Oct 2009 19:34:48 +0000
Subject: pptp client server
Message-Id: <W394922552633941256240088@webmail17>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Am I correct in assuming (and I am asking for Linux, CentOS 4.5 to be 
exact) that when a pptp client makes a connection to a pptp servcer
(does the call), the server actually assigns (or more like "picks") the 
next available ip address from the ip pool you provide, even before it
examines the login and password from the client?

If so, then not only can you not specify a specific VPN IP address for a
client, but also (assume the IP pool is 10.0.0.26-29 and 10.0.0.26 is the
only one in use), even if the client specifies 10.0.0.29: in the 
/etc/ppp/options.pptp file, if 27 is  the next available one, it will
use 27 instead of 29 and fail, even though the client requested 29?

If this is true, is there any way the client can always get the same
IP address (other than just by happenstance logging in when it is the next
available)?

I notice that pptpd on the server spawns a pppd process with like 
10.0.0.98:10.0.0.27. This pppd is spawned by pptpd when the
connection.  Anyway to intervene in this spawning and change the ip to
what I wish (i.e. 10.0.0.29).  

By the way I know one thing you are thinking, but I can't have an ip pool
of just 1, because we have at least 3 or 4 clients which need to connect.


