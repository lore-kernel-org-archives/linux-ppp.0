From: rketcham <Rich.Ketcham@gmail.com>
Date: Fri, 09 May 2008 17:56:12 +0000
Subject: PPPd ioctl, please help!
Message-Id: <17153241.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hello,
I wrote a char driver to interface with an SPI chip which will be connected
(via UART) to a cell modem. The SPI to UART chip works pretty well so far
with custom software (I can send SMS messages for intance) but I'm having
trouble with pppd (version 2.4.4) on the Gumstix distro. 

My question is what are the ioctl commands (including the expected
responses) that I need to support in my driver.   I have included what I
think are some of the ioctl commands into the driver and when they're called
I have the driver print the variable name as defined in ioctls.h. The driver
returns 0 unless it gets TCGETS at which point it returns the baud rate
(B115200). 

WRITE!  --  pppd is writing to the driver
READ! -- pppd is reading from the driver
INTERRUPT --- New data has arrived from the modem to the SPI

Here's the driver and chat print out of when PPPd tries to connect to the
internet via the SPI :

Dec 31 16:18:10 gumstix user.info kernel: Inserting the spi_uart module.
Dec 31 16:18:23 gumstix user.info kernel: PPP generic driver version 2.4.2
Dec 31 16:18:23 gumstix daemon.notice pppd[404]: pppd 2.4.4 started by root,
uid 0
Dec 31 16:18:23 gumstix user.info kernel: Device Open: 1
Dec 31 16:18:23 gumstix user.info kernel: The minor number: 0
Dec 31 16:18:23 gumstix user.info kernel: The device has been opened.
Dec 31 16:18:23 gumstix user.info kernel: TIOCMBIS
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix user.info kernel: TCSETSF
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix user.info kernel: TCSETS
Dec 31 16:18:23 gumstix user.info kernel: TCGETS
Dec 31 16:18:23 gumstix local2.info chat[406]: send (AT^M)
Dec 31 16:18:23 gumstix user.info kernel: WRITE!
Dec 31 16:18:23 gumstix user.info kernel: WRITE!
Dec 31 16:18:23 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:23 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: Interrrupt from somewhere else.
Dec 31 16:18:24 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix user.warn kernel: 15  14  13  12  11  10  9   8   7  
6   5   4   3   2   1   0
Dec 31 16:18:24 gumstix user.warn kernel: 1   1   1   1   1   1   1   1   1  
1   0   0   0   0   0   1
Dec 31 16:18:24 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: Interrrupt from somewhere else.
Dec 31 16:18:24 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix user.warn kernel: 15  14  13  12  11  10  9   8   7  
6   5   4   3   2   1   0
Dec 31 16:18:24 gumstix user.warn kernel: 1   1   1   1   1   1   1   1   1  
1   0   0   0   0   0   1
Dec 31 16:18:24 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix local2.info chat[406]: expect (OK)
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix local2.info chat[406]: AT^M^M
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix user.info kernel: READ!
Dec 31 16:18:24 gumstix local2.info chat[406]: OK
Dec 31 16:18:24 gumstix local2.info chat[406]:  -- got it
Dec 31 16:18:24 gumstix local2.info chat[406]: send (ATD*99***1#^M)
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: Interrrupt from somewhere else.
Dec 31 16:18:24 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix user.warn kernel: 15  14  13  12  11  10  9   8   7  
6   5   4   3   2   1   0
Dec 31 16:18:24 gumstix user.warn kernel: 1   1   1   1   1   1   1   1   1  
1   0   0   0   0   0   1
Dec 31 16:18:24 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:24 gumstix user.info kernel: WRITE!
Dec 31 16:18:24 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:25 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:25 gumstix user.info kernel: INTERRUPT
Dec 31 16:18:25 gumstix user.info kernel: Interrrupt from somewhere else.
Dec 31 16:18:25 gumstix user.warn kernel:
Dec 31 16:18:25 gumstix user.warn kernel: 15  14  13  12  11  10  9   8   7  
6   5   4   3   2   1   0
Dec 31 16:18:25 gumstix user.warn kernel: 1   1   1   1   1   1   1   1   1  
1   0   0   0   0   0   1
Dec 31 16:18:25 gumstix user.warn kernel:
Dec 31 16:18:24 gumstix local2.info chat[406]: expect (CONNECT)
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix local2.info chat[406]: ^M
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix local2.info chat[406]: ATD*99***1#^M^M
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix user.info kernel: READ!
Dec 31 16:18:25 gumstix local2.info chat[406]: CONNECT
Dec 31 16:18:25 gumstix local2.info chat[406]:  -- got it
Dec 31 16:18:25 gumstix local2.info chat[406]: send (dc^M)
Dec 31 16:18:25 gumstix user.info kernel: WRITE!
Dec 31 16:18:25 gumstix user.info kernel: WRITE!
Dec 31 16:18:25 gumstix user.info kernel: WRITE!
Dec 31 16:18:25 gumstix user.info kernel: TCSETS
Dec 31 16:18:25 gumstix user.info kernel: TCGETS
Dec 31 16:18:25 gumstix daemon.info pppd[404]: Serial connection
established.
Dec 31 16:18:25 gumstix user.info kernel: TIOCMBIS
Dec 31 16:18:25 gumstix user.info kernel: TCGETS
Dec 31 16:18:25 gumstix user.info kernel: TCSETSF
Dec 31 16:18:25 gumstix user.info kernel: TIOCEXCL
Dec 31 16:18:25 gumstix user.info kernel: TIOCSETD
Dec 31 16:18:25 gumstix user.info kernel: I don't know what the hell you
just sent... 0x80047437
Dec 31 16:18:25 gumstix daemon.err pppd[404]: Couldn't attach to channel 0:
No such device or address
Dec 31 16:18:25 gumstix user.info kernel: TIOCSETD
Dec 31 16:18:25 gumstix user.info kernel: TCSETSF
Dec 31 16:18:25 gumstix user.info kernel: The device has been closed.
Dec 31 16:18:25 gumstix daemon.info pppd[404]: Exit.


My pppd options are:
usepeerdns
defaultroute
noauth
local
hide-password
noipdefault
lcp-echo-interval 30
lcp-echo-failure 4

Thanks for your help!
Rich




-- 
View this message in context: http://www.nabble.com/PPPd-ioctl%2C-please-help%21-tp17153241p17153241.html
Sent from the linux-ppp mailing list archive at Nabble.com.

