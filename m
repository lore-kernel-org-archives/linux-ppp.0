From: Thilo Riessner <thilo@riessner.de>
Date: Wed, 06 Sep 2006 12:45:20 +0000
Subject: serial device access from welcome script
Message-Id: <200609061445.20406.thilo@riessner.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

From a program called by the welcome script which tries to access the serial 
port (in this case /dev/ttyI0) I get the errormessage:
	Port or socket open error!
I guess, that the serial port is blocked by the pppd.
Is there any possibility to access the serial port nevertheless?
Thanks for any help

Thilo
