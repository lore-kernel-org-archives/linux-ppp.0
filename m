From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 28 Sep 2004 17:39:24 +0000
Subject: Re: Problem with interface ppp0
Message-Id: <Pine.LNX.4.58.0409281034240.10701@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
In-Reply-To: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

If kppp works it is fine. If it does not it is a complete piece of junk,
and gives no or completely confusing error messages.=20

Make sure that you have the word
debug
in /etc/ppp/options, and have the line
local2.*;daemon.*      /var/log/ppplog
in /etc/syslog.conf
( and run=20
killall -1 syslogd=20
just to make sure)
Then look in the file /var/log/ppplog after a connection attempt.=20

It may well  be that your new kernel has not made /dev/ppp (does it
exist just after one of your attempts?


Note also the line
"Error opening resolv.conf"
Have you checked that /etc/resolv.conf is readable by all?
That it even exists?


On Tue, 28 Sep 2004, Tomas Vadfors wrote:

> Hello!
>=20
> I've got a slight problem. I have always before been able to connect to t=
he=20
> internet using my 56K V90 modem. Setup in the program kppp has been=20
> straightforward, but since I upgraded my Debian system to unstable (Sid) =
and=20
> built a new kernel (2.6.3) I have had a problem.
>=20
> The modem dials, and seems to connect, but I can't go to any webpages. I =

> don't think it's a DNS-related problem, I think it has something to do wi=
th=20
> the "interface" ppp0. Please observe that the connection is not abrupted =

> immediately, I've specified "noauth" somewhere rootish. This is the outpu=
t=20
> from kppp in the xterm from which it was run:
>=20
> Opener: received SetSecret
> Opener: received SetSecret
> Opener: received OpenLock
>=20
> Opener: received OpenDevice
> Opener: received ExecPPPDaemon
> Kernel supports ppp alright.
> pppd: using the noauth option requires root privilege
> received unexpected SIGCHLD.
> In parent: pppd pid 1114
> Couldn't find interface ppp0: No such device
> Couldn't find interface ppp0: No such device
> Couldn't find interface ppp0: No such device
> Couldn't find interface ppp0: No such device
>      ....
>     (this actually repeats over and over until I press Cancel in the kppp=
=20
> window)
>=20
> Opener: received RemoveSecret
> Opener: received RemoveSecret
> Opener: received OpenResolv
> Opener: received OpenResolv
> error opening resolv.conf!
> Opener: received KillPPPDaemon
> In killpppd(): Sending SIGTERM to 1114
> Opener: received RemoveLock
>=20
> Thanks for any help!
>=20
> /Tomas
>=20
> _________________________________________________________________
> L=E4ttare att hitta dr=F6mresan med MSN Resor http://www.msn.se/resor/
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
