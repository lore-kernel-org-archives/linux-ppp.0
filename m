From: Mark Ryden <markryde@gmail.com>
Date: Sat, 12 Jun 2010 10:29:11 +0000
Subject: Question about range of addresses in pppd (invoked against a pppoe
Message-Id: <AANLkTinVWfrKYsL2XZNGyNXdo_AFv8KYLWURJDB6O830@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,
 I had this following problem:
On one machine I have a PPPoE server, which is running by issuing:
pppoe-server -I eth0 -R 10.0.0.10.  -L 10.0.0.20

Now, I an creating ppp connections to this server from a different
remote machine.
This connections are short while connections.

The first connection gets 10.0.0.10, the second gets 10.0.0.11, and so on.
The thing is that after  10.0.0.19 it **does** gets 10.0.0.20 !!
and afterwards it gets 10.0.0.21, 10.0.0.22, and so on.
Is there a way to prevent if and cause it not to get IP addresses
beyond 10.0.0.19 ?

rgs,
Mark
