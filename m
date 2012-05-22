From: "Kristian R. Evensen" <kristrev@simula.no>
Date: Tue, 22 May 2012 17:35:12 +0000
Subject: PPP connection stuck at bad configuration-ack
Message-Id: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I am having some troubles establing a PPP connection to my ISP,
Network Norway, using the Huawei E173 modem. Sometimes it works,
however, most of the time the connection never receives a valid
configuration-ack. This usually happens right after boot, which is
critical as I want the connection to come up automatically. As ppp is
initiated, the chatscript is successful. I also spoke to the
technicians at the ISP, and they cant find any errors in the script or
configuration, and can also see in their systems that a connection is
established. However, the connection is torn down after around 30
seconds, which is the time it takes before pppd terminates.

I am not sure where the error lays, so I wonder if anyone else has
seen something similar or has any tips on how to proceed with figuring
this out? Output from pppd, as well as the chatscript and pppd options
can be found here: http://pastebin.com/z8crcxR6

Thanks in advance for the help,
Kristian
