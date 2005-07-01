From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Fri, 01 Jul 2005 16:58:56 +0000
Subject: Unsupported protocol errors cause some tunnels to "freeze"
Message-Id: <20050701165855.GA9760@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

We're trying to get things stabilized for using VoIP over our tunnels (hence
the TOS stuff I was attempting before which was thwarted).

We're doing PPP within PPTP/GRE with MPPE encryption and occasionally are
running into links that "freeze" but do not disconnect.

On the client side:

pppd 2.4.2b3
MPPE Patch that comes with that version
Linux kernel 2.4.20

pppd options on client side:

defaultroute
usepeerdns
pty 'pptp 192.168.1.53 --nolaunchpppd'
user 'xxx@xxx'
nodeflate
nobsdcomp
require-mppe
require-mschap-v2
persist
mtu 1460
mru 1460
ipcp-accept-remote
ipcp-accept-local
lcp-echo-failure 5
lcp-echo-interval 20
noauth

Server side:

pppd 2.4.3
MPPE/MPPC Module from Jan Dubiec, MPPC disabled.
Kernel 2.6.11.6

We are using the following pppd options on the server:

lock
name pptpd
proxyarp
require-mschap-v2
mppe required,stateless
nomppc
ms-dns xx.xx.xx.xx
ms-dns xx.xx.xx.xx
plugin radius.so
plugin radattr.so
nodeflate
mtu 1456
mru 1456
lcp-restart 5
lcp-echo-interval 20
lcp-echo-failure 5
nobsdcomp
novj
noaccomp
nodeflate
nopcomp

The clients are running on Linksys devices and are a bit tricker to change
settings on.

What happens is occasionally, randomly, and totally unreproducibly one of our
connections freezes up.  LCP and GRE (PPTP) appear to still be passing
traffic, so the connection doesn't drop, it still is passing data in both
directions, it's just that the pppd driver doesn't appear to think it's valid.

Here's what we see in the debug logs when this occurs:

Jul  1 09:16:21 chico-pptp2 pppd[6643]: Unsupported protocol 0x83 received
Jul  1 09:16:31 chico-pptp2 pppd[6643]: Unsupported protocol 0xf9 received
Jul  1 09:16:41 chico-pptp2 pppd[6643]: Unsupported protocol 0x63 received
Jul  1 09:16:51 chico-pptp2 pppd[6643]: Unsupported protocol 0x6b received
Jul  1 09:17:44 chico-pptp2 pppd[6643]: Unsupported protocol 0xc1 received
Jul  1 09:17:54 chico-pptp2 pppd[6643]: Unsupported protocol 0xd083 received
Jul  1 09:18:19 chico-pptp2 pppd[6643]: Unsupported protocol 'AppleTalk SmartBuffered' (0x3b) received
Jul  1 09:18:22 chico-pptp2 pppd[6643]: Unsupported protocol 0x11 received
Jul  1 09:18:28 chico-pptp2 pppd[6643]: Unsupported protocol 0xf7 received

Just random protocol numbers.

Our theory is that the MPPE compressesion is somehow getting screwed up and
we're getting gibberish in the protocol field.  Unsure how this would happen
however.  Sending a SIGUSR2 to the pppd processes does not seem to renegotiate
compression, but instead just drops the link.

I am fairly certain GRE/PPTP is not the problem as data appears to be
travelling back and forth and arriving at the destination, but pppd chokes on
it.  I guess it's possible that pptpclient / ppptd are messing up the packets.

Options we are considering:

 - Upgrading pppd to 2.4.3 on the client side.
 - Upgrading MPPE module on client side (trickier, since we are tied to kernel
   2.4.20)
 - Trying noccp option (shot in the dark).

I've done tcpdumps on the raw GRE traffic, but it hasn't proven to be real
informative.  Any recommendations on how I can further troubleshoot this?

Ray
