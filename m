From: "Tomas Vadfors" <tomas_vadfors@hotmail.com>
Date: Fri, 15 Oct 2004 18:51:03 +0000
Subject: Re: Problem with interface ppp0
Message-Id: <BAY12-F42tdb2HVZSOJ0002d825@hotmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
In-Reply-To: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

>If kppp works it is fine. If it does not it is a complete piece of junk,
>and gives no or completely confusing error messages.

You're right about that!

>debug
>in /etc/ppp/options, and have the line
>local2.*;daemon.*      /var/log/ppplog
>in /etc/syslog.conf
>( and run
>killall -1 syslogd
>just to make sure)
>Then look in the file /var/log/ppplog after a connection attempt.

Done this! Couldn't find an error (don't really know what I'm looking for
though). Still not able to access any webpages while connected. Here
is the output to /var/log/ppplog after an attempt by root:

Oct 15 00:26:17 Rohan pppd[2054]: pppd 2.4.2 started by root, uid 0
Oct 15 00:26:17 Rohan pppd[2054]: using channel 2
Oct 15 00:26:17 Rohan pppd[2054]: Using interface ppp0
Oct 15 00:26:17 Rohan pppd[2054]: Connect: ppp0 <--> /dev/ttyS1
Oct 15 00:26:17 Rohan pppd[2054]: sent [LCP ConfReq id=3D0x1 <asyncmap 0x0>=
=20
<magic 0x19d71fb2> <pcomp> <accomp>]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [proto=3D0xd] 0a
Oct 15 00:26:18 Rohan pppd[2054]: Discarded non-LCP packet when LCP not open
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [proto=3D0x55] 73 65 72 6e 61 6d 65 =
3a=20
20
Oct 15 00:26:18 Rohan pppd[2054]: Discarded non-LCP packet when LCP not open
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP ConfReq id=3D0x1 <mru 1500>=20
<asyncmap 0x0> <auth pap> <magic 0x2b736667> <pcomp> <accomp>]
Oct 15 00:26:18 Rohan pppd[2054]: sent [LCP ConfAck id=3D0x1 <mru 1500>=20
<asyncmap 0x0> <auth pap> <magic 0x2b736667> <pcomp> <accomp>]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0>=
=20
<magic 0x19d71fb2> <pcomp> <accomp>]
Oct 15 00:26:18 Rohan pppd[2054]: sent [LCP EchoReq id=3D0x0 magic=3D0x19d7=
1fb2]
Oct 15 00:26:18 Rohan pppd[2054]: sent [PAP AuthReq id=3D0x1 user=3D"rix126=
1416"=20
password=3D<hidden>]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP EchoRep id=3D0x0 magic=3D0x2b73=
6667]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [PAP AuthAck id=3D0x1 ""]
Oct 15 00:26:18 Rohan pppd[2054]: PAP authentication succeeded
Oct 15 00:26:18 Rohan pppd[2054]: kernel does not support PPP filtering
Oct 15 00:26:18 Rohan pppd[2054]: sent [CCP ConfReq id=3D0x1 <deflate 15>=20
<deflate(old#) 15>]
Oct 15 00:26:18 Rohan pppd[2054]: sent [IPCP ConfReq id=3D0x1 <compress VJ =
0f=20
01> <addr 0.0.0.0>]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [IPCP ConfReq id=3D0x1 <compress VJ =
0f=20
00> <addr 82.96.24.3>]
Oct 15 00:26:18 Rohan pppd[2054]: sent [IPCP ConfAck id=3D0x1 <compress VJ =
0f=20
00> <addr 82.96.24.3>]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP ProtRej id=3D0x1 80 fd 01 01 00=
 0c=20
1a 04 78 00 18 04 78 00]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [IPCP ConfNak id=3D0x1 <compress VJ =
0f=20
00> <addr 82.96.24.131>]
Oct 15 00:26:18 Rohan pppd[2054]: sent [IPCP ConfReq id=3D0x2 <compress VJ =
0f=20
00> <addr 82.96.24.131>]
Oct 15 00:26:18 Rohan pppd[2054]: rcvd [IPCP ConfAck id=3D0x2 <compress VJ =
0f=20
00> <addr 82.96.24.131>]
Oct 15 00:26:18 Rohan pppd[2054]: Cannot determine ethernet address for=20
proxy ARP
Oct 15 00:26:18 Rohan pppd[2054]: local  IP address 82.96.24.131
Oct 15 00:26:18 Rohan pppd[2054]: remote IP address 82.96.24.3
Oct 15 00:26:18 Rohan pppd[2054]: Script /etc/ppp/ip-up started (pid 2064)
Oct 15 00:26:18 Rohan pppd[2054]: Script /etc/ppp/ip-up finished (pid 2064)=
,=20
status =3D 0x0
Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Connection from host Rohan=20
(127.0.0.1).
Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Online.
Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Connection from host Rohan=20
(127.0.0.1).
Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Fetch.
Oct 15 00:26:29 Rohan wwwoffled[390]: WWWOFFLE Fetch finished.
Oct 15 00:27:16 Rohan pppd[2054]: Terminating on signal 15.
Oct 15 00:27:16 Rohan pppd[2054]: Script /etc/ppp/ip-down started (pid 2136)
Oct 15 00:27:16 Rohan pppd[2054]: sent [LCP TermReq id=3D0x2 "User request"]
Oct 15 00:27:16 Rohan pppd[2054]: rcvd [LCP TermAck id=3D0x2]
Oct 15 00:27:16 Rohan pppd[2054]: Connection terminated.
Oct 15 00:27:16 Rohan pppd[2054]: Connect time 1.0 minutes.
Oct 15 00:27:16 Rohan pppd[2054]: Sent 60 bytes, received 58 bytes.
Oct 15 00:27:16 Rohan pppd[2054]: Waiting for 1 child processes...
Oct 15 00:27:16 Rohan pppd[2054]:   script /etc/ppp/ip-down, pid 2136
Oct 15 00:27:16 Rohan wwwoffled[390]: WWWOFFLE Connection from host Rohan=20
(127.0.0.1).
Oct 15 00:27:16 Rohan wwwoffled[390]: WWWOFFLE Offline.
Oct 15 00:27:16 Rohan pppd[2054]: Script /etc/ppp/ip-down finished (pid=20
2136), status =3D 0x0
Oct 15 00:27:16 Rohan pppd[2054]: Exit.

and it output the following (into ppplog) after I tried as a normal user.=20
Note that
I now had the "noauth" option in /etc/ppp/options

Oct 15 00:29:25 Rohan kdm_greet[2198]: Can't open default user face
Oct 15 00:30:39 Rohan pppd[2315]: using the noauth option requires root=20
privilege

>It may well  be that your new kernel has not made /dev/ppp (does it
>exist just after one of your attempts?

What I've seen /dev/ppp exists alright.

>Note also the line
>"Error opening resolv.conf"
>Have you checked that /etc/resolv.conf is readable by all?
>That it even exists?

Yep. It's a link to some other file. I think that is readable by all...

Thanks alot for all your help so far!

Regards Tomas

_________________________________________________________________
Chatt: Tr=E4ffa nya n=E4tkompisar p=E5 Habbo Hotel=20
http://habbohotel.msn.se/habbo/sv/channelizer

