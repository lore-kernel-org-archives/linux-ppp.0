From: "Gerianne McC" <geriannemcc@gmail.com>
Date: Mon, 14 Apr 2008 14:43:22 +0000
Subject: What are the correct NETMASKs for multiple PPPoE interfaces in a StaticIP block?
Message-Id: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I'm connecting via PPPoE to my ISP (SBC).

I've a static IP /29 assigned to me (x.x.x.232 - x.x.x.239).

To 'get at' (for firewalling, etc, eventually) all the static IPs,
I've setup in-kernel PPPoE to negotiate the connection through
an ADSL mode config'd in bridge-mode.

I'm confused about assigning NETMASKs.

I'm making my primary ppp connection at interface

       ppp0, IP address = x.x.x.238

and setting up interface aliases of,

       ppp0:1, IP address = x.x.x.233
       ppp0:2, IP address = x.x.x.234
       ppp0:3, IP address = x.x.x.235
       ppp0:4, IP address = x.x.x.236
       ppp0:5, IP address = x.x.x.237

using an intfc cloning range defined in
"/etc/sysconfig/network-systems/ifcfg-ppp0-range0"

I plan to handle each interface ppp0 + ppp0:1-5 separately in my firewall.

Questions:

What should be the NETMASK for the primary 'ppp0'? /29 or /32?
And for each of the aliases?

If the right answer if ppp0 -> /29, & ppp0:# -> /32, should I ALSO
create an alias ppp0:6, IP address = x.x.x.238 (same as ppp0 !?) but
with a /32?

Thanks.

Geri :-)
