From: Carlos Renato Tasinafo <renato@internetzone.com.br>
Date: Wed, 06 Oct 2004 22:17:14 +0000
Subject: Re: PPP getting timeout on IPCP config requests on new FC3t2 box
Message-Id: <41646EEA.1040506@internetzone.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080804040100040505080007"
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410061642580.14152@dell.enoriver.com>
In-Reply-To: <Pine.LNX.4.60.0410061642580.14152@dell.enoriver.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------080804040100040505080007
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hello Robert,
I have Debian 3.1 (testing) kernel 2.4.27 with ppp 2.4.2 and mgetty 1.1.31-1

I dont saw your file /etc/ppp/options.ttyS0
in this file, you put a ip address of local and remote point-to-point=20
conection

my files of configuration is here

Regards

Renato


Robert P. J. Day wrote:
>=20
>   for quite some time, we've been able to connect to a fedora code 2 box =

> running an mgetty on /dev/ttyS0.  just today, i set up a fedora core 3=20
> test 2 (FC3t2) box, and reproduced, as closely as possible, the dial-in=20
> PPP environment.
>=20
>   that is, i edited
>=20
>     /etc/inittab
>     /etc/mgetty+sendfax/
>         login.config
>         mgetty.config
>=20
> and made the same changes to the new FC3t2 box that were on the older=20
> FC2t3 box.  (the older box has ppp-2.4.1, and the newer has ppp.2.4.2).
>=20
>   now, trying to connect to the new box gives me, in the=20
> /var/log/messages file:
>=20
> Oct  6 16:40:55 localhost pppd[2609]: pppd 2.4.2 started by a_ppp, uid 0
> Oct  6 16:40:55 localhost kernel: PPP generic driver version 2.4.2
> Oct  6 16:40:55 localhost pppd[2609]: Using interface ppp0
> Oct  6 16:40:55 localhost pppd[2609]: Connect: ppp0 <--> /dev/ttyS0
> Oct  6 16:40:56 localhost udev[2821]: creating device node '/dev/ppp'
> Oct  6 16:40:58 localhost kernel: PPP Deflate Compression module register=
ed
> Oct  6 16:40:58 localhost pppd[2609]: Deflate (15) compression enabled
> Oct  6 16:41:05 localhost sshd(pam_unix)[2860]: session opened for user=20
> root by root(uid=3D0)
> Oct  6 16:41:32 localhost pppd[2609]: IPCP: timeout sending Config-Reques=
ts
> Oct  6 16:41:32 localhost pppd[2609]: Connection terminated.
> Oct  6 16:41:32 localhost pppd[2609]: Exit.
>=20
>=20
>    i'm not sure if there's something i've missed in the configuration. i =

> didn't install *everything* on the newer box, due to cramped disk=20
> space.  so is there a software RPM i might have forgotten?  some file i=20
> overlooked?
>=20
>   thoughts on what to check?  thanks.
>=20
> rday
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
+-------+
|   _   |
|  =B0v=B0  |    Carlos Renato Tasinafo
| /(_)\ |    renato@internetzone.com.br
|  ^ ^  |
+-------+

        /*

       * A vida seria mais f=E1cil, se tiv=E9ssemos o c=F3digo fonte.

       */

--------------080804040100040505080007
Content-Type: text/plain;
 name="login.config"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="login.config"

# login.config
#
# This is a sample "login dispatcher" configuration file for mgetty
#
# Format:
#	username userid utmp_entry login_program [arguments]
#
# Meaning:
#       for a "username" entered at mgettys login: prompt, call
#	"login_program" with [arguments], with the uid set to "userid",
#	and a USER_PROCESS utmp entry with ut_user = "utmp_entry"
#
# username may be prefixed / suffixed by "*" (wildcard)
#
# userid is a valid user name from /etc/passwd, or "-" to not set
#  a login user id and keep the uid/euid root (needed for /bin/login)
#
# utmp_entry is what will appear in the "who" listing. Use "-" to not
#  set an utmp entry (a must for /bin/login), use "@" to set it to the
#  username entered. Maximum length is 8 characters.
#
# login_program is the program that will be exec()ed, with the arguments
#  passed in [arguments]. A "@" in the arguments will be replaced with the
#  username entered. Warning: if no "@" is given, the login_program has
#  no way to know what user name the user entered.
#
#
# SAMPLES:
# Use this one with my Taylor-UUCP and Taylor-UUCP passwd files. 
#  (Big advantage: tuucp can use the same passwd file for serial dial-in 
#   and tcp dial-in [uucico running as in.uucpd]). Works from 1.05 up.
#
#U*	uucp	@	/usr/sbin/uucico -l -u @

#
# Use this one for fido calls (login name /FIDO/ is handled specially)
#
# You need Eugene Crosser's "ifmail" package for this to work.
#  mgetty has to be compiled with "-DFIDO", otherwise a fido call won't
#  be detected.
#
#/FIDO/	uucp	fido	/usr/lib/fnet/ifcico @

#
# Automatic PPP startup on receipt of LCP configure request (AutoPPP).
#  mgetty has to be compiled with "-DAUTO_PPP" for this to work.
#  Warning: Case is significant, AUTOPPP or autoppp won't work!
#  Consult the "pppd" man page to find pppd options that work for you.
#
#  NOTE: for *some* users, the "-detach" option has been necessary, for 
#        others, not at all. If your pppd doesn't die after hangup, try it.
#
#  NOTE2: "debug" creates lots of debugging info.  LOOK AT IT if things
#         do not work out of the box, most likely it's a ppp problem!
#
#  NOTE3: "man pppd" is your friend!
#
#  NOTE4: max. 9 arguments allowed.
#
#/AutoPPP/ -	a_ppp	/usr/sbin/pppd auth -chap +pap login debug
#/AutoPPP/ -	a_ppp 	/usr/sbin/pppd auth -chap +pap login debug
#
/AutoPPP/ - a_ppp /usr/bin/strace -o /root/strace.log /usr/sbin/pppd auth -chap +pap login debug
#
# An example where no login name in the argument list is desired:
#  automatically telnetting to machine "smarty" for a given login name
#
#telnet-smarty	gast	telnet	/usr/bin/telnet -8 smarty
#
# This is the "standard" behaviour - *dont* set a userid or utmp
#  entry here, otherwise /bin/login will fail!
#  This entry isn't really necessary: if it's missing, the built-in
#  default will do exactly this.
#
*	-	-	/bin/login @

--------------080804040100040505080007
Content-Type: text/plain;
 name="options.ttyS0.temp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="options.ttyS0.temp"

192.168.0.133:192.168.0.17

--------------080804040100040505080007--

