From: Murat Sezgin <sezginmurat@gmail.com>
Date: Tue, 24 Sep 2013 18:48:16 +0000
Subject: pppoe_connect fucntion
Message-Id: <CAJVjm4BRr4oU0Z92jpTsaY-D5esgEydu_pdnSgK4nOrbX+nZbQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

I have a quick question. I am using kernel mode PPPoE and rp-pppoe
package as a user space daemon. When I kill the pppd process, in the
kernel pppoe.c driver the pppoe_connect() function is called first and
then pppoe_release() is called.

Why the pppoe_connect() is called in this tear down process?

Regards,
Murat
