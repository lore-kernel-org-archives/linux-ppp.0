From: a b <theorieduchaos@yahoo.fr>
Date: Thu, 28 Oct 2004 13:10:05 +0000
Subject: ppp 2.4.3 cvs authentication issue
Message-Id: <20041028131005.10117.qmail@web25203.mail.ukl.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi again,

I'm tring to configure both sides: server AND client.

Ok, I have followed your suggestions and here is the
result:

client:=20

logfile /tmp/vpn.log
dump
debug
lock
pty "/usr/sbin/pptp 10.0.0.178 --nolaunchpppd"
nodetach

server:

logfile /tmp/vpn.log
dump
debug
auth
refuse-pap
refuse-eap
refuse-chap
refuse-mschap
require-mschap-v2
lock


server logs:=20
tail -f /tmp/vpn.log -n 100

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
ipparam 10.0.0.124         # (from command line)
10.0.1.178:10.0.1.234           # (from command line)
using channel 10
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <auth chap
MS-v2> <magic 0xa5e8afe7> <pcomp> <accomp>]
rcvd [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic
0x45ac117b> <pcomp> <accomp>]
sent [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic
0x45ac117b> <pcomp> <accomp>]
rcvd [LCP ConfRej id=3D0x1 <auth chap MS-v2>]
sent [LCP ConfReq id=3D0x2 <asyncmap 0x0> <magic
0xa5e8afe7> <pcomp> <accomp>]
rcvd [LCP ConfAck id=3D0x2 <asyncmap 0x0> <magic
0xa5e8afe7> <pcomp> <accomp>]
peer refused to authenticate: terminating link
sent [LCP TermReq id=3D0x3 "peer refused to
authenticate"]
rcvd [CCP ConfReq id=3D0x1 <deflate 15> <deflate(old#)
15> <bsd v1 15>]
Discarded non-LCP packet when LCP not open
rcvd [IPCP ConfReq id=3D0x1 <compress VJ 0f 01> <addr
10.0.0.124>]
Discarded non-LCP packet when LCP not open
rcvd [LCP TermAck id=3D0x3]
Connection terminated.

Still not working ...=20

Thank you,

Adrian

 --- carlsonj@workingcode.com a =E9crit :=20
> a b writes:
> > I'm trying to set up a pptpd server under Mandrake
> > 10.0 and I think my problem is related to pppd and
> the
> > authentication.
>=20
> You're the server side?  Then why is your peer
> demanding that you
> authenticate yourself?
>=20
> > client:
> >=20
> > cat /etc/ppp/peers/pptp0=20
> [...]
> > refuse-pap
> > refuse-eap
> > refuse-chap
> > refuse-mschap
> > require-mschap-v2
>=20
> There's the misconfiguration.  The client should not
> have the above
> five options.  Instead, it should just have
> "noauth."  (As long as the
> client doesn't have a default route, it won't even
> need "noauth.")
>=20
> > Please note that if I simply change two lines on
> both
> > sides:
> >=20
> > add noauth and comment out require-mschap-v2 I get
>=20
> Don't change both sides.  The server looks fine.=20
> It's the client
> that's misconfigured.
>=20
> You have it set up so that both sides demand
> authentication and both
> sides *refuse* that demand.  What else could
> possibly be the result?
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
