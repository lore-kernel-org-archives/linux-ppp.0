From: "James R. Leu" <jleu@mindspring.com>
Date: Sun, 13 Mar 2005 18:28:59 +0000
Subject: Re: Problem makeing a ppp-ssh tunnel.
Message-Id: <20050313182859.GE11554@mindspring.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2qXFWqzzG3v1+95a"
List-Id: <linux-ppp.vger.kernel.org>
References: <42346881.mailIHA11VZX9@ronispc.chem.mcgill.ca>
In-Reply-To: <42346881.mailIHA11VZX9@ronispc.chem.mcgill.ca>
To: linux-ppp@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm not using a 2.6.11 kernel (I used FC3 + 2.6.9), but here is the
howto I used to setup PPPoSSH.  It uses the 'dialer' so the final command
line usage is much easier.  I've found that it is also a good idea to
use 'lcp-echo-interval' and 'lcp-echo-failure' as a keepalive so that
your TCP session doesn't get timeout by a firewall, and it helps detect
network failures quicker.

http://nsd.dyndns.org/pppossh/

One last note, if you set pppd to be setuid you do not need to setup
sudo access.

On Sun, Mar 13, 2005 at 11:23:36AM -0600, Bret Hughes wrote:
> On Sun, 2005-03-13 at 10:21, David Ronis wrote:
> > Hi,
> >=20
> > I'm trying to use ssh and pppd to set up a ppp tunnel between my
> > laptop at home and a machine at work.  Both machines are running a
> > 2.6.11 kernel, slackware 10.[01] and have pppd 2.4.3 installed.  I
> > more or less followed the instructions in the ppp-ssh howto, which
> > essentially runs the following command as root:
> >=20
> > /usr/sbin/pppd ktune noauth updetach passive pty=20
> > 	"${REMOTE_COMMAND}" ipparam vpn ${CLIENT_IFIPADDR}:${SERVER_IFIPADDR}
> >=20
> > where
> >=20
> > REMOTE_COMMAND=3Dssh -l ${SERVER_USERNAME} ${SERVER_HOSTNAME}  \
> > 	sudo /usr/sbin/pppd ktune noauth nodetach notty proxyarp ipparam vpn
> >=20
> > where ${SERVER_USERNAME} has sudo privilages on ${SERVER_HOSTNAME}.
> >=20
> > and where ${CLIENT_IFIPADDR} is the IP address my laptop has when it's
> > connected at work and where ${SERVER_IFIPADDR} is the IP address of
> > the server 132.206.205.86 and 132.206.205.91, respectively.
> >=20
> > ifconfig shows:
> >=20
> > ppp0      Link encap:Point-to-Point Protocol =20
> >           inet addr:132.206.205.86  P-t-P:132.206.205.91  Mask:255.255.=
255.255
> >           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
> >           RX packets:4 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:21 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:3=20
> >           RX bytes:62 (62.0 b)  TX bytes:4590 (4.4 Kb)
> >=20
> > on the client and
> >=20
> > ppp0      Link encap:Point-to-Point Protocol =20
> >           inet addr:132.206.205.91  P-t-P:132.206.205.86  Mask:255.255.=
255.255
> >           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
> >           RX packets:4 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:49 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:3=20
> >           RX bytes:62 (62.0 b)  TX bytes:4302 (4.2 Kb)
> >=20
> > on the server.
> >=20
> > pppd has created route entries:
> >=20
> > 132.206.205.86  0.0.0.0         255.255.255.255 UH        0 0          =
0 ppp0
> >=20
> > on the server=20
> >=20
> > and=20
> > 132.206.205.91  0.0.0.0         255.255.255.255 UH        0 0          =
0 ppp0
> >=20
> > on the client
> >=20
> > If I ping 132.206.205.86 from the client I get a response, but if I
> > ping the server (132.206.205.91) I get nothing.
> >=20
> > Similarly, pinging the client from the server doesn't get a reply.
> >=20
> > Finally, the connection times out.
> >=20
> >=20
> > My suspicion is that I'm close, but am making some sort of trivial
> > mistake.  Any ideas?
> >=20
>=20
> I am certainly no expert but I would next try traceroute
> ip_of_remote_end  on bothe ends and try to figure out where the packets
> are going.  The route command output is curious it may be valid but I am
> used to seeing * instead of 0.0.0.0 for the gateway ip.
>=20
> Looking at eh transmit and recieve byte counts looks like the packets
> are not getting there. I would delete the routes manually and recreate
> them if the packets are not getting there.
>=20
> Bret
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
James R. Leu
jleu@mindspring.com

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQFCNIZqQcSCk6yg8WERAuoVAJ46vus0eLkRRUijD699IytzFqWTVgCgiZI+
bx8JtFXvYQKiQkHMAF82XOU=
=XF0D
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
