From: Marek Pawinski <linux@telkomsa.net>
Date: Sun, 22 Aug 2004 07:41:06 +0000
Subject: ppp stalls
Message-Id: <41284E12.5080909@telkomsa.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi

I had ppp running on a modem conection which ran fine with numerous 
flavours of Linux.

I got a ISDN line and set up ppp to handle the connection. Now i get 
stalled downloads (anything over 100K) including http and ftp with wget. 
The downloads resume after a while but my connection disconnects after 
10 or 20 megs of downloading. Anyone have a solution for this ?

I have tried playing with TCP MSS in the kernel and iptables but that 
does not help.

-- 
Marek

