From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Date: Thu, 25 Nov 2004 16:09:03 +0000
Subject: Re: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <200411251709.03660.arekm@pld-linux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <200411231157.43347.arekm@pld-linux.org>
In-Reply-To: <200411231157.43347.arekm@pld-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Thursday 25 of November 2004 16:44, Arkadiusz Miskiewicz wrote:

> Well, after such disconnect new pppd runs pppoa -I eth1 multiple times
> without killing old one and this causes huge load (it's hard to do anythi=
ng
> on the system then). Old, not killed pppoa processes reports multiple
> Nov 25 16:18:15 arm pppoa[6387]: Packet not from driver (mac:=20
> 0:60:4c:41:53:74) Nov 25 16:18:15 arm pppoa[6387]: Packet not from driver
> (mac:  0:60:4c:41:53:74) Nov 25 16:18:15 arm pppoa[6328]: Packet not from
> driver (mac:  0:60:4c:41:53:74) Nov 25 16:18:15 arm pppoa[6328]: Packet n=
ot
> from driver (mac:  0:60:4c:41:53:74)
>
> Shouldn't pppd kill old pty "command" before running new one?

It looks like this:
[root@arm misiek]# pstree -lpu | grep ppp
        |-pppd(17285)-+-sh(17286)---pppoa(17287)
        |             |-sh(17479)---pppoa(17484)
        |             `-sh(17539)---pppoa(17540)
        |-sh(8386)---pppoa(8390)

new pppoa is created at each retry

--=20
Arkadiusz Mi=B6kiewicz                    PLD/Linux Team
http://www.t17.ds.pwr.wroc.pl/~misiek/  http://ftp.pld-linux.org/
