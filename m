From: vandana salve <vandanasalve@gmail.com>
Date: Thu, 30 Dec 2010 09:29:59 +0000
Subject: Error configuring 2 Huawei (EC1261 model )CDMA modem at same time
Message-Id: <AANLkTimJxOafgL6qg9ENCRHWqptb14tpzQY7Gi2G10YG@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi Guys,

Getting problem while trying to configure the 2 Huawei/Tata Photon on
DM365 ARM board.

The two modems are detected by linux kernel having ports as ttyUSB0-2
and ttyUSB3-5.
Individual single modem Configuration/setting works successfully. Gets
the interface ppp0 up with IP address.
Facing problem while trying to bring up both the modems.
The first modem gets configured successfully. The problem comes while
trying to get the second modem up.
The second pppd command gives the "LCP: timeout sending
Config-Requests" error and the modem hangs up.
At a time only one modem is configured successfully. This works with
either of the modem but not with both modems at same time

Here the commands to configure both the modems.
This command configure the modem /dev/ttyUSB0 successfully. ppp0
interface is created, IP address is assigned to it.
# pppd connect 'chat -v "" AT OK ATDT#777~' /dev/ttyUSB0 9600 crtscts
debug defaultroute
##Configuring the second modem ttyUSB3, gives LCP timeout error
#pppd connect 'chat -v "" ATDT#777~' /dev/ttyUSB3 9600 crtscts debug
nodefaultroute

Thanks,
Vandana

The pppd command for second modem configuration gives the "LCP:
timeout sending Config-Requests" error.
Snippet from /var/log/messages

Jan=A0 1 00:13:38 dm365 daemon.notice pppd[1212]: pppd 2.4.5 started by
root, uid 0
Jan=A0 1 00:13:39 dm365 local2.info chat[1214]: send (ATDT#777~^M)
Jan=A0 1 00:13:39 dm365 daemon.debug pppd[1212]: Script chat -v ""
ATDT#777~ finished (pid 1213), status =3D 0x0
Jan=A0 1 00:13:39 dm365 daemon.info pppd[1212]: Serial connection establish=
ed.
Jan=A0 1 00:13:39 dm365 daemon.debug pppd[1212]: using channel 5
Jan=A0 1 00:13:39 dm365 daemon.info pppd[1212]: Using interface ppp1
Jan=A0 1 00:13:39 dm365 daemon.notice pppd[1212]: Connect: ppp1 <--> /dev/t=
tyUSB3
Jan=A0 1 00:13:40 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:13:43 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:13:46 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:13:49 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:13:52 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:13:55 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:13:58 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:14:01 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:14:04 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:14:07 dm365 daemon.debug pppd[1212]: sent [LCP ConfReq
id=3D0x1 <asyncmap 0x0> <magic 0xa5be6153> <pcomp> <accomp>]
Jan=A0 1 00:14:10 dm365 daemon.warn pppd[1212]: LCP: timeout sending
Config-Requests
Jan=A0 1 00:14:10 dm365 daemon.notice pppd[1212]: Connection terminated.
Jan=A0 1 00:14:11 dm365 daemon.notice pppd[1212]: Modem hangup
Jan=A0 1 00:14:11 dm365 daemon.info pppd[1212]: Exit.



---snippet of ppp0
Jan=A0 1 00:04:53 dm365 daemon.notice pppd[1148]: pppd 2.4.5 started by
root, uid 0
Jan=A0 1 00:04:54 dm365 local2.info chat[1150]: send (AT^M)
Jan=A0 1 00:04:54 dm365 local2.info chat[1150]: expect (OK)
Jan=A0 1 00:04:54 dm365 local2.info chat[1150]: AT^M^M
Jan=A0 1 00:04:54 dm365 local2.info chat[1150]: OK
Jan=A0 1 00:04:54 dm365 local2.info chat[1150]:=A0 -- got it
Jan=A0 1 00:04:54 dm365 local2.info chat[1150]: send (ATDT#777~^M)
Jan=A0 1 00:04:54 dm365 daemon.debug pppd[1148]: Script chat -v "" AT OK
ATDT#777~ finished (pid 1149), status =3D 0x0
Jan=A0 1 00:04:54 dm365 daemon.info pppd[1148]: Serial connection establish=
ed.
Jan=A0 1 00:04:54 dm365 daemon.debug pppd[1148]: using channel 1
Jan=A0 1 00:04:54 dm365 daemon.info pppd[1148]: Using interface ppp0
Jan=A0 1 00:04:54 dm365 daemon.notice pppd[1148]: Connect: ppp0 <--> /dev/t=
tyUSB0
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [LCP ConfReq
id=3D0x1 <mru 1400> <asyncmap 0x0> <auth chap MD5> <magic 0x9]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [LCP ConfReq id=3D0x1]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [LCP ConfRej
id=3D0x1 <asyncmap 0x0> <magic 0x97690fa3> <pcomp> <accomp>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [LCP ConfAck id=3D0x1]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [LCP ConfReq
id=3D0x2 <mru 1400> <auth chap MD5>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [LCP ConfAck
id=3D0x2 <mru 1400> <auth chap MD5>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [CHAP Challenge
id=3D0x1 <b685f33f93dc37f740f9285330ae8cf3>, name =3D ""]
Jan=A0 1 00:04:55 dm365 daPPP Deflate Compression module registered
emon.debug pppd[1148]: sent [CHAP Response id=3D0x1
<81cf308f876b620470c2b7bcbfa8fcdb>, name =3D "dm365"]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [CHAP Success id=3D0x=
1 ""]
Jan=A0 1 00:04:55 dm365 daemon.info pppd[1148]: CHAP authentication succeed=
ed
Jan=A0 1 00:04:55 dm365 daemon.notice pppd[1148]: CHAP authentication succe=
eded
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [CCP ConfReq
id=3D0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [IPCP ConfReq
id=3D0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [IPCP ConfReq
id=3D0x1 <addr 172.29.243.145>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [IPCP ConfAck
id=3D0x1 <addr 172.29.243.145>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [LCP ProtRej
id=3D0x35 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: Protocol-Reject for
'Compression Control Protocol' (0x80fd) received
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: rcvd [IPCP ConfRej
id=3D0x1 <compress VJ 0f 01>]
Jan=A0 1 00:04:55 dm365 daemon.debug pppd[1148]: sent [IPCP ConfReq
id=3D0x2 <addr 0.0.0.0>]
Jan=A0 1 00:04:56 dm365 daemon.debug pppd[1148]: rcvd [IPCP ConfNak
id=3D0x2 <addr 14.97.16.165>]
Jan=A0 1 00:04:56 dm365 daemon.debug pppd[1148]: sent [IPCP ConfReq
id=3D0x3 <addr 14.97.16.165>]
Jan=A0 1 00:04:56 dm365 daemon.debug pppd[1148]: rcvd [IPCP ConfAck
id=3D0x3 <addr 14.97.16.165>]
Jan=A0 1 00:04:56 dm365 daemon.notice pppd[1148]: local=A0 IP address 14.97=
.16.165
Jan=A0 1 00:04:56 dm365 daemon.notice pppd[1148]: remote IP address 172.29.=
243.145
Jan=A0 1 00:04:56 dm365 daemon.debug pppd[1148]: Script /etc/ppp/ip-up
started (pid 1156)
Jan=A0 1 00:04:56 dm365 daemon.debug pppd[1148]: Script /etc/ppp/ip-up
finished (pid 1156), status =3D 0x0
