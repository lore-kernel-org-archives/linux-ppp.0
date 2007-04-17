From: maimam <m_a_imam@yahoo.com>
Date: Tue, 17 Apr 2007 04:17:17 +0000
Subject: ppp interface
Message-Id: <10028998.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi 

I am having a hard time getting PPTP to work in a lab environemnt. I have
two linux systems connected directly. I have installed one of them as server
and the other one as client from the directions given at sourceforge.

My problem:

since i dont have a modem i dont have a ppp interface. pptp tries to use
ppp0 as a tunnel interface. so when i try to start a pptp connection it
gives me something like this. 

[root@localhost ppp]# pppd pty 'pptp 1.1.1.101 --nolaunchpppd' call pptp1
debug dump logfd 2 nodetach 
pppd options in effect:
debug           # (from command line)
nodetach                # (from command line)
logfd 2         # (from command line)
dump            # (from command line)
noauth          # (from /etc/ppp/options.pptp)
refuse-chap             # (from /etc/ppp/options.pptp)
refuse-mschap           # (from /etc/ppp/options.pptp)
refuse-eap              # (from /etc/ppp/options.pptp)
name netscreen          # (from /etc/ppp/peers/pptp1)
remotename PPTP         # (from /etc/ppp/peers/pptp1)
                # (from /etc/ppp/options.pptp)
pty pptp 1.1.1.101 --nolaunchpppd               # (from
/etc/ppp/peers/pptp1)
mru 1490                # (from /etc/ppp/peers/pptp1)
mtu 1490                # (from /etc/ppp/peers/pptp1)
ipparam pptp1           # (from /etc/ppp/peers/pptp1)
nobsdcomp               # (from /etc/ppp/options.pptp)
nodeflate               # (from /etc/ppp/options.pptp)
using channel 9
Using interface ppp0
Connect: ppp0 <--> /dev/pts/3
Child process pptp 1.1.1.101 --nolaunchpppd (pid 26619) terminated with
signal 15
Modem hangup
Connection terminated.

Although i have pppd in the processes i dont have any ppp interface. pppd
version 2.4.2. What should i do?

Appreciate your help...

maimam



-- 
View this message in context: http://www.nabble.com/ppp-interface-tf3588739.html#a10028998
Sent from the linux-ppp mailing list archive at Nabble.com.

