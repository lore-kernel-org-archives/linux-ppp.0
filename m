From: "=?gb2312?B?stzTwNDA?=" <cyx@fiberhome.com.cn>
Date: Wed, 30 Apr 2008 02:33:13 +0000
Subject: where is the rx interrupt handler in Ppp_generic.c?
Message-Id: <200804301033127661642@fiberhome.com.cn>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi, all! 

I'm confused when I read the kernel's ppp implement. in Ppp_generic.c,the function ppp_create_interface  register the net_device , but I can't find out whereis the rx interrupt handler. So how the net device interface such as ppp0 deal with received packets? 

