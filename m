From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Fri, 16 Jan 2004 08:48:47 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040116084847.GJ1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Fri, Jan 16, 2004 at 05:28:25PM +1100, Paul Mackerras wrote:
> I have just released ppp-2.4.2, available at either:
>=20
> ftp://ftp.samba.org/pub/ppp/ppp-2.4.2.tar.gz
>=20
> or
>=20
> http://ftp.samba.org/ftp/ppp/ppp-2.4.2.tar.gz
>=20
> It's been a long time since the last release.  Hopefully the next
> release won't take as long.  This release fixes a lot of bugs and adds
> several new features.
>=20

There's still the MTU bug (with MPPE) left..

pppd/ccp.c near line 1192:

/*
 * We need to decrease the interface MTU by MPPE_PAD
 * because MPPE frames **grow**.  The kernel [must]
 * allocate MPPE_PAD extra bytes in xmit buffers.
 */
mtu =3D netif_get_mtu(f->unit);
if (mtu)
    netif_set_mtu(f->unit, mtu - MPPE_PAD);
else
    newret =3D CONFREJ;


MPPE_PAD is defined as 4.

Now, what happens when you are using MPPE, is, that the server sets the MTU
to x-4 and the client to x.

Is this a problem? yes. see http://nrg.joroinen.fi/yle.log
The log shows what happens when the client tries to open http connection to
www.yle.fi web server. In the example (log) MTU is defined as 1400 in the p=
pp
server config, but because of the code above, the ppp server sets the mtu to
1396 and the ppp client to 1400.

During PMTUD (Path MTU Discovery), the ppp server rejects all the packets
that the web server is trying to send to the ppp client.. causing that the
ppp client won't get the web page loaded at all (the web browser just waits
and nothing happens). The web server is sending packets which are 1400 byte=
s=20
in size, but because of the 1396 MTU of the ppp server, they are dropped.

This does not happen with all web sites.. anyway, this should be fixed since
it's really annoying. When I remove the "- MPPE_PAD" code, everything seems
to be fine.

Also if I change the MTU of the ppp interface (in the server) during
ppp session (with ifconfig/ip), connections start to work well.

Thanks.

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
