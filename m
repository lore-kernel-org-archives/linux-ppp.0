From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Date: Thu, 25 Nov 2004 22:55:44 +0000
Subject: Re: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <200411252355.44780.arekm@pld-linux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <200411231157.43347.arekm@pld-linux.org>
In-Reply-To: <200411231157.43347.arekm@pld-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Thursday 25 of November 2004 22:27, Paul Mackerras wrote:
> Arkadiusz Miskiewicz writes:
> > Shouldn't pppd kill old pty "command" before running new one?
>
> pppd will close its side of the pty device, leading to the program
> running on the other side (the script specified in the pty option)
> getting an end-of-file on its standard input.  It should clean up and
> exit when it gets that.
>
> Alternatively you can use a disconnect script to kill it, if your pty
> command is too lame to exit on EOF.

Looking into pppoa code I see that read() of 0 is handled (exit(0) in such =

case). Did anything change between 2.4.2 and 2.4.3 in this area? 2.4.2 caus=
es=20
that pppoa terminates properly while 2.4.3 not.

tcflush failed: Bad file descriptor comes from ioctl on -1 descriptor, does=
n't=20
look correct
4196  ioctl(8, JFFS_PRINT_HASH or PPPIOCGFLAGS, 0xbffff3a0) =3D 0
4196  ioctl(-1, TCFLSH, 0x2)            =3D -1 EBADF (Bad file descriptor)
4196  time([1101422552])                =3D 1101422552
4196  stat64("/etc/localtime",  <unfinished ...>
4555  <... select resumed> )            =3D 0 (Timeout)
4196  <... stat64 resumed> {st_mode=3DS_IFREG|0644, st_size=961, ...}) =3D 0
4555  select(4, [0 3], NULL, NULL, {0, 250} <unfinished ...>
4196  stat64("/etc/localtime", {st_mode=3DS_IFREG|0644, st_size=961, ...}) =
=3D 0
4196  stat64("/etc/localtime", {st_mode=3DS_IFREG|0644, st_size=961, ...}) =
=3D 0
4196  rt_sigaction(SIGPIPE, {0xb7f0a140, [], 0}, {SIG_IGN}, 8) =3D 0
4196  send(3, "<28>Nov 25 23:42:32 pppd[4196]: tcflush failed: Bad file=20
descriptor\0", 68, 0) =3D 68

isn't tcflush failing a reason for a pppoa to not terminate?
> Paul.

--=20
Arkadiusz Mi=B6kiewicz                    PLD/Linux Team
http://www.t17.ds.pwr.wroc.pl/~misiek/  http://ftp.pld-linux.org/
