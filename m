From: Bill Unruh <unruh@physics.ubc.ca>
Date: Sat, 16 Oct 2004 20:08:10 +0000
Subject: Re: Problem with interface ppp0
Message-Id: <Pine.LNX.4.58.0410161301320.23358@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
In-Reply-To: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Fri, 15 Oct 2004, Tomas Vadfors wrote:

> >If kppp works it is fine. If it does not it is a complete piece of junk,
> >and gives no or completely confusing error messages.
>=20
> You're right about that!
>=20
> >debug
> >in /etc/ppp/options, and have the line
> >local2.*;daemon.*      /var/log/ppplog
> >in /etc/syslog.conf
> >( and run
> >killall -1 syslogd
> >just to make sure)
> >Then look in the file /var/log/ppplog after a connection attempt.
>=20
> Done this! Couldn't find an error (don't really know what I'm looking for
> though). Still not able to access any webpages while connected. Here
> is the output to /var/log/ppplog after an attempt by root:
>=20
> Oct 15 00:26:17 Rohan pppd[2054]: pppd 2.4.2 started by root, uid 0
> Oct 15 00:26:17 Rohan pppd[2054]: using channel 2
> Oct 15 00:26:17 Rohan pppd[2054]: Using interface ppp0
> Oct 15 00:26:17 Rohan pppd[2054]: Connect: ppp0 <--> /dev/ttyS1
> Oct 15 00:26:17 Rohan pppd[2054]: sent [LCP ConfReq id=3D0x1 <asyncmap 0x=
0>=20
> <magic 0x19d71fb2> <pcomp> <accomp>]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [proto=3D0xd] 0a
> Oct 15 00:26:18 Rohan pppd[2054]: Discarded non-LCP packet when LCP not o=
pen
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [proto=3D0x55] 73 65 72 6e 61 6d 6=
5 3a=20
> 20

The remote side is asking you to log on That packet says
sername:

YOu may have sent a carriage return to the far side befor you opened
pppd (you did not include the chat negotiations.-- ie you forgot the
local2:* or you forgot the -v option to chat)


> Oct 15 00:26:18 Rohan pppd[2054]: Discarded non-LCP packet when LCP not o=
pen
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP ConfReq id=3D0x1 <mru 1500>=20
> <asyncmap 0x0> <auth pap> <magic 0x2b736667> <pcomp> <accomp>]

The the remote side seems to give up asking for username and instead
starts ppp negotiation. Weird.


> Oct 15 00:26:18 Rohan pppd[2054]: sent [LCP ConfAck id=3D0x1 <mru 1500>=20
> <asyncmap 0x0> <auth pap> <magic 0x2b736667> <pcomp> <accomp>]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x=
0>=20
> <magic 0x19d71fb2> <pcomp> <accomp>]
> Oct 15 00:26:18 Rohan pppd[2054]: sent [LCP EchoReq id=3D0x0 magic=3D0x19=
d71fb2]
> Oct 15 00:26:18 Rohan pppd[2054]: sent [PAP AuthReq id=3D0x1 user=3D"rix1=
261416"=20
> password=3D<hidden>]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP EchoRep id=3D0x0 magic=3D0x2b=
736667]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [PAP AuthAck id=3D0x1 ""]
> Oct 15 00:26:18 Rohan pppd[2054]: PAP authentication succeeded
> Oct 15 00:26:18 Rohan pppd[2054]: kernel does not support PPP filtering
> Oct 15 00:26:18 Rohan pppd[2054]: sent [CCP ConfReq id=3D0x1 <deflate 15>=
=20
> <deflate(old#) 15>]

Put noccp into /etc/ppp/options.


> Oct 15 00:26:18 Rohan pppd[2054]: sent [IPCP ConfReq id=3D0x1 <compress V=
J 0f=20
> 01> <addr 0.0.0.0>]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [IPCP ConfReq id=3D0x1 <compress V=
J 0f=20
> 00> <addr 82.96.24.3>]
> Oct 15 00:26:18 Rohan pppd[2054]: sent [IPCP ConfAck id=3D0x1 <compress V=
J 0f=20
> 00> <addr 82.96.24.3>]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [LCP ProtRej id=3D0x1 80 fd 01 01 =
00 0c=20
> 1a 04 78 00 18 04 78 00]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [IPCP ConfNak id=3D0x1 <compress V=
J 0f=20
> 00> <addr 82.96.24.131>]
> Oct 15 00:26:18 Rohan pppd[2054]: sent [IPCP ConfReq id=3D0x2 <compress V=
J 0f=20
> 00> <addr 82.96.24.131>]
> Oct 15 00:26:18 Rohan pppd[2054]: rcvd [IPCP ConfAck id=3D0x2 <compress V=
J 0f=20
> 00> <addr 82.96.24.131>]
> Oct 15 00:26:18 Rohan pppd[2054]: Cannot determine ethernet address for=20
> proxy ARP

get rid of the proxyarp option.=20

> Oct 15 00:26:18 Rohan pppd[2054]: local  IP address 82.96.24.131
> Oct 15 00:26:18 Rohan pppd[2054]: remote IP address 82.96.24.3
> Oct 15 00:26:18 Rohan pppd[2054]: Script /etc/ppp/ip-up started (pid 2064)
> Oct 15 00:26:18 Rohan pppd[2054]: Script /etc/ppp/ip-up finished (pid 206=
4),=20
> status =3D 0x0
> Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Connection from host Rohan=
=20
> (127.0.0.1).
> Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Online.
> Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Connection from host Rohan=
=20
> (127.0.0.1).
> Oct 15 00:26:19 Rohan wwwoffled[390]: WWWOFFLE Fetch.
> Oct 15 00:26:29 Rohan wwwoffled[390]: WWWOFFLE Fetch finished.

Apparently you run some program called wwwoffled.

> Oct 15 00:27:16 Rohan pppd[2054]: Terminating on signal 15.
> Oct 15 00:27:16 Rohan pppd[2054]: Script /etc/ppp/ip-down started (pid 21=
36)
> Oct 15 00:27:16 Rohan pppd[2054]: sent [LCP TermReq id=3D0x2 "User reques=
t"]
> Oct 15 00:27:16 Rohan pppd[2054]: rcvd [LCP TermAck id=3D0x2]
> Oct 15 00:27:16 Rohan pppd[2054]: Connection terminated.
> Oct 15 00:27:16 Rohan pppd[2054]: Connect time 1.0 minutes.

One minute after you connected you shut down the connection, or the
other side did.


> Oct 15 00:27:16 Rohan pppd[2054]: Sent 60 bytes, received 58 bytes.
> Oct 15 00:27:16 Rohan pppd[2054]: Waiting for 1 child processes...
> Oct 15 00:27:16 Rohan pppd[2054]:   script /etc/ppp/ip-down, pid 2136
> Oct 15 00:27:16 Rohan wwwoffled[390]: WWWOFFLE Connection from host Rohan=
=20
> (127.0.0.1).
> Oct 15 00:27:16 Rohan wwwoffled[390]: WWWOFFLE Offline.
> Oct 15 00:27:16 Rohan pppd[2054]: Script /etc/ppp/ip-down finished (pid=20
> 2136), status =3D 0x0
> Oct 15 00:27:16 Rohan pppd[2054]: Exit.
>=20
> and it output the following (into ppplog) after I tried as a normal user.=
=20
> Note that
> I now had the "noauth" option in /etc/ppp/options
>=20
> Oct 15 00:29:25 Rohan kdm_greet[2198]: Can't open default user face
> Oct 15 00:30:39 Rohan pppd[2315]: using the noauth option requires root=20
> privilege

I assume that is clear. You CANNOT use the noauth option as a user.=20


>=20
> >It may well  be that your new kernel has not made /dev/ppp (does it
> >exist just after one of your attempts?
>=20
> What I've seen /dev/ppp exists alright.

PPP works fine.

>=20
> >Note also the line
> >"Error opening resolv.conf"
> >Have you checked that /etc/resolv.conf is readable by all?
> >That it even exists?
>=20
> Yep. It's a link to some other file. I think that is readable by all...

You think it is? Why do you not check? do ls -la on that "other file"

>=20
> Thanks alot for all your help so far!
>=20
> Regards Tomas
>=20
> _________________________________________________________________
> Chatt: Tr=E4ffa nya n=E4tkompisar p=E5 Habbo Hotel=20
> http://habbohotel.msn.se/habbo/sv/channelizer
>=20

--=20
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
