From: James Cameron <james.cameron@hp.com>
Date: Tue, 22 Nov 2005 23:39:30 +0000
Subject: Re: pppd and NetworkManager - 3 issues
Message-Id: <20051122233930.GB4041@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
List-Id: <linux-ppp.vger.kernel.org>
References: <438341FB.70709@ncl.ac.uk>
In-Reply-To: <438341FB.70709@ncl.ac.uk>
To: linux-ppp@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2005 at 04:06:19PM +0000, Antony J Mee wrote:
> There are two methods for establishing a connection (currently I'm using=
=20
> the first of the following:
>=20
>  pptp <hostname> [<pptp options>] [[--] <pppd options>]
> or using pppd's pty option:
>  pppd pty "pptp <hostname> --nolaunchpppd <pptp options>"

The second is more flexible and better supported, as it allows pppd to
control pptp.  As the pptp maintainer, I've deprecated the first method.
It only existed because pppd didn't have pty option long ago.

> Two issues involve getting information about the connection back to=20
> NetworkManager.
> The information I require is:
>    a) The IP of the VPN server
>    b) The local IP of the PPP tunnel
>    c) USEPEERDNS information

I'll look at each of these in turn.

a) The IP of the VPN server

Nobody really seems to need this, and so there is no interface that
cleanly provides it.  An interface doesn't seem necessary, since it's
really an input argument, despite your point about multiple IPs returned
for a DNS query.

However, it can be obtained using netstat; look for a connection to
destination port 1723 for a process id that matches the pptp or child of
pptp.

Another method is to do the DNS resolution before you call pppd or pptp,
that way you'll have the IP address already.

b) The local IP of the PPP tunnel

This is provided to you by the ip-up scripts activated by pppd.  You are
expected to integrate with these scripts, and communicate back to your
application.  Distributions vary in their implementation of ip-up
addons.

Another method is to build a pppd plugin that is called when the IP
address is assigned.

Another method is to parse the available network devices looking for the
one created by the tunnel, and then use ifconfig or reads from /proc to
determine the IP address.

c) USEPEERDNS information

pppd places this in a resolv.conf file, and you are expected to pick it
up and use it as appropriate.  It would normally be handled by an ip-up
script.

You could also use a pppd plugin.

> While the use of environment variables is not uncommon I cannot find a
> way to ask pppd/pptp to run my own script/binary (the NM helper) to
> process this information.

Use pppd plugins.  They aren't difficult to setup.  I've written one
myself for user accounting on pptpd.  (logwtmp).

> Doctoring /etc/ip-up is not a very good solution since /etc/ip-up is
> often heavily distro dependent already.  Other tunnel clients eg.
> OpenVPN and vpnc (Cisco VPN) also use environment variables BUT
> provide a --script option to allow the execution of arbitrary scripts.
> Is such behaviour possible?

Patch your pppd, yes, it's possible.  Is there a reason why you want to
use the distribution's pppd?

> Issue 2. Worse still it appears that item a) is simply unavailable.

As the maintainer for pptp, I'll take a patch to make this available.
I look forward to your contribution.

My preference is for pptp to provide a plugin that accepts the IP
address of the connected server to pppd, so that pppd can pass it to
ip-up scripts.

> Finally issue 3.
> I wish to have NetworkManager provide the authentication information for=
=20
> MS-CHAP.  There appears to be no way to do so other than via the=20
> chap-secrets file. Or can I get pptp/ppp to ask for them on the standard=
=20
> input perhaps?

pppd plugins implement this fine.  There's the password prompting
plugin.  Provide a plugin that contacts your application to cause a
prompt and then process the response.

Or you could look at the "read a file" behaviour documented in "man
pppd" for the chap-secrets file.

The only negative thing I'll point out about pppd plugins is that they
appear to have strict version dependencies.  So it might be wise for you
to ship your own pppd version.  At 265kB, that shouldn't be too much of
a problem.

--=20
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDg6wyIiWKUhK+Mj4RAnL8AJoDcBh5/RCmSrAMFaCmAU2KoDXnvQCff3EJ
2MVmfWGs7pdiujnfOaWRij0=
=4kWY
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
