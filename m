From: a b <theorieduchaos@yahoo.fr>
Date: Thu, 28 Oct 2004 13:45:25 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <20041028134525.68215.qmail@web25209.mail.ukl.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi again,

You were right: I was missing the "user" option ... it
works now with mschap-v2, thank you ... but, next step
is to use mppe, of course:

I add the require-mppe-128 option to the server and
get:=20

pppd options in effect:
debug           # (from /etc/ppp/options.poptop)
logfile /tmp/vpn.log            # (from
/etc/ppp/options.poptop)
dump            # (from /etc/ppp/options.poptop)
require-mschap-v2               # (from
/etc/ppp/options.poptop)
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
ipparam 192.168.100.124         # (from command line)
10.0.1.178:10.0.1.235           # (from command line)
require-mppe-128                # (from
/etc/ppp/options.poptop)
using channel 15
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0x6abacb92> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic
0x11fc1593> <pcomp> <accomp>]
sent [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic
0x11fc1593> <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0x6abacb92> <pcomp> <accomp>]
sent [CHAP Challenge id=3D0xd3
<6efa5d8f23196c829082eaa9456a3865>, name "mypptpdserver.mydomain.com"]
rcvd [CHAP Response id=3D0xd3
<c809d9e158ba9bd9355aa162dd23741b000000000000000076554555ea86eb4480c7e47807=
6e857ce65b277c44f8fb2a00>,
name =3D "adrian"]
sent [CHAP Success id=3D0xd3
"S[4A15FB47B29F113A4708536D079228081E2007 M=ACcess
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

lsmod|grep ppp
ppp_deflate             7104  0=20
zlib_deflate           23832  1 ppp_deflate
zlib_inflate           23648  1 ppp_deflate
ppp_mppe               14304  0 [unsafe]
ppp_async              13280  0=20
ppp_generic            32752  4
ppp_deflate,bsd_comp,ppp_mppe,ppp_async
slhc                    8224  1 ppp_generic


I might be missing something obvious again...

Thank you,

Adrian

 --- carlsonj@workingcode.com a =E9crit :=20
> a b writes:
> > rcvd [LCP ConfRej id=3D0x1 <auth chap MS-v2>]
>=20
> Something is still misconfigured on the peer's side.
>  It's refusing to
> authenticate.
>=20
> Are you perhaps missing the "user" option on that
> side?
>=20
> --=20
> James Carlson                               =20
> <carlsonj@workingcode.com>
> =20


=09

=09
	=09
Vous manquez d=92espace pour stocker vos mails ?=20
Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouveaut=
=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charger gratu=
itement sur http://fr.messenger.yahoo.com
