From: Thilo Riessner <thilo@riessner.de>
Date: Thu, 21 Sep 2006 15:19:23 +0000
Subject: failure during first LCP Packets
Message-Id: <200609211719.24720.thilo@riessner.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am connecting to a Endres and Hauser Fieldgate modem using pppd 2.4.1 and 
capiplugin 1.31 or an analog modem from behind a telephone system. Sometimes 
it works flawlessly, but sometimes the remote modem seems not to hear the 
pppd's answer. It sends the CHAP or IPCP packet several times, and pppd 
answers it every time, but it does not lead to success. 
It is the same behaviour with several remote modems of the same type and from 
different linux systems.
There are indices that this behaviour does not occur, when calling the remote 
modem from outside the company, but I didn't verify that so long. Does 
anybody know what may be going on here, and has a hint how to work around?

Thilo
