From: a b <theorieduchaos@yahoo.fr>
Date: Thu, 28 Oct 2004 12:45:17 +0000
Subject: ppp 2.4.3 cvs authentication issue
Message-Id: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hello,

First sorry for my poor English.

I'm trying to set up a pptpd server under Mandrake
10.0 and I think my problem is related to pppd and the
authentication.

server: 10.0.0.178, client 10.0.0.124
ppp-2.4.3-0.cvs_20040527.5mdk
pptpd-server-1.2.1-1mdk
kernel 2.6.3-19mdksecure

server:=20
cat /etc/pptpd.conf
option /etc/ppp/options.poptop
stimeout 10
speed 115200
localip 10.0.0.178
remoteip 10.0.1.234-238

cat /etc/ppp/options.poptop=20
logfile /tmp/vpn.log
dump
debug
refuse-pap
refuse-eap
refuse-chap
refuse-mschap
require-mschap-v2
lock

cat /etc/ppp/chap-secrets
# Secrets for authentication using CHAP
# client        server  secret                  IP
addresses
adrian  *       adrian  *


client:

cat /etc/ppp/peers/pptp0=20
logfile /tmp/vpn.log
dump
debug
refuse-pap
refuse-eap
refuse-chap
refuse-mschap
require-mschap-v2
lock
pty "/usr/sbin/pptp 10.0.0.178 --nolaunchpppd"
nodetach

cat /etc/ppp/chap-secrets
# Secrets for authentication using CHAP
# client        server  secret                  IP
addresses
adrian  *       adrian  *

cat -A /etc/ppp/chap-secrets
# Secrets for authentication using CHAP$
# client^Iserver^Isecret^I^I^IIP addresses$
adrian^I*^Iadrian^I*$

logs on the server side:
tail -f /tmp/vpn.log -n 100

pppd options in effect:
debug           # (from /etc/ppp/options.poptop)
logfile /tmp/vpn.log            # (from
/etc/ppp/options.poptop)
dump            # (from /etc/ppp/options.poptop)
require-mschap-v2               # (from
/etc/ppp/options.poptop)
refuse-pap              # (from=20
etc/ppp/options.poptop)
refuse-chap             # (from
/etc/ppp/options.poptop)
refuse-mschap           # (from
/etc/ppp/options.poptop)
refuse-eap              # (from
/etc/ppp/options.poptop)
115200          # (from command line)
lock            # (from /etc/ppp/options.poptop)
local           # (from command line)
ipparam 10.0.0.124         # (from command line)
10.10.0.178:10.10.1.234           # (from command
line)
using channel 6
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0x140228e> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0xc3c66f9d> <pcomp> <accomp>]
No auth is possible
sent [LCP ConfRej id=3D0x1 <auth chap MS-v2>]
rcvd [LCP ConfRej id=3D0x1 <auth chap MS-v2>]
sent [LCP ConfReq id=3D0x2 <asyncmap 0x0> <magic
0x140228e> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x2 <asyncmap 0x0> <magic
0xc3c66f9d> <pcomp> <accomp>]
sent [LCP ConfAck id=3D0x2 <asyncmap 0x0> <magic
0xc3c66f9d> <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x2 <asyncmap 0x0> <magic
0x140228e> <pcomp> <accomp>]
peer refused to authenticate: terminating link
sent [LCP TermReq id=3D0x3 "peer refused to
authenticate"]
rcvd [LCP TermReq id=3D0x3 "peer refused to
authenticate"]
sent [LCP TermAck id=3D0x3]
rcvd [LCP TermAck id=3D0x3]
Connection terminated.

Please note that if I simply change two lines on both
sides:

add noauth and comment out require-mschap-v2 I get

logs on the server side:
pppd options in effect:
debug           # (from /etc/ppp/options.poptop)
logfile /tmp/vpn.log            # (from
/etc/ppp/options.poptop)
dump            # (from /etc/ppp/options.poptop)
noauth          # (from /etc/ppp/options.poptop)
refuse-pap              # (from
/etc/ppp/options.poptop)
refuse-chap             # (from
/etc/ppp/options.poptop)
refuse-mschap           # (from
/etc/ppp/options.poptop)
refuse-eap              # (from
/etc/ppp/options.poptop)
115200          # (from command line)
lock            # (from /etc/ppp/options.poptop)
local           # (from command line)
ipparam 10.0.0.124         # (from command line)
10.0.0.178:10.0.1.234           # (from command line)
using channel 8
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic
0x33c51398> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic
0xab1a948b> <pcomp> <accomp>]
sent [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic
0xab1a948b> <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic
0x33c51398> <pcomp> <accomp>]
Couldn't set pass-filter in kernel: Invalid argument
sent [CCP ConfReq id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
sent [IPCP ConfReq id=3D0x1 <compress VJ 0f 01> <addr
10.0.1.178>]
rcvd [CCP ConfReq id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
sent [CCP ConfAck id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
rcvd [IPCP ConfReq id=3D0x1 <compress VJ 0f 01> <addr
10.0.0.124>]
sent [IPCP ConfNak id=3D0x1 <addr 10.0.1.234>]
rcvd [CCP ConfAck id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
Deflate (15) compression enabled
rcvd [IPCP ConfAck id=3D0x1 <compress VJ 0f 01> <addr
10.0.1.178>]
rcvd [IPCP ConfReq id=3D0x2 <compress VJ 0f 01> <addr
10.0.1.234>]
sent [IPCP ConfAck id=3D0x2 <compress VJ 0f 01> <addr
10.0.1.234>]
local  IP address 10.0.1.178
remote IP address 10.0.1.234
Script /etc/ppp/ip-up started (pid 4254)
Script /etc/ppp/ip-up finished (pid 4254), status 0x0

ifconfig shows ppp0 alright :
ppp0      Link encap:Point-to-Point Protocol =20
          inet addr:10.0.1.178  P-t-P:10.0.1.234=20
Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST=20
MTU:1500  Metric:1
          RX packets:5 errors:0 dropped:0 overruns:0
frame:0
          TX packets:5 errors:0 dropped:0 overruns:0
carrier:0
          collisions:0 txqueuelen:3=20
          RX bytes:78 (78.0 b)  TX bytes:72 (72.0 b)

so this seems to work

any ideas ?

Thank you,=20

Adrian


=09

=09
	=09
Vous manquez d=92espace pour stocker vos mails ?=20
Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouveaut=
=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charger gratu=
itement sur http://fr.messenger.yahoo.com
