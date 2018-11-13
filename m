From: Morel =?UTF-8?B?QsOpcmVuZ2Vy?= <berenger.morel@sga-automation.com>
Date: Tue, 13 Nov 2018 12:08:04 +0000
Subject: Re: How to know when a link is established or destroyed?
Message-Id: <20181113130804.47b10884@PC-dev2>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/KtXIhuFPkRrr3e7+dZCgbKK"
List-Id: <linux-ppp.vger.kernel.org>
References: <20181022122818.1780e0bd@PC-dev2>
In-Reply-To: <20181022122818.1780e0bd@PC-dev2>
To: linux-ppp@vger.kernel.org

--Sig_/KtXIhuFPkRrr3e7+dZCgbKK
Content-Type: multipart/mixed; boundary="MP_/u_A/768nS=07N_5U75OQMSx"

--MP_/u_A/768nS=07N_5U75OQMSx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Sorry for the late reply, I had not a lot of time recently.

Le Mon, 22 Oct 2018 10:40:16 -0400,
James Carlson <carlsonj@workingcode.com> a =C3=A9crit :

> On 10/22/18 06:28, Morel B=C3=A9renger wrote:
> > I am using pppd to have network access through GPRS/3G/4G on
> > systems I do not have physical access to.
> >=20
> > Since I want the system to be up almost always, I am trying to
> > manage my daemons through runit (daemontools), which works by
> > keeping child process foreground and restart it when it dies for a
> > reason or another, eventually logging whatever came on stdout. =20
>=20
> Please post the pppd options you're using today.

$ grep -v -e '^#' -e '^$' /etc/ppp/options=20
asyncmap 0
auth
crtscts
lock
hide-password
modem
lcp-echo-interval 30
lcp-echo-failure 4
noipx

$ cat /etc/ppp/peers/bouygues
connect "/usr/sbin/chat -v -f /etc/chatscripts/gprs_bouygues -T
pcebouygtel.com" /dev/ttyUSB4
noipdefault
defaultroute
usepeerdns
persist
noauth
hide-password

$ cat etc/chatscripts/gprs_bouygues   =20
ABORT BUSY
ABORT VOICE
ABORT "NO CARRIER"
ABORT "NO DIALTONE"
ABORT "NO DIAL TONE"
ABORT "NO ANSWER"
ABORT "DELAYED"
ABORT "ERROR"
ABORT "+CGATT :0"

""                            AT
TIMEOUT                       12
OK                            ATH
OK                            ATE1
OK                            "AT+CPIN?"
"+CPIN: READY-AT+CPIN=3D0000-"  AT+CGDCONT=3D1,"IP","\T","",0,0
OK                            \d\d\dATD*99#
TIMEOUT                       22
CONNECT                       ""

I hope I included every useful information?

> Please post debug traces

I have attached a tarball containing pppd & chat logs on my current
configuration to this mail, on a system that had the problem, I hope it
is ok?
Lines showing the problem starts at "Nov  7 15:10:15".

> The simplest is to use the "debug" option, and get the log messages
> via syslog.  Use "logfile /path/to/some/file" if you can't use syslog
> for some reason.  (Note: don't use kdebug unless there are
> kernel-level problems.  This doesn't sound like a kernel-level
> problem.)

Are logs sent to a file exactly the same as those sent to syslog?

> The usual way to set up an always-on connection with pppd is NOT via
> some external utility, but by using the built-in restart capability in
> pppd.  You can use use the external utility if you want, but I think
> it'll be harder to manage.

I would prefer to avoid external tools, however I am using runit
(like daemontools) to manage my daemons.
I would like to integrate pppd, because I believe (but may be wrong)
that it would simplify things for me to have only 1 system ensuring
every services are doing their job.

> To use the built-in restart, set "persist maxfail 0" as options.
>=20
> If you insist on using an external utility to do this, you will
> probably want something like "maxfail 1" or "maxfail 2" instead.

Thanks, I'll try that.

> Note that most GPRS implementations, at least the ones I've seen, are
> horror shows, and that stems, at least in part, from execrable
> "standards" set for their use of Internet protocols.  Your mileage
> may vary.

I guess it's "good" to know.

> If your "failures" involve losing IP routing while the PPP link is up,
> then that may just be par for the course.  You'll need some other
> monitoring system to tell you when or if that happens.  There's
> nothing that PPP can possibly do to help with that; it's only a link
> layer protocol.

Of course, but from what I can see from logs, the problem seems to come
from the point-to-point link.

> > So, I think either I missed the options needed to do what I need, or
> > there is a tool to manage pppd that I don't know, or it is not
> > implemented at all.
> >=20
> > If if is not implemented at all, is it intended? Would it be fine
> > if I submit a patch doing this? =20
>=20
> Submitting patches is fine, but if you do so, please indicate
> precisely what the patch does and (if possible) why the existing
> features don't fulfill your needs.  It's often very hard to review
> changes out of the blue that don't appear to solve problems.

Indeed, and this is why I asked before wasting everyone's time.

Thanks for all the valuable informations.


--=20
SGA Automation
27 Rue Jean-Philippe Rameau
P=C3=B4le Delta
76000 Rouen
Tel : 02 32 10 38 53
Fax : 02 32 10 11 30
www.sga-automation.com
Email : berenger.morel@sga-automation.com

--MP_/u_A/768nS=07N_5U75OQMSx
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=pppd.log.tar.gz

H4sIALqp6lsAA+2db09bRxbGed1PMc2+Sbfg3r82tvaPXEAJSgIIyK6q7lYy9g2xBDayTdR8+45N
sovvnDPnOWPM3mhnWokq4fcwfTzh3t8JF+7u7katm+n1zhZXYle7KJZv006ZPH5r/ytt50m6k+Z5
Jyuzot3Od5I06yTljkm2uamv636+GMyM2bmqZtXkuppx7yf9/je6TqafjOmYNO2VaS/NTGf5mnT3
Pk0+7KX7STfdN3t75l3//I19+93aO5dt4p3v7HH61b6k6b975u3BmVlUs9vxZLCoRubqs7mrqpky
5GA6mVTDhVmMbyuTFnm3VRibeL+o5i1l1EU1WZhOnnWLtt2MDdg1s2pYjT/ZzbXLJC+zh1/W5r4e
TK7v78zLi+NXr9+f/aCk301H1a35uMoI62Y8nTzqeW33WS/bJ0KGHweLXztZmtuQwdV0tjA24uXP
7y9++SGY/sfp8cFROH5yag765+fHR+cbZRwe999enp5stpFliNk4pX9y8c9N/m8Oj972fzk6DA84
Oj8/3eDj/3jwqn95aXqJNmJeTUbmZf/yt3dacvmHfHq/sAn2D/zU2E9H82o4nYzmypzq97vl54yX
p2+0O1ju+rd3Suj0jRJYfk69ni7MeGECu32tLze8FHUhq/19CzUepQ3vcbnBb6HIHw/Ojk/+Hl7m
iu+Z86P+ofoaFFDr1+2q0cf7/B+U/Orw4PTk8q/p7ovjsxe7L+6G1dX0/vP1orppDae39lde7Ca7
ifsydIPPtEQ6DT454JxmCeCLlsiHov81Wv7Tvzz8c7f7J6fLnLpH9lzEMuYiJuZ8fU3sK35ydHCp
3Ua9ZxHQnC91+OmbgP18eQHU5JfGlBR7bETy4dhgJ2VdSGbjwY0Z/vc2vrIyenUznn907uPFsPfz
8eTajCfWBD4MhtXy9xJlxBef6K1Y85e9vb+Zn0bVp58Wi8/vL34uamm5kHZe3U4Xlbmt5vPBddUz
r2ZVtbB7nH//vTLprH9mBveLj9bfxsPBqqj5/XBYVaNqpIw6mN7fjMzEvsyj6sGZKiuBq40e2w8y
Gs3sdnv2Nz8M7m+Wu13dhyatdvHwr/LD3UyH9gV+FL3MSjtFq8xaaburTHM2usHO7mbj28HsszHm
8OTiP3ntrJUlaSvNuq2udncPn+WWmVRiuZaY9VJ82mA/tuadFXOMXLONXLONXLONQrONQrONQrON
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

--MP_/u_A/768nS=07N_5U75OQMSx--

--Sig_/KtXIhuFPkRrr3e7+dZCgbKK
Content-Type: application/pgp-signature
Content-Description: Signature digitale OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE6EOLY3cbbbyLd7blx7EBpfPu3/IFAlvqvqQACgkQx7EBpfPu
3/L+1AgAvdTEJZdSoiJ+YS213wCkYlocJmzVxBjwWXj5/51wCJDFZ2F63QZG9GOO
9LfMy072Y4TN2WEY+PvudmR/ezcdqghTvas0nAku/fawgLIkLqmSglz49wiNtClA
3r1UiV5f7V+9aH/MWM7uSRZTIhqS/4j4/fNz/u9R0u/0ZWAD7TNeRMoQSI9pPl/d
XZhkgC791HfTvk+t8qAwwJVTFUZH5kzwhrJxEvCmzrZP9I1nhA1++qsHEbMP4ven
wOPWM/0LrnYztsX+JH1kWNt8+E5I2tovWpcmzEAskg6iEL7paw3Wop3pUNJZDDsD
mKU7Y1VJEckz0WeQVFLplnkdbPoLBg==
=1TiA
-----END PGP SIGNATURE-----

--Sig_/KtXIhuFPkRrr3e7+dZCgbKK--
