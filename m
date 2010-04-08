From: Sonia <xonia10@yahoo.es>
Date: Thu, 08 Apr 2010 07:55:43 +0000
Subject: Re: pppd fails when init connection with kernel 2-6-28.10
Message-Id: <882110.69712.qm@web23105.mail.ird.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <28152335.post@talk.nabble.com>
In-Reply-To: <28152335.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Adding traces to pppd all I can see is a warning in pppd/main.c

pppdb =3D tdb_open(_PATH_PPPDB, 0, 0, O_RDWR|O_CREAT, 0644);
Warning: couldn't open ppp database /var/run/ppp/pppd2.tdb

Although the file exists in the file system:

# ls -l /var/run/ppp/
-rw-r--r--    1         0 pppd2.tdb

And the error getting the channel with ioctl in pppd/sys_linux.c in functio=
n generic_establish_ppp:

if (ioctl(fd, PPPIOCGCHAN, &chindex) =3D -1) {
	    error("Couldn't get channel %d from %d",chindex,fd );
	    goto err;
	}

But I don't know if this error is causing the signal or only an effect of t=
he signal,

Thank you in advance,

Sonia



--- El mar, 6/4/10, Charlie Brady <charlieb-linux-ppp@budge.apana.org.au> e=
scribi=F3:

> De: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
> Asunto: Re: pppd fails when init connection with kernel 2-6-28.10
> Para: "Sonia Martinez" <xonia10@yahoo.es>
> CC: linux-ppp@vger.kernel.org
> Fecha: martes, 6 de abril, 2010 18:47
>=20
> On Tue, 6 Apr 2010, Sonia Martinez wrote:
>=20
> > I was using linux kernel 2.6.22 with pppd 2.4.4 in an
> embedded hardware
> > (powerpc architecture) with a GPRS serial module. I
> was able to make a GPRS
> > connection, but now I've upgraded kernel version to
> 2-6-28.10 and pppd to
> > 2.4.5 and it doesn't work. These are the log messages
> after sending the
> > ATD*99***1# command, when pppd is started:
> >
> > 2000/03/21,18:51:26=A0 daemon.warn pppd[772]:
> Warning: couldn't open ppp
> > database /var/run/ppp/pppd2.tdb
> > 2000/03/21,18:51:26 daemon.notice pppd[772]: pppd
> 2.4.5 started by root, uid
> > 0
> > 2000/03/21,18:51:26 daemon.err pppd[773]: Fatal signal
> 11
> > 2000/03/21,18:51:26 daemon.info pppd[773]: Exit.
> ...
> >
> > Has somebody the same problem with this kernel? I've
> tested the 2.4.4 and
> > has the same problem, so I guess is the kernel
> version.
>=20
> http://en.wikipedia.org/wiki/Signal_11
>=20
> The problem is not the kernel - you either have faulty
> hardware, or a bug=20
> in pppd, or in one of the libraries it uses (or in the
> compiler you are=20
> using).
>=20


     =20
