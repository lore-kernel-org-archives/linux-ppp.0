From: a b <theorieduchaos@yahoo.fr>
Date: Thu, 28 Oct 2004 14:52:24 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <20041028145224.37269.qmail@web25203.mail.ukl.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

ok,=20
so the server configuration file is now:

logfile /tmp/vpn.log
dump
debug
require-mschap-v2
require-mppe-128
lock

... and the result is the same:

pppd options in effect:
debug           # (from /etc/ppp/options.poptop)
logfile /tmp/vpn.log            # (from
/etc/ppp/options.poptop)
dump            # (from /etc/ppp/options.poptop)
require-mschap-v2               # (from
/etc/ppp/options.poptop)
115200          # (from command line)
lock            # (from /etc/ppp/options.poptop)
local           # (from command line)
ipparam 10.0.0.124         # (from command line)
10.0.1.178:10.0.1.234           # (from command line)
require-mppe-128                # (from
/etc/ppp/options.poptop)
using channel 23
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0xab84c21a> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic
0x4ed872d8> <pcomp> <accomp>]
sent [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic
0x4ed872d8> <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0xab84c21a> <pcomp> <accomp>]
sent [CHAP Challenge id=3D0x12
<f87334236c1450368b23170d62aff528>, name "mypptpdserver.mydomain.com"]
rcvd [CHAP Response id=3D0x12
<7f192ecdc2190ee53ad4939320e4126a000000000000000037dc9c8bb222abbe71b08de33d=
70112a174b2ea28be0963500>,
name =3D "adrian"]
sent [CHAP Success id=3D0x12
"S=BC6BDC7B66AC82992857B7F6E9F383E5C517F345 M=ACcess
granted"]
Couldn't set pass-filter in kernel: Invalid argument
sent [CCP ConfReq id=3D0x1 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfReq id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
MPPE required but peer negotiation failed
sent [LCP TermReq id=3D0x2 "MPPE required but peer
negotiation failed"]
sent [CCP ConfRej id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
rcvd [IPCP ConfReq id=3D0x1 <compress VJ 0f 01> <addr
10.0.0.124>]
Discarded non-LCP packet when LCP not open
rcvd [CCP ConfRej id=3D0x1 <mppe +H -M +S -L -D -C>]
Discarded non-LCP packet when LCP not open
rcvd [LCP TermAck id=3D0x2]
Connection terminated.
Connect time 0.0 minutes.
Sent 10 bytes, received 31 bytes.


1. the module kernel seems to be a 2.4.2 alright

modinfo ppp_mppe|grep license
license:        BSD without advertisement clause

My question is: could this be a mppe kernel module
issue, like not the latest version, etc ?

2. you're saying that "the peer apparently isn't
configured to use MPPE."

My question is: is there something to do on the client
side in order to ask for a mppe authentication ?

Sincerely,

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
