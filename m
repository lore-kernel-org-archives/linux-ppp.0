From: a b <theorieduchaos@yahoo.fr>
Date: Thu, 28 Oct 2004 15:33:03 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <20041028153303.47712.qmail@web25203.mail.ukl.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

You were right again,=20

I had, indeed, to add the require-mppe option on the
pptp-linux client side ... and it works.

You can see it for yourself:

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
ipparam 192.168.100.124         # (from command line)
10.0.1.178:10.0.1.235           # (from command line)
require-mppe-128                # (from
/etc/ppp/options.poptop)
using channel 26
Using interface ppp0
Connect: ppp0 <--> /dev/pts/2
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0x88812f30> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic
0xc2fe6ced> <pcomp>=20
<accomp>]
sent [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic
0xc2fe6ced> <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0x88812f30> <pcomp> <accomp>]
sent [CHAP Challenge id=3D0x98
<d87688dfdee2038f9e012988b3c3b88a>, name "mypptpdserver.mydomain.com"]
rcvd [CHAP Response id=3D0x98
<d3c4a65bd5ab8ea560fa35f593d6c1650000000000000000abfc36849407b02bdf268090e0=
ecae2598baf7ab05fcca1e00>,
name =3D "adrian"]
sent [CHAP Success id=3D0x98
"S=1B317957BFF3AA169F7A84732A4A66D7DB08D792 M=ACcess
granted"]
Couldn't set pass-filter in kernel: Invalid argument
sent [CCP ConfReq id=3D0x1 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfReq id=3D0x1 <mppe +H -M +S +L -D -C>]
sent [CCP ConfNak id=3D0x1 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfAck id=3D0x1 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfReq id=3D0x2 <mppe +H -M +S -L -D -C>]
sent [CCP ConfAck id=3D0x2 <mppe +H -M +S -L -D -C>]
MPPE 128-bit stateless compression enabled
sent [IPCP ConfReq id=3D0x1 <compress VJ 0f 01> <addr
10.0.1.178>]
rcvd [IPCP ConfReq id=3D0x1 <compress VJ 0f 01> <addr
10.0.0.124>]
sent [IPCP ConfNak id=3D0x1 <addr 10.0.1.235>]
rcvd [IPCP ConfAck id=3D0x1 <compress VJ 0f 01> <addr
10.0.0.178>]
rcvd [IPCP ConfReq id=3D0x2 <compress VJ 0f 01> <addr
10.0.1.235>]
sent [IPCP ConfAck id=3D0x2 <compress VJ 0f 01> <addr
10.0.1.235>]
local  IP address 10.0.1.178
remote IP address 10.0.1.235
Script /etc/ppp/ip-up started (pid 8934)
Script /etc/ppp/ip-up finished (pid 8934), status 0x0

I still have questions, of course:

Next step will be to use pam because I saw that there
is a ppp pam module coming with the ppp package.

According to the man page I simply need to use the
"login" option and it will automatically look for the
local system auth ?

Then, I will probably have a look at the radius
plugin.

Any tricky option that I should be aware of ? :o)

Thanks alot,

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
