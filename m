From: tony.chamberlain@lemko.com
Date: Thu, 03 Jul 2008 17:45:01 +0000
Subject: disconnect
Message-Id: <W6009161227901215107101@webmail35>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

A member of this group helped me set up a pppd server that will reconnect
when disconnected.  It is more elaborate than this but basically

while :
do
   pppd call .......
   sleep 30 # pause before retry
done


then I killed the pptp process and watched it start up again.
The one problem is, the owner of the VPN said it didn't disconnect
correctly so I soon used up all the IP addresses in the IP pool.

Is there a way if a pppd or pptp process dies, to send a normal
exit or disconnect so this won't happen?


