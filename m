From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Date: Tue, 23 Nov 2004 10:57:42 +0000
Subject: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <200411231157.43347.arekm@pld-linux.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi,

Something changed in ppp 2.4.3. Now after disconnect I'm getting:

Nov 17 16:00:23 arm pppd[17641]: local  IP address xx
Nov 17 16:00:24 arm pppd[17641]: remote IP address xx
Nov 17 16:00:24 arm pppd[17641]: primary   DNS address xx
Nov 17 16:00:24 arm pppd[17641]: secondary DNS address xx
Nov 18 16:00:21 arm pppd[17641]: LCP terminated by peer
Nov 18 16:00:21 arm pppd[17641]: Connect time 1440.0 minutes.
Nov 18 16:00:21 arm pppd[17641]: Sent 97298679 bytes, received 1835111999=20
bytes.
Nov 18 16:00:22 arm pppd[17641]: Child process /etc/ppp/ip-down (pid 19630)=
=20
terminated with signal 15
Nov 18 16:00:24 arm pppd[17641]: Connection terminated.
Nov 18 16:00:25 arm pppd[17641]: Using interface ppp0
Nov 18 16:00:25 arm pppd[17641]: Connect: ppp0 <--> /dev/pts/12
Nov 18 16:00:56 arm pppd[17641]: LCP terminated by peer
Nov 18 16:00:59 arm pppd[17641]: Connection terminated.
Nov 18 16:00:59 arm pppd[17641]: tcflush failed: Bad file descriptor
Nov 18 16:00:59 arm pppd[17641]: Using interface ppp0
Nov 18 16:00:59 arm pppd[17641]: Connect: ppp0 <--> /dev/pts/13
Nov 18 16:01:29 arm pppd[17641]: LCP terminated by peer
Nov 18 16:01:32 arm pppd[17641]: Connection terminated.
Nov 18 16:01:32 arm pppd[17641]: tcflush failed: Bad file descriptor
Nov 18 16:01:32 arm pppd[17641]: Using interface ppp0
Nov 18 16:01:32 arm pppd[17641]: Connect: ppp0 <--> /dev/pts/15
Nov 18 16:02:02 arm pppd[17641]: LCP terminated by peer
Nov 18 16:02:05 arm pppd[17641]: Connection terminated.
Nov 18 16:02:05 arm pppd[17641]: tcflush failed: Bad file descriptor
Nov 18 16:02:05 arm pppd[17641]: Using interface ppp0

With 2.4.2 there was no problem with ,,tcflush failed: Bad file descriptor'=
'=20
on the same kernel.

pppd is called with:
/usr/sbin/pppd lock persist holdoff 30 maxfail 0 crtscts asyncmap 00000000 =

defaultroute usepeerdns mtu 1480 user xyz noauth unit 0 pty "pppoa -I eth1"=
=20
ipparam ppp0 linkname ppp0

where pppoa comes from eagle-usb.

Did anyone seen such problem with new ppp?
--=20
Arkadiusz Mi=B6kiewicz                    PLD/Linux Team
http://www.t17.ds.pwr.wroc.pl/~misiek/  http://ftp.pld-linux.org/
