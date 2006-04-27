From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Thu, 27 Apr 2006 23:49:00 +0000
Subject: Troubleshooting MPPE problem.
Message-Id: <20060427234900.GA25365@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Sorry for the kinda/sorta cross-post.  I'm hoping someone on the ppp list
might be a bit more familiar with this type of issue...

I *believe* it to be an MPPE problem.

Got a new client who we set a server up for running Poptop 1.3.1 and pppd
2.4.3.  Client has a VOP Radius server (made by Vircom -- apparently
unsupported now although still some docs for it on their website).

First off, everything works fine if I configure authentication to use our
Radiator-based Radius server.

After a lot of tweaking finally got VOP to send back the proper reply
attributes and authentication succeeds and the tunnel is brought up.
However, no data passes over the tunnel.  Upon closer examination of debug
logs, it appears that MPPE is failing to negotiate properly as I am seeing
many fo the Unsupported protocol rejection messages that often correspond
with this.

Sure enough, if I disbale MPPE as a requirement the tunnel authenticates,
comes up and I can pass traffic.

I tried various combinations of options in my options file (nopcomp, etc) to
no avail.  I am wondering if perhaps the VOP Radius server is doing
something wrong when it generates its MPPE keys?

BTW, this is trying with both pptpclient 1.7.0 based clients and Windows XP
based clients.  I am using the MPPE module built into the 2.6.16 kernel (no
MPPC).

The following is debug log contents of a broken connection:

Apr 27 16:18:41 vqmgmt pptpd[18541]: MGR: Launching /usr/sbin/pptpctrl to h=
andle client
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: local address =3D 72.242.124.101
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: remote address =3D 72.242.124.125
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: pppd speed =3D 115200
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: pppd options file =3D /etc/ppp/o=
ptions.pptpd
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Client 10.29.1.18 control connec=
tion started
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Received PPTP Control Message (t=
ype: 1)
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Made a START CTRL CONN RPLY pack=
et
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: I wrote 156 bytes to the client.
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Sent packet to client
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Received PPTP Control Message (t=
ype: 7)
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Set parameters to 100000000 maxb=
ps, 64 window size
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Made a OUT CALL RPLY packet
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Starting call (launching pppd, o=
pening GRE)
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: pty_fd =3D 6
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: tty_fd =3D 7
Apr 27 16:18:41 vqmgmt pptpd[18542]: CTRL (PPPD Launcher): program binary =
=3D /usr/sbin/pppd
Apr 27 16:18:41 vqmgmt pptpd[18542]: CTRL (PPPD Launcher): local address =
=3D 72.242.124.101
Apr 27 16:18:41 vqmgmt pptpd[18542]: CTRL (PPPD Launcher): remote address =
=3D 72.242.124.125
Apr 27 16:18:41 vqmgmt pppd[18542]: Plugin radius.so loaded.
Apr 27 16:18:41 vqmgmt pppd[18542]: RADIUS plugin initialized.
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: I wrote 32 bytes to the client.
Apr 27 16:18:41 vqmgmt pppd[18542]: Plugin radattr.so loaded.
Apr 27 16:18:41 vqmgmt pptpd[18541]: CTRL: Sent packet to client
Apr 27 16:18:42 vqmgmt pppd[18542]: RADATTR plugin initialized.
Apr 27 16:18:42 vqmgmt pptpd[18541]: CTRL: Received PPTP Control Message (t=
ype: 15)
Apr 27 16:18:42 vqmgmt pppd[18542]: pppd 2.4.3 started by root, uid 0
Apr 27 16:18:42 vqmgmt pptpd[18541]: CTRL: Got a SET LINK INFO packet with =
standard ACCMs
Apr 27 16:18:42 vqmgmt pptpd[18541]: GRE: accepting packet #0
Apr 27 16:18:42 vqmgmt pppd[18542]: using channel 503
Apr 27 16:18:42 vqmgmt pppd[18542]: Using interface ppp0
Apr 27 16:18:42 vqmgmt pppd[18542]: Connect: ppp0 <--> /dev/pts/2
Apr 27 16:18:42 vqmgmt pppd[18542]: sent [LCP ConfReq id=3D0x1 <mru 1456> <=
asyncmap 0x0> <auth chap MS-v2> <magic 0x8b565dc4>]
Apr 27 16:18:42 vqmgmt pppd[18542]: rcvd [LCP ConfReq id=3D0x0 <mru 1400> <=
magic 0xd50595a> <pcomp> <accomp> <callback CBCP>]
Apr 27 16:18:42 vqmgmt pptpd[18541]: GRE: Bad checksum from pppd.
Apr 27 16:18:42 vqmgmt pppd[18542]: sent [LCP ConfRej id=3D0x0 <pcomp> <acc=
omp> <callback CBCP>]
Apr 27 16:18:42 vqmgmt pptpd[18541]: GRE: accepting packet #1
Apr 27 16:18:42 vqmgmt pppd[18542]: rcvd [LCP ConfAck id=3D0x1 <mru 1456> <=
asyncmap 0x0> <auth chap MS-v2> <magic 0x8b565dc4>]
Apr 27 16:18:42 vqmgmt pptpd[18541]: GRE: accepting packet #2
Apr 27 16:18:42 vqmgmt pppd[18542]: rcvd [LCP ConfReq id=3D0x1 <mru 1400> <=
magic 0xd50595a>]
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [LCP ConfAck id=3D0x1 <mru 1400> <=
magic 0xd50595a>]
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [LCP EchoReq id=3D0x0 magic=3D0x8b=
565dc4]
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [CHAP Challenge id=3D0x9d <dcc4a16=
dc52070e637da7a6f1b70b554>, name =3D "pptpd"]
Apr 27 16:18:43 vqmgmt pptpd[18541]: GRE: accepting packet #3
Apr 27 16:18:43 vqmgmt pptpd[18541]: GRE: accepting packet #4
Apr 27 16:18:43 vqmgmt pppd[18542]: rcvd [LCP code=3D0xc id=3D0x2 0d 50 59 =
5a 4d 53 52 41 53 56 35 2e 31 30]
Apr 27 16:18:43 vqmgmt pptpd[18541]: CTRL: Received PPTP Control Message (t=
ype: 15)
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [LCP CodeRej id=3D0x2 0c 02 00 12 =
0d 50 59 5a 4d 53 52 41 53 56 35 2e 31 30]
Apr 27 16:18:43 vqmgmt pptpd[18541]: CTRL: Ignored a SET LINK INFO packet w=
ith real ACCMs!
Apr 27 16:18:43 vqmgmt pppd[18542]: rcvd [LCP code=3D0xc id=3D0x3 0d 50 59 =
5a 4d 53 52 41 53 2d 30 2d 4e 45 54 4f 50 53 2d 52 41 59]
Apr 27 16:18:43 vqmgmt pptpd[18541]: GRE: accepting packet #5
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [LCP CodeRej id=3D0x3 0c 03 00 1a =
0d 50 59 5a 4d 53 52 41 53 2d 30 2d 4e 45 54 4f 50 53 2d 52 41 59]
Apr 27 16:18:43 vqmgmt pptpd[18541]: GRE: accepting packet #6
Apr 27 16:18:43 vqmgmt pppd[18542]: rcvd [LCP EchoRep id=3D0x0 magic=3D0xd5=
0595a]
Apr 27 16:18:43 vqmgmt pppd[18542]: rcvd [CHAP Response id=3D0x9d <75824d35=
6e18f8d07279448823bd6ecf000000000000000034a46694e2ff0f75f28172bb1a8df6503e6=
2d96b4e73d9da00>, name =3D "digitalpath@veriqikdsl.com"]
Apr 27 16:18:43 vqmgmt pppd[18542]: RADATTR plugin wrote 10 line(s) to file=
 /var/run/radattr.ppp0.
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [CHAP Success id=3D0x9d "S=FD255B1=
7DFDFB95D964FC238DEF066C579BA0807"]
Apr 27 16:18:43 vqmgmt pppd[18542]: sent [CCP ConfReq id=3D0x1 <mppe +H -M =
+S -L -D -C>]
Apr 27 16:18:43 vqmgmt pptpd[18541]: GRE: accepting packet #7
Apr 27 16:18:43 vqmgmt pptpd[18541]: GRE: accepting packet #8
Apr 27 16:18:43 vqmgmt pppd[18542]: rcvd [CCP ConfReq id=3D0x4 <mppe +H +M =
+S +L -D +C>]
Apr 27 16:18:44 vqmgmt pptpd[18541]: GRE: accepting packet #9
Apr 27 16:18:44 vqmgmt pppd[18542]: sent [CCP ConfNak id=3D0x4 <mppe +H -M =
+S -L -D -C>]
Apr 27 16:18:44 vqmgmt pppd[18542]: rcvd [IPCP ConfReq id=3D0x5 <addr 0.0.0=
.0> <ms-dns1 0.0.0.0> <ms-wins 0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins 0.0.0.0>]
Apr 27 16:18:44 vqmgmt pppd[18542]: sent [IPCP TermAck id=3D0x5]
Apr 27 16:18:44 vqmgmt pppd[18542]: rcvd [CCP ConfAck id=3D0x1 <mppe +H -M =
+S -L -D -C>]
Apr 27 16:18:44 vqmgmt pptpd[18541]: GRE: accepting packet #10
Apr 27 16:18:44 vqmgmt pppd[18542]: rcvd [CCP ConfReq id=3D0x6 <mppe +H -M =
+S -L -D -C>]
Apr 27 16:18:44 vqmgmt pppd[18542]: sent [CCP ConfAck id=3D0x6 <mppe +H -M =
+S -L -D -C>]
Apr 27 16:18:44 vqmgmt pppd[18542]: MPPE 128-bit stateless compression enab=
led
Apr 27 16:18:44 vqmgmt pppd[18542]: sent [IPCP ConfReq id=3D0x1 <addr 72.24=
2.124.101>]
Apr 27 16:18:44 vqmgmt pptpd[18541]: GRE: accepting packet #11
Apr 27 16:18:44 vqmgmt pppd[18542]: rcvd [IPCP ConfAck id=3D0x1 <addr 72.24=
2.124.101>]
Apr 27 16:18:44 vqmgmt pptpd[18541]: GRE: accepting packet #12
Apr 27 16:18:44 vqmgmt pppd[18542]: rcvd [IPCP ConfReq id=3D0x7 <addr 0.0.0=
.0> <ms-dns1 0.0.0.0> <ms-wins 0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins 0.0.0.0>]
Apr 27 16:18:44 vqmgmt pppd[18542]: sent [IPCP ConfRej id=3D0x7 <ms-wins 0.=
0.0.0> <ms-wins 0.0.0.0>]
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #13
Apr 27 16:18:45 vqmgmt pppd[18542]: rcvd [IPCP ConfReq id=3D0x8 <addr 0.0.0=
.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Apr 27 16:18:45 vqmgmt pppd[18542]: sent [IPCP ConfNak id=3D0x8 <addr 72.24=
2.124.125> <ms-dns1 72.242.124.4> <ms-dns3 72.242.124.101>]
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #14
Apr 27 16:18:45 vqmgmt pppd[18542]: rcvd [IPCP ConfReq id=3D0x9 <addr 72.24=
2.124.125> <ms-dns1 72.242.124.4> <ms-dns3 72.242.124.101>]
Apr 27 16:18:45 vqmgmt pppd[18542]: sent [IPCP ConfAck id=3D0x9 <addr 72.24=
2.124.125> <ms-dns1 72.242.124.4> <ms-dns3 72.242.124.101>]
Apr 27 16:18:45 vqmgmt pppd[18542]: found interface eth0 for proxy arp
Apr 27 16:18:45 vqmgmt pppd[18542]: local  IP address 72.242.124.101
Apr 27 16:18:45 vqmgmt pppd[18542]: remote IP address 72.242.124.125
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #15
Apr 27 16:18:45 vqmgmt pppd[18542]: Script /etc/ppp/ip-up started (pid 1855=
8)
Apr 27 16:18:45 vqmgmt pppd[18542]: rcvd [proto=3D0xf5] 6b 9f a2 fa 26 72 1=
7 61 34 79 1d 18 b2 18 16 67 96 f5 cc 18 d8 84 99 c6 c9 e5 13 b4 b8 d9 c9 5=
3 ...
Apr 27 16:18:45 vqmgmt pppd[18542]: Unsupported protocol 0xf5 received
Apr 27 16:18:45 vqmgmt pppd[18542]: sent [LCP ProtRej id=3D0x4 00 f5 6b 9f =
a2 fa 26 72 17 61 34 79 1d 18 b2 18 16 67 96 f5 cc 18 d8 84 99 c6 c9 e5 13 =
b4 b8 d9 ...]
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #16
Apr 27 16:18:45 vqmgmt pppd[18542]: rcvd [proto=3D0xecda] 00 3c 08 44 15 06=
 cb 28 8b 2b 93 b8 7d b9 6f 22 8d 89 ba bd 4d d0 a0 ac aa 8b a7 f5 b9 ea fd=
 92 ...
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #17
Apr 27 16:18:45 vqmgmt pppd[18542]: Unsupported protocol 0xecda received
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #18
Apr 27 16:18:45 vqmgmt pppd[18542]: sent [LCP ProtRej id=3D0x5 ec da 00 3c =
08 44 15 06 cb 28 8b 2b 93 b8 7d b9 6f 22 8d 89 ba bd 4d d0 a0 ac aa 8b a7 =
f5 b9 ea ...]
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #19
Apr 27 16:18:45 vqmgmt pppd[18542]: Script /etc/ppp/ip-up finished (pid 185=
58), status =3D 0x0
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #20
Apr 27 16:18:45 vqmgmt pppd[18542]: rcvd [proto=3D0xa20] 55 54 f8 ce f2 bb =
19 46 8d 10 7b a0 ab 21 a3 d8 6a 78 30 2b 23 8c 03 63 fd 95 91 ab 53 38 9e =
6a ...
Apr 27 16:18:45 vqmgmt pptpd[18541]: GRE: accepting packet #21
Apr 27 16:18:46 vqmgmt pppd[18542]: Unsupported protocol 0xa20 received
Apr 27 16:18:46 vqmgmt pptpd[18541]: GRE: accepting packet #22
Apr 27 16:18:46 vqmgmt pppd[18542]: sent [LCP ProtRej id=3D0x6 0a 20 55 54 =
f8 ce f2 bb 19 46 8d 10 7b a0 ab 21 a3 d8 6a 78 30 2b 23 8c 03 63 fd 95 91 =
ab 53 38 ...]
Apr 27 16:18:46 vqmgmt pptpd[18541]: GRE: accepting packet #23
Apr 27 16:18:46 vqmgmt pppd[18542]: rcvd [proto=3D0x60d0] e8 0d 05 5e d5 90=
 f8 c5 13 81 a7 8d f6 e9 1f 44 f1 84 e0 a7 d8 f2 a5 fe 5f a4 e7 01 db b9 6e=
 8e ...
Apr 27 16:18:46 vqmgmt pptpd[18541]: GRE: accepting packet #24
Apr 27 16:18:46 vqmgmt pppd[18542]: Unsupported protocol 0x60d0 received
Apr 27 16:18:46 vqmgmt pptpd[18541]: GRE: accepting packet #25
Apr 27 16:18:46 vqmgmt pppd[18542]: sent [LCP ProtRej id=3D0x7 60 d0 e8 0d =
05 5e d5 90 f8 c5 13 81 a7 8d f6 e9 1f 44 f1 84 e0 a7 d8 f2 a5 fe 5f a4 e7 =
01 db b9 ...]
Apr 27 16:18:46 vqmgmt pppd[18542]: rcvd [proto=3D0xe1] cd bc 35 b6 7c d5 d=
1 38 2f 3f 6f 28 ce 8a af e1 61 04 7f ea c5 d6 c1 ae 16 52 c4 f6 84 92 97 8=
4 ...
Apr 27 16:18:46 vqmgmt pppd[18542]: Unsupported protocol 0xe1 received
Apr 27 16:18:46 vqmgmt pppd[18542]: sent [LCP ProtRej id=3D0x8 00 e1 cd bc =
35 b6 7c d5 d1 38 2f 3f 6f 28 ce 8a af e1 61 04 7f ea c5 d6 c1 ae 16 52 c4 =
f6 84 92 ...]
Apr 27 16:18:46 vqmgmt pppd[18542]: rcvd [proto=3D0x13] dc a4 88 35 2e 2e a=
0 3a ec de 21 ad ce 2d d6 84 97 4d a4 82 4d 87 4e 84 ba 66 83 2e 34 73 57 d=
2 ...
Apr 27 16:18:46 vqmgmt pppd[18542]: Unsupported protocol 0x13 received

And so on and so on...

The only interesting thing I see in the MPPE negotiation is that the client
wants to use compression but we tell them no and things seem to continue
along fine.

Service-Type Framed-User
Framed-Protocol PPP
Acct-Interim-Interval 300
Ascend-Data-Rate 1572864
Ascend-Xmit-Rate 393216
MS-MPPE-Encryption-Policy=20
Class 6f
MS-CHAP2-Success \325S=18B7C455AB26E0A48595762AFF906DDC397D9367
MS-MPPE-Send-Key \200\023\347;
MS-MPPE-Recv-Key \200\024\357K\027\360q\032syZ\334\206\262\325K\352\354\310=
l\2457\304{\262\232\252/I\347U6\346s

I notice the MS-MPPE-*-Key's do not seem to differ much over different
client connects.  This is different than what I've observed with our clients
using Radiator.  Don't know if it necessarliy points to the VOP Radius
server or not though.

Anyways, any suggestions of something I could try?  Going to dig more into
the VOP Radius server and see if I can determine how it is generating those
keys.
