From: "Yang Ke" <yangke@utstar.com>
Date: Fri, 23 Apr 2004 16:25:29 +0000
Subject: pppd and radius client
Message-Id: <001e01c4294f$99df25f0$cd01fea9@cn.utstarcom.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello ,

    I just met a problem that when dialup user disconnects
his/her line(modem for example). the remote pppd detected
this and make a account request to Radius server, some information
such as calling number and called number are included in 
this request message. calling number, for example, is retrieved
by calling ioctl() on /dev/ttyxxxx. if disconnect the line directly,
ioctl() return nothing;  if logoff from application, ioctl() return 
the calling number correctly. 
    can anybody give some explanation on this and is there any
way to solve ?

Thanks,
YK

