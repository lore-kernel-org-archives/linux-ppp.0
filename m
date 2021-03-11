From: lyl2019@mail.ustc.edu.cn
Date: Thu, 11 Mar 2021 12:34:44 +0000
Subject: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, davem@davemloft.net
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

File: drivers/net/ppp/ppp_generic.c

In ppp_unregister_channel, pch could be freed in ppp_unbridge_channels()
but after that pch is still in use. Inside the function ppp_unbridge_channels,
if "pchbb = pch" is true and then pch will be freed.

I checked the commit history and found that this problem is introduced from
4cf476ced45d7 ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioctls").

I have no idea about how to generate a suitable patch, sorry.
