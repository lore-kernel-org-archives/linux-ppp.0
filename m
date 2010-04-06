From: Sonia Martinez <xonia10@yahoo.es>
Date: Tue, 06 Apr 2010 14:08:03 +0000
Subject: pppd fails when init connection with kernel 2-6-28.10
Message-Id: <28152335.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi all, 

I was using linux kernel 2.6.22 with pppd 2.4.4 in an embedded hardware
(powerpc architecture) with a GPRS serial module. I was able to make a GPRS
connection, but now I've upgraded kernel version to 2-6-28.10 and pppd to
2.4.5 and it doesn't work. These are the log messages after sending the
ATD*99***1# command, when pppd is started:

2000/03/21,18:51:26  daemon.warn pppd[772]: Warning: couldn't open ppp
database /var/run/ppp/pppd2.tdb
2000/03/21,18:51:26 daemon.notice pppd[772]: pppd 2.4.5 started by root, uid
0
2000/03/21,18:51:26 daemon.err pppd[773]: Fatal signal 11
2000/03/21,18:51:26 daemon.info pppd[773]: Exit.
2000/03/21,18:51:26 daemon.err pppd[772]: Couldn't get channe: Input/output
error
2000/03/21,18:51:26 daemon.debug pppd[772]: Script pppd (charshunt) finished
(pid 773), status = 0x7f
2000/03/21,18:51:26 daemon.info pppd[772]: Exit.
2000/03/21,18:51:26 user.err iod: process: The process 772 returned an
error: 1

The configuration file is:

notty
local
lock
debug
ipcp-accept-local
ipcp-accept-remote
noipdefault
novj
noccp
nopcomp
default-asyncmap
receive-all
ifname cell0
child-timeout 0
user "JOHN"
usepeerdns
defaultroute
lcp-echo-interval 30
lcp-echo-failure 2


Has somebody the same problem with this kernel? I've tested the 2.4.4 and
has the same problem, so I guess is the kernel version. 

Thank you very much in advanced, 

Best regards, 

Sonia

-- 
View this message in context: http://old.nabble.com/pppd-fails-when-init-connection-with-kernel-2-6-28.10-tp28152335p28152335.html
Sent from the linux-ppp mailing list archive at Nabble.com.

