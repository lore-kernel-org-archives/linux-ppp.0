From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 13:30:35 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404130927490.8613@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


On Tue, 13 Apr 2004, Robert P. J. Day wrote:

> ... snip ...
> wfr: waiting for ``RING''
> 04/13 08:51:13 yS3   got: [0a][0d][0a]RING[0d]
> 04/13 08:51:13 yS3   wfr: rc=3D0, drn=3D0
> 04/13 08:51:13 yS3  send: ATA[0d]
> 04/13 08:51:13 yS3  waiting for ``CONNECT''
> 04/13 08:51:13 yS3   got: ATA[0d][0d][0a]CONNECT ** found **
> 04/13 08:51:27 yS3  send:
> 04/13 08:51:27 yS3  waiting for ``_''
> 04/13 08:51:27 yS3   got:  38400[0d][0a] ** found **
> 04/13 08:51:27 yS3   waiting for line to clear (VTIME), read:
> 04/13 08:51:27 yS3   utmp + wtmp entry made
> 04/13 08:51:28 yS3   tio_set_flow_control( HARD )
> 04/13 08:51:28 yS3   print welcome banner (/etc/issue)
> 04/13 08:51:28 yS3   getlogname (AUTO_PPP), read:
>=20
>   and that's where it hung.

i just had the chance to go back to the working scenario (using my=20
laptop as both the client and server), and the mgetty log file showed the=20
following:

04/13 09:27:21 yS3   tio_set_flow_control( HARD )
04/13 09:27:21 yS3   print welcome banner (/etc/issue)
04/13 09:27:21 yS3   getlogname (AUTO_PPP), read:~}[df]}#[c0]!  <-- here
04/13 09:27:22 yS3   input finished with '\r', setting ICRNL ONLCR
04/13 09:27:22 yS3   tio_get_rs232_lines: status: RTS CTS DSR DTR DCD
04/13 09:27:22 yS3   match: user=3D'/AutoPPP/', key=3D''
04/13 09:27:22 yS3   match: user=3D'/AutoPPP/', key=3D''
04/13 09:27:22 yS3   match: user=3D'/AutoPPP/', key=3D'/AutoPPP/'*** hit!
04/13 09:27:22 yS3   login: utmp entry: a_ppp
04/13 09:27:22 yS3   utmp + wtmp entry made
04/13 09:27:22 yS3   calling login: cmd=3D'/usr/sbin/pppd', argv[]=3D'pppd =

-chap -pap debug'
04/13 09:27:22 yS3   setenv: 'CALLER_ID=3Dnone'
04/13 09:27:22 yS3   setenv: 'CONNECT8400'
04/13 09:27:22 yS3   setenv: 'DEVICE=3DttyS3'
04/13 09:27:22 ##### data dev=3DttyS3, pid=8351, caller=3D'none',=20
conn=3D'38400', name=3D'', cmd=3D'/usr/sbin/pppd', user=3D'/AutoPPP/'


so you can how it got past the "getlogname" entry.  thoughts?

rday
