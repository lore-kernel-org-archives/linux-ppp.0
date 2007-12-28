From: wotuzu17 <andiv@gmx.li>
Date: Fri, 28 Dec 2007 22:32:35 +0000
Subject: Using an NTS instead of the local serial device ?
Message-Id: <14532384.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi folks,


I just successfully set up a basic ppp link between 2 Ubuntu 7.10 machines.



The commands look like this:


me@machine1 $ pppd -detach persist lock proxyarp 192.168.10.1:192.168.10.2
/dev/ttyS0 38400 &


me@machine2 $ pppd -detach persist lock defaultroute
192.168.10.2:192.168.10.1 /dev/ttyS0 38400 &


I wonder whether it is posible to use a serial port of an NTS for
communiction instead of the local serial device /dev/ttyS0 ? I own a
Lantronix ETS8P, which is a 8-port Network Terminal Server.


I tried

me@machine1 $ pppd -detach persist lock proxyarp 192.168.10.1:192.168.10.2
ip.of.nts:tcpport 38400 &


without success. 

As I am new to Linux in general, maybe somebody can give me a hint.


Thanks
-- 
View this message in context: http://www.nabble.com/Using-an-NTS-instead-of-the-local-serial-device---tp14532384p14532384.html
Sent from the linux-ppp mailing list archive at Nabble.com.

