From: "Desai, Ankit (Export)" <ankit.desai@pw.utc.com>
Date: Tue, 07 Mar 2006 15:51:30 +0000
Subject: LCP terminated by peer (Normal Termination by NCP) - Please help
Message-Id: <BAD05164DBF6BF44AD171A36DBC6E77505DACADD@pusehe0w.eh.pweh.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
I am trying to use EDGE wireless modem to create a ppp connection. The
wireless modem is an embedded Multi-tech edge modem. The problem is: after
the modem authenticates with the network, it just terminates the connection.
It acknowledges the username/password as can be seen from messages below.
Then after few seconds, it just terminates the connection without giving the
IP address. I believe the ppp-options file and ppp-chat script are fine
because those scripts works with another cingular EDGE SIM card(GC82) but
not with this particular sim card (Sierra Wireless AC860). 

The error message is: LCP terminated by peer (Normal Termination by NCP). 

Can anybody help me out by deciphering the messages below. 

Here is the log of the messages: 

Serial connection established.

using channel 1

Using interface ppp0

Connect: ppp0 <--> /dev/ttyS0

rcvd [LCP ConfReq id=0x2 <mru 1600> <auth pap> <magic 0xd8397cb7> <asyncmap
0x0> <pcomp> <accomp>]

sent [LCP ConfReq id=0x1 <magic 0x58526cf7> <pcomp> <accomp>]

sent [LCP ConfRej id=0x2 <mru 1600> <asyncmap 0x0>]

rcvd [LCP ConfAck id=0x1 <magic 0x58526cf7> <pcomp> <accomp>]

rcvd [LCP ConfReq id=0x3 <auth pap> <magic 0xd8397cb7> <pcomp> <accomp>]

sent [LCP ConfAck id=0x3 <auth pap> <magic 0xd8397cb7> <pcomp> <accomp>]

sent [PAP AuthReq id=0x1 user="username" password="password"]

rcvd [PAP AuthAck id=0x1 "TTP Com PPP - Password Verified OK"]

Remote message: TTP Com PPP - Password Verified OK

sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress VJ 0f 01> <ms-dns1
0.0.0.0> <ms-dns3 0.0.0.0>]

sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15>]

rcvd [LCP ProtRej id=0x0 80 fd 01 01 00 0c 1a 04 78 00 18 04 78 00 35]

rcvd [LCP TermReq id=0x0 "Normal Termination by NCP"]

LCP terminated by peer (Normal Termination by NCP)

sent [LCP TermAck id=0x0]

Connection terminated.

Thanks for your help.

Regards,

Ankit

