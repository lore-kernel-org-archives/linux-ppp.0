From: "Grahame Jordan" <gbj@theforce.com.au>
Date: Sun, 05 Sep 2004 12:59:43 +0000
Subject: ms-dns not working
Message-Id: <37478.203.20.16.2.1094389183.squirrel@webmail.theforce.com.au>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am running a ppp server and it seems that ms-dns does not work.
This may be since I have upgraded to Mandrake 10.0 using kernel
2.6.3-16mdkenterprise and I am using ppp-2.4.2-7mdk.

The options file is thus:
#/etc/ppp/options.ttyS1
debug
kdebug 7
ktune
nodetach
modem
crtscts
proxyarp
asyncmap 0
netmask 255.255.255.224
203.20.16.1:203.20.16.11
ms-dns 203.20.16.1
ms-dns 203.18.20.3


The logs shows something that may be of concern:
Couldn't set pass-filter in kernel:

Any help would be appreciated.

Thanks

Grahame Jordan

# Log output of session
Sep  5 22:07:30 ob1 pppd[10170]: pppd 2.4.2 started by root, uid 0
Sep  5 22:07:30 ob1 pppd[10170]: using channel 9
Sep  5 22:07:30 ob1 pppd[10170]: Using interface ppp1
Sep  5 22:07:30 ob1 pppd[10170]: Connect: ppp1 <--> /dev/tts/1
Sep  5 22:07:30 ob1 pppd[10170]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth pap> <magic 0xde2fd7f8> <pcomp> <accomp>]
Sep  5 22:07:30 ob1 pppd[10170]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0>
<auth pap> <magic 0xde2fd7f8> <pcomp> <accomp>]
Sep  5 22:07:33 ob1 pppd[10170]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth pap> <magic 0xde2fd7f8> <pcomp> <accomp>]
Sep  5 22:07:33 ob1 pppd[10170]: rcvd [LCP ConfReq id=0x2 <asyncmap 0x0>
<magic 0x64a05778> <pcomp> <accomp> <callback CBCP>]
Sep  5 22:07:33 ob1 pppd[10170]: sent [LCP ConfRej id=0x2 <callback CBCP>]
Sep  5 22:07:33 ob1 pppd[10170]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0>
<auth pap> <magic 0xde2fd7f8> <pcomp> <accomp>]
Sep  5 22:07:33 ob1 pppd[10170]: rcvd [LCP ConfReq id=0x3 <asyncmap 0x0>
<magic 0x64a05778> <pcomp> <accomp>]
Sep  5 22:07:33 ob1 pppd[10170]: sent [LCP ConfAck id=0x3 <asyncmap 0x0>
<magic 0x64a05778> <pcomp> <accomp>]
Sep  5 22:07:33 ob1 pppd[10170]: rcvd [LCP code=0xc id=0x4 64 a0 57 78 4d
53 52 41 53 56 35 2e 31 30]
Sep  5 22:07:33 ob1 pppd[10170]: sent [LCP CodeRej id=0x2 0c 04 00 12 64
a0 57 78 4d 53 52 41 53 56 35 2e 31 30]
Sep  5 22:07:33 ob1 pppd[10170]: rcvd [LCP code=0xc id=0x5 64 a0 57 78 4d
53 52 41 53 2d 30 2d 43 4f 4f 4b 49 45]
Sep  5 22:07:33 ob1 pppd[10170]: sent [LCP CodeRej id=0x3 0c 05 00 16 64
a0 57 78 4d 53 52 41 53 2d 30 2d 43 4f 4f 4b 49 45]
Sep  5 22:07:33 ob1 pppd[10170]: rcvd [PAP AuthReq id=0x2 user="clovis"
password=<hidden>]
Sep  5 22:07:33 ob1 pppd[10170]: user clovis logged in
Sep  5 22:07:33 ob1 pppd[10170]: PAP peer authentication succeeded for clovis
Sep  5 22:07:33 ob1 pppd[10170]: Couldn't set pass-filter in kernel:
Invalid argument
Sep  5 22:07:34 ob1 pppd[10170]: local  IP address 203.20.16.1
Sep  5 22:07:34 ob1 pppd[10170]: remote IP address 203.20.16.11
Sep  5 22:09:13 ob1 pppd[10170]: LCP terminated by peer (dM-
Wx^@<M-Mt^@^@^@^@)
Sep  5 22:09:13 ob1 pppd[10170]: Hangup (SIGHUP)
Sep  5 22:09:13 ob1 pppd[10170]: Modem hangup
Sep  5 22:09:13 ob1 pppd[10170]: Connection terminated.
Sep  5 22:09:13 ob1 pppd[10170]: Connect time 1.8 minutes.
Sep  5 22:09:13 ob1 pppd[10170]: Sent 57001 bytes, received 29828 bytes.
Sep  5 22:09:13 ob1 pppd[10170]: Connect time 1.8 minutes.
Sep  5 22:09:13 ob1 pppd[10170]: Sent 57001 bytes, received 29828 bytes.
Sep  5 22:09:13 ob1 pppd[10170]: Exit.

