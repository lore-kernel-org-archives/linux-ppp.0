From: <salix@opencores.org>
Date: Tue, 05 May 2015 08:06:34 +0000
Subject: PPP over PCIe
Message-Id: <33cf3cfabb7f5bdd6ea2c37df77eac1d@sarv.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi,

I want to send ppp packets generated in linux ppp module over PCIe 
instead of serial port. and then through FPGA send packets out.

I using RIFFA architecture for send and receive data to/from FPGA via 
PCIe, RIFFA has library in user space to communicate with it's driver.
RIFFA site: https://sites.google.com/a/eng.ucsd.edu/matt-jacobsen/riffa
and: http://riffa.ucsd.edu/
also it use IOCTL for communications.
and riffa driver generate /dev/riffa

Is it possible to send PPP packets over any hardware channel?
can anyone give me a point to how can I do this? how can I send ppp 
packets to my PCIe driver?

is it enough to change ppp_generic.c and ppp_channel.h and tty.c?


Best Regards
salix

