From: "C.J" <c.james.cj@gmail.com>
Date: Fri, 30 May 2008 01:37:43 +0000
Subject: howto setup a route by netlink socket
Message-Id: <200805300937396564081@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi list,

I want to set a route by netlink socket but I've no idea how to do it clearly.

Here I've make up a virtual interface that is ppp0 by ioctl, we want to it could communicate with peer side.
We need just a route, right?  Netlink can do this. As there are many attributes , we need tell kernel what's our route.
But I'm not sure what we should build as attributes that we will send to kernel.

Now I get a simple talk, it contains 2 attrs follow 'rtmsg' structure. 
 RTA_DST, 192.168.1.1 -- the peer IP
 RTA_SRC, 192.168.1.2 -- our local IP
And it cannot work, kernel return [No such Device] error.
I think there are something I lost, pls help me and point out the errors.

Reg


--
c.j
  



