From: Charles Price <charlie.price@w3z.co.uk>
Date: Mon, 18 Oct 2004 20:45:06 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <200410182145.12298.charlie.price@w3z.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 18 October 2004 18:21, Michal Ostrowski wrote:
> From rom what I can tell the problem is on the other end of the connection.
>
> It looks like the other end has terminated your connection.
>
> PPP/PPPoE on this end appears to be behaving correctly.

I don't think this is the case.

a) The (WinXP) PPPoE client has been working perfectly on several other 
networks.
b) The tcpdump output shows that the client is sending many LCP ConfReq 
packets to my server - which does not respond at all until the client gives 
up and sends a PADT. I should have added src/dst MAC addresses to the output 
of tcpdump ;-)

It looks like pppoe-server spawns pppd okay - I can see the process in 'ps ax' 
but perhaps the spawned pppd cannot use plugins/rp-pppoe.so correctly - if we 
look in the strace output (line 273):

10387 open("/etc/ppp/plugins/rp-pppoe.so", O_RDONLY) = 1

the plugin has been opened successfully. However, in line 290:

10387 write(1, "Plugin /etc/ppp/plugins/rp-pppoe"..., 43) = -1 EBADF (Bad file 
descriptor)

it seems something went wrong. Or perhaps my first attempt at reading strace 
output is wrong?

Regards,

Charlie Price
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBdCtY3k8SswDN/tkRAieCAKCUR8uAoZDFpcQQ46EiGeSYow34YwCfW2IB
9FU9gIHsBo04k3FZJeMHaX4=YXI5
-----END PGP SIGNATURE-----
