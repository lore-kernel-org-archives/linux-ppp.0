From: "cyx_mail" <cyx_mail@foxmail.com>
Date: Thu, 22 May 2008 02:54:30 +0000
Subject: why kill pppd but pppoe-server die?
Message-Id: <200805221054295315414@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,all:

	(1)when a pppoe connections established ,pppoe-server spwans a child process "pppd". I modified the pppoe-server code a little, and let pppoe-server send SIGTERM to the child process. pppe-server die not the child pppd die.

	(2)But if I use command "kill pppd pid" in SHELL to kill the child pppd , the result pppd die is what I expected.
	
	why?


