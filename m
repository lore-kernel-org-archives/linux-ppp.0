From: "Eduardo Ogasawara" <ppp@solucionar.com>
Date: Wed, 04 May 2005 14:01:40 +0000
Subject: Re: Four doubts about ppp
Message-Id: <003801c550b1$cbd7acf0$640da8c0@N1>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have solved problems (3) and (4).

These two problems were solved installing PPP-Server on Linux, instead of 
using a Windows VPN Server.

Using PPP-Server, I was able to make the reverse routing using the 
${PEERNAME} in /etc/ppp/if-up to differ a normal client
call from our other side.

Still I don't know how to stop a tunnel from a command line, I always need 
to establish a VNC remote connection, and run pptpconfig
to stop the tunnel.

If you have any tip to problems (1) e (2) I would be glad.

Thanks,

Eduardo


----- Original Message ----- 
From: Eduardo Ogasawara
To: ppp@vger.kernel.org
Sent: Friday, April 29, 2005 8:22 AM
Subject: Four doubts about ppp


Hi, everybody,


The following command starts a tunnel.

pppd call tunnel_name

(1) How can I stop the tunnel?

(2) At the server side, when I execute a "service iptables restart", why my 
client pppd tunnel hangs?

A have two servers. One is adsl the other have fixed IP, ok?

Site 1
2 Fixed IP x.y.z.1 and x.y.z.2


Site 2
adsl - dynamic ip w.w.w.w

(3) Why I need to make a client call from Site 2 to Site 1 via x.y.z.2, and 
from Site 1 to Site 2 at w.w.w.w via x.y.z.1, otherwise it does not work?

(4) Is there a easy way to pass the dynamic ip from site 2 to site 1 so that 
Site 1 can change its ppp-client call?

Thanks for your help, and forgive me from my poor English... 

