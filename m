From: Thilo Riessner <thilo@riessner.de>
Date: Thu, 21 Sep 2006 08:18:02 +0000
Subject: tty-device when using capiplugin
Message-Id: <200609211018.03456.thilo@riessner.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Using pppd with capiplugin, everything works fine when starting it from a 
comand line. But when it is started by cron daemon, there is the following 
error message:
	no device specified and stdin is not a tty
I guess, that the reason is, that I don't give pppd a device name, for capi 
don't uses it anyway. And calling it command line, pppd uses stdin as device. 
Being called by crond, there is no stdin, and pppd fails. 
What device should I give to pppd when calling it in background (without 
stdin)? Using /dev/null works, but is it sensfull?

Thilo
