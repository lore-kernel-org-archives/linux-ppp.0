From: p.boehm@d-trust.net
Date: Thu, 16 Sep 2004 15:23:19 +0000
Subject: no ppp-link
Message-Id: <OF2DE58F2A.8E19EA8C-ONC1256F11.005437DB@bln.d-trust.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi, I try to set up a ppp link of course, but if I use pppd or diald or wvdial or somethings else:
never a ppp-device is created.

     /* command-line to set up a ppp-link ... */
     # pppd -d call isp

     /* content of /etc/ppp/peers/isp */
     ttyS0 19200 crtscts
     connect '/usr/sbin/chat -v -f /etc/ppp/chat-isp'

     /* content of /etc/ppp/chat-isp */
     ABORT "NO CARRIER"
     ABORT "NO DIALTONE"
     ABORT "ERROR"
     ABORT "NO ANSWER"
     ABORT "Username/Password Incorrect"
     "" "at"
     OK "at&d0&c1"
     OK "atdt0172229000"
     "name:" "^Ua"
     "word:" "\qa"
     "ispts" "\q^Uppp"
     "~-^Uppp-~"


Connection is established, but data will not routed to ppp-device, because it not exists...

I thought (and I still thinking that) it's a problem in configuration (kernel, pppd, network
config-files)
So I read documentations, man pages, messageboards in INet and all other stuff I could get. But
nothing helps.
And the problem is always the same. No PPP-Device!

pb

(If someone needs config files or somethings else for analyzing the problem feel free to ask me!)

