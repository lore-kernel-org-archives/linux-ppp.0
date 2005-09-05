From: Jim Barber <jim.barber@ddihealth.com>
Date: Mon, 05 Sep 2005 09:46:05 +0000
Subject: Windows IPSec/L2TP VPN client and Linux server with RADIUS, and PPP.
Message-Id: <431C13DD.9080600@ddihealth.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am hoping that someone can help me.
I have been working on this problem for days now and I've read so much
online documentation, how-tos, etc that my eyes are ready to fall out of
my head. :)

I have been trying to set up a Linux VPN server that will support the
IPSec/L2TP VPN client that is available with Microsoft Windows 2000
onwards.

I first tried the 'testing' distribution of Debian, but after failing to
get it to work with lt2pns, I moved to the 'unstable' distribution so
that I had new software available, and so I could use lt2pd with the
pppd daemon.

The infrastructure that I've been using to try and support this is:

- FreeRADIUS 1.0.4 for user authentication.
- Linux 2.6 kernel for the IPSec tunnel.
- Racoon 0.6.1 for the IPSec Key exchange.
- l2tpd 0.7-pre20031121 for the L2TP daemon.
- pppd 2.4.3-20050321+2 for the PPP daemon.
- radiusclient 0.3.2 for the PPP radius.so plugin configuration.
- openssl 0.9.7g for the generation and signing of certificates and keys.

I have had some limited success...

If I don't use the radius.so ppp plugin, and define a test user in the
/etc/ppp/chap-secrets file, then VPNs from my Windows XP client works
perfectly.

If I enable the use of the radius.so plugin, then users will no longer
authenticate.
However if I change the properties in the client's VPN security settings
so that all of the CHAP, MSCHAP, MSCHAPv2 options are disabled, and
only the PAP connection is enabled, then authentication via the radius
server works perfectly.

I don't want to post full logs at this stage unless someone requests
them since they are huge. I will post what I think is relevent at this
stage...

I believe that the RADIUS authentication isn't happening with MSCHAPv2
enabled because it doesn't have enough information passed to it.
The debugging part of the RADIUS server shows the following incoming
information:

rad_recv: Access-Request packet from host 10.10.0.218:1024, id7, lengthQ
         Service-Type = Framed-User
         Framed-Protocol = PPP
         User-Name = "user1"
         NAS-IP-Address = 10.10.0.216
         NAS-Port = 0

 From my research I believe that I should also see MS-CHAP-Challenge and
MS-CHAP2-Response entries in the output above.

I believe that the MS-CHAPv2 information is reaching the ppp daemon
because I see entries in it's debugging output like so:

sent [LCP ConfReq id=0x1 <mru 1400> <asyncmap 0x0> <auth chap MD5> <magic 0x9d821c9a> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x1 <auth chap MS-v2>]
sent [LCP ConfReq id=0x2 <mru 1400> <asyncmap 0x0> <auth chap MS-v2> <magic 0x9d821c9a> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x2 <mru 1400> <asyncmap 0x0> <auth chap MS-v2> <magic 0x9d821c9a> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <mru 1400> <magic 0x5b52779d> <pcomp> <accomp> <callback CBCP>]
sent [LCP ConfRej id=0x1 <callback CBCP>]
rcvd [LCP ConfReq id=0x2 <mru 1400> <magic 0x5b52779d> <pcomp> <accomp>]
sent [LCP ConfAck id=0x2 <mru 1400> <magic 0x5b52779d> <pcomp> <accomp>]
sent [LCP EchoReq id=0x0 magic=0x9d821c9a]
sent [CHAP Challenge id=0x29 <0e8e59d6606f7233d9fc0ef7e3e66301>, name = "research"]
rcvd [LCP Ident id=0x3 magic=0x5b52779d "MSRASV5.10"]
rcvd [LCP Ident id=0x4 magic=0x5b52779d "MSRAS-0-MICROBEE"]
rcvd [LCP EchoRep id=0x0 magic=0x5b52779d]
rcvd [CHAP Response id=0x29 <2f9bc1d22db3ecd79957616fd713c9080000000000000000b8f4c19d7d7edc1fbecfb562edc55cf3d5c17c8644b03cd500>, 
name = "user1"]
sent [CHAP Failure id=0x29 ""]
sent [LCP TermReq id=0x3 "Authentication failed"]

So either the ppp radius plugin isn't correctly seeing this MSCHAPv2
information and so failing to pass it on to the FreeRADIUS server, or it
is passing the information to the radius server, but the radius server
is failing to interpret it as MS-CHAP-Challenge and MS-CHAP2-Response
entries.

My configuration for the l2tpd daemon is as follows:

         [global]
         listen-addr = 10.10.0.219
         port = 1701

         [lns default]
         ip range = 10.10.0.248 - 10.10.0.254
         local ip = 10.10.0.220
         require chap = yes
         refuse pap = yes
         require authentication = yes
         hostname = vpn1
         ppp debug = yes
         pppoptfile = /etc/ppp/options.l2tpd
         length bit = yes

My configuration in the /etc/ppp/options.l2tpd file is as follows:

         ms-dns 10.10.0.100
         ms-wins 10.10.0.100
         auth
         crtscts
         lock
         mru 1400
         mtu 1400
         nodetach
         debug
         proxyarp
         ipcp-accept-local
         ipcp-accept-remote
         idle 1800
         connect-delay 5000
         nodefaultroute
         refuse-pap
         refuse-chap
         refuse-mschap
         require-mschap-v2
         nologfd
         plugin radius.so

I've configured the /etc/radiusclient/servers file with the correct
passwords for the radius server.
I've configured the /etc/radiusclient/radiusclient.conf with IP address
of the radius server.

In the modules section of the /etc/freeradius/radiusd.conf file I have
the following entry:

         mschap {
                 authtype = MS-CHAP
         }

In the authorize section of the /etc/freeradius/radiusd.conf file I have
the following entry:

         mschap

In the authenticate section of the /etc/freeradius/radiusd.conf file I
have the following entry:

         Auth-Type MS-CHAP {
                 mschap
         }

At one stage I was wondering if MPPE support was required, but I
couldn't see how since that is only for encryption of the PPP layer
which isn't necessary. But having tried all sorts of different
configuration combinations, I decided to compile up a kernel with
the MPPE patches along with enabling the MPPE directives in the
FreeRADIUS config and the options.l2tp file. This made no difference,
which I am happy with as that is what I expected.

I tried rebuilding the ppp Debian Package to see if it is compiled with
MS-CHAP support out of the box, and it does appear that it is. My custom
version of ppp didn't fair any better.

So I'm stuck now.
Does anyone know where I can go from here?

If necessary, I can post up complete logs, and even full configuration
files, but I thought I'd spare you all for the moment.

Any help is very much appreciated.

Regards,

-- 
----------
Jim Barber
DDI Health
