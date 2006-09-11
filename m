From: "Ludovic MARCILLY" <lmarcilly@aressi.fr>
Date: Mon, 11 Sep 2006 12:34:47 +0000
Subject: Authentication problems
Message-Id: <DIIE.00000CF70001E1E1@aressi.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

I try to use linux pptp client in order to connect to a Windows 2003
Server but without any success.

When i try to connect without authentication, it seems to work. So i
try with PAP, CHAP, MSCHAP and MSCHAPv2 but it doesn't work.

Here are my logs for a test with PAP:

Sep 11 11:56:17 LinuxBox kernel: MPPE/MPPC encryption/compression
module unregistered
Sep 11 11:56:17 LinuxBox kernel: CSLIP: code copyright 1989 Regents of
the University of California
Sep 11 11:56:17 LinuxBox kernel: PPP generic driver version 2.4.2
Sep 11 11:56:17 LinuxBox kernel: PPP BSD Compression module registered
Sep 11 11:56:17 LinuxBox kernel: PPP Deflate Compression module
registered
Sep 11 11:56:17 LinuxBox kernel: MPPE/MPPC encryption/compression
module registered
Sep 11 11:56:17 LinuxBox pppd[1834]: pppd 2.4.2 started by root, uid 0
Sep 11 11:56:17 LinuxBox pptp[1838]: anon log[main:pptp.c:243]: The
synchronous pptp option is NOT activated
Sep 11 11:56:17 LinuxBox pppd[1834]: using channel 1
Sep 11 11:56:17 LinuxBox pppd[1834]: Using interface ppp0
Sep 11 11:56:17 LinuxBox pppd[1834]: Connect: ppp0 <--> /dev/pts/2
Sep 11 11:56:17 LinuxBox pptp[1841]: anon
log[ctrlp_rep:pptp_ctrl.c:243]: Sent control packet type is 1
'Start-Control-Connection-Request'
Sep 11 11:56:17 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:721]: Received Start Control Connection
Reply
Sep 11 11:56:17 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:755]: Client connection established.
Sep 11 11:56:18 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <auth pap> <magic 0x9bb62805> <pcomp> <accomp>]
Sep 11 11:56:18 LinuxBox pptp[1841]: anon
log[ctrlp_rep:pptp_ctrl.c:243]: Sent control packet type is 7
'Outgoing-Call-Request'
Sep 11 11:56:18 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:841]: Received Outgoing Call Reply.
Sep 11 11:56:18 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:880]: Outgoing call established (call ID 0,
peer's call ID 1161).
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <auth pap> <magic 0x9bb62805> <pcomp> <accomp>]
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x0 <mru
1400> <auth pap> <magic 0x309a32f4> <pcomp> <accomp> <callback CBCP>
<mrru 1614> <endpoint
[local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]> <
17 04 00 22>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfRej id=0x0 <callback
CBCP> <mrru 1614> < 17 04 00 22>]
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfAck id=0x1 <asyncmap
0x0> <auth pap> <magic 0x9bb62805> <pcomp> <accomp>]
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x1 <mru
1400> <auth pap> <magic 0x309a32f4> <pcomp> <accomp> <endpoint
[local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfAck id=0x1 <mru
1400> <auth pap> <magic 0x309a32f4> <pcomp> <accomp> <endpoint
[local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [PAP AuthReq id=0x1
user="vpnman" password=<hidden>]
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:933]: PPTP_SET_LINK_INFO received from
peer_callid 32791
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:936]:   send_accm is 00000000, recv_accm is
FFFFFFFF
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
warn[ctrlp_disp:pptp_ctrl.c:939]: Non-zero Async Control Character Maps
are not supported!
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [PAP AuthAck id=0x1 ""]
Sep 11 11:56:21 LinuxBox pppd[1834]: PAP authentication succeeded
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:933]: PPTP_SET_LINK_INFO received from
peer_callid 32791
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:936]:   send_accm is FFFFFFFF, recv_accm is
FFFFFFFF
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
warn[ctrlp_disp:pptp_ctrl.c:939]: Non-zero Async Control Character Maps
are not supported!
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x3 <mru
1400> <auth pap> <magic 0x31655e15> <pcomp> <accomp> <callback CBCP>
<mrru 1614> <endpoint
[local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]> <
17 04 00 22>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x2 <asyncmap
0x0> <auth pap> <magic 0x7715a449> <pcomp> <accomp>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfRej id=0x3 <callback
CBCP> <mrru 1614> < 17 04 00 22>]
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfRej id=0x2 <auth
pap>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x3 <asyncmap
0x0> <magic 0x7715a449> <pcomp> <accomp>]
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x4 <mru
1400> <auth pap> <magic 0x31655e15> <pcomp> <accomp> <endpoint
[local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfAck id=0x4 <mru
1400> <auth pap> <magic 0x31655e15> <pcomp> <accomp> <endpoint
[local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfAck id=0x3 <asyncmap
0x0> <magic 0x7715a449> <pcomp> <accomp>]
Sep 11 11:56:21 LinuxBox pppd[1834]: peer refused to authenticate:
terminating link
Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP TermReq id=0x4 "peer
refused to authenticate"]
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:933]: PPTP_SET_LINK_INFO received from
peer_callid 32791
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:936]:   send_accm is 00000000, recv_accm is
FFFFFFFF
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
warn[ctrlp_disp:pptp_ctrl.c:939]: Non-zero Async Control Character Maps
are not supported!
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:933]: PPTP_SET_LINK_INFO received from
peer_callid 32791
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:936]:   send_accm is FFFFFFFF, recv_accm is
FFFFFFFF
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
warn[ctrlp_disp:pptp_ctrl.c:939]: Non-zero Async Control Character Maps
are not supported!
Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP TermAck id=0x4 "peer
refused to authenticate"]
Sep 11 11:56:21 LinuxBox pppd[1834]: Connection terminated.
Sep 11 11:56:21 LinuxBox pptp[1838]: anon
warn[decaps_hdlc:pptp_gre.c:197]: short read (-1): Input/output error
Sep 11 11:56:21 LinuxBox pptp[1838]: anon
warn[decaps_hdlc:pptp_gre.c:209]: pppd may have shutdown, see pppd log
Sep 11 11:56:21 LinuxBox pppd[1834]: Waiting for 1 child processes...
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[callmgr_main:pptp_callmgr.c:228]: Closing connection
Sep 11 11:56:21 LinuxBox pppd[1834]:   script pptp 192.168.8.239
--nolaunchpppd, pid 1838
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_rep:pptp_ctrl.c:243]: Sent control packet type is 12
'Call-Clear-Request'
Sep 11 11:56:21 LinuxBox pppd[1834]: Script pptp 192.168.8.239
--nolaunchpppd finished (pid 1838), status = 0x0
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:912]: Call disconnect notification received
(call id 0)
Sep 11 11:56:21 LinuxBox pppd[1834]: Exit.
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[ctrlp_error:pptp_ctrl.c:195]: Result code is 0 'Unknown Result
Code'. Error code is 0, Cause code is 0
Sep 11 11:56:21 LinuxBox pptp[1841]: anon
log[call_callback:pptp_callmgr.c:77]: Closing connection
Sep 11 11:56:23 LinuxBox pptp[1841]: anon
log[pptp_conn_close:pptp_ctrl.c:425]: Closing PPTP connection
Sep 11 11:56:23 LinuxBox pptp[1841]: anon
log[ctrlp_rep:pptp_ctrl.c:243]: Sent control packet type is 3
'Stop-Control-Connection-Request'
Sep 11 11:56:23 LinuxBox pptp[1841]: anon
log[ctrlp_disp:pptp_ctrl.c:782]: Received Stop Control Connection
Reqply.

On the windows server logs, i can see that vpnman session is opened but
i see "peer refused to authenticate: terminating link" in my linux
logs.

Here are my config files:

/etc/ppp/peers/Tunnel1:

file /var/vpn/pptp-client/options
pty "pptp 192.168.8.239 --nolaunchpppd"
name vpnman
remotename VpnServer
nomppe
noauth
require-pap
refuse-chap
refuse-mschap
refuse-mschap-v2

/var/vpn/pptp-client/options

debug
lock
mtu 1490

/etc/ppp/pap-secrets

vpnman VpnServer password *
VpnServer vpnman password *

Do you have any idea about my problem?

Thanks a lot in advance for your help.

Ludo. 


