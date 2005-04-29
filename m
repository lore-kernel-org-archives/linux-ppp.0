From: "Eduardo Ogasawara" <ppp@solucionar.com>
Date: Fri, 29 Apr 2005 11:25:02 +0000
Subject: Four doubts about ppp
Message-Id: <009701c54cae$16185100$640da8c0@N1>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

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




