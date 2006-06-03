From: xeb@mail.ru
Date: Sat, 03 Jun 2006 08:07:25 +0000
Subject: driver for pptp
Message-Id: <E1FmRAL-0004G1-00.xeb-mail-ru@f25.mail.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello.
I have developed the driver for Point-to-Point Tunneling Protocol (PPTP).
This driver works in pair with plugin for pppd.
It is enough to use pppd's plugin for start of the client.
Also there is a server (based on pptpd) which uses this driver.
By results of my testing the speed of transfer has increased on >50% and cpu usage has decreased on >50% in comparison with original pptpd and pptpclient.
I have published the project on http://accel-pptp.sourceforge.net/
There is more then 65 downloads but no any bug report (and no any positive result report).
I think the driver still requires testing.

Hope this driver will go to a kernel tree and will make linux more productive.
