From: Srinidhi M <srinidhi.m26@gmail.com>
Date: Tue, 07 Feb 2012 14:53:49 +0000
Subject: CPU processing time between using TCP and UDP
Message-Id: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi All,

We have an application which uses the TCP/UDP packets. The packet
processing time between application and session layers is same for TCP
as well as UDP. However, there is a packet processing time difference
after sending it to layer 4 either TCP or UDP. Generally, we are
calling the socket() API for transmitting the packet. We are seeing
the difference in Linux Network Stack.

Could you please let me know, which module in TCP/IP is consuming more
time than UDP? How can we reduce packet processing time when sending
through TCP stack? Please let me know your thoughts.

Please let me know, the appropriate mailing list name for this type of
questions.

Thanks in advance.

Regards,
Srinidhi M.
