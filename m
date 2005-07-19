From: David Corbin <dcorbin@machturtle.com>
Date: Tue, 19 Jul 2005 14:27:29 +0000
Subject: Re: auth eap
Message-Id: <200507191027.29812.dcorbin@machturtle.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200507190713.53851.dcorbin@machturtle.com>
In-Reply-To: <200507190713.53851.dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tuesday 19 July 2005 09:43 am, James Carlson wrote:
> David Corbin writes:
> > On Tuesday 19 July 2005 08:11 am, James Carlson wrote:
> > > David Corbin writes:
> > > > So, I'm not sure what you by "temporary credentials"
> > >
> > > Then I'd have to say that there's either a misconfiguration or bug
> > > somewhere.  Either you're missing the corresponding "user
> > > $DOMAIN\\$USERNAME" option (such that LCP can't 'see' that this entry
> > > would be usable)
> >
> > You are suggesting the word "user" should appear in a file somewhere, are
> > you? Because I don't have that.
>
> It should be part of the pppd configuration, either in one of the
> "options" files, or on the pppd command line.  If you don't specify
> it, then pppd assumes the system hostname as the default.  Unless your
> system hostname happens to be $DOMAIN\\$USERNAME, that's probably not
> going to work.  See the pppd man page for details.

Ah.  It was missing, but I've added it with no effect.  Here's the full debug 
output
 pon enttek-vpn debug dump logfd 2 nodetach
pppd options in effect:
debug           # (from command line)
nodetach                # (from command line)
logfd 2         # (from command line)
dump            # (from command line)
noauth          # (from /etc/ppp/options.pptp)
name enttek\\dev                # (from /etc/ppp/peers/enttek-vpn)
user enttek\\dev                # (from /etc/ppp/peers/enttek-vpn)
remotename PPTP         # (from /etc/ppp/peers/enttek-vpn)
                # (from /etc/ppp/options.pptp)
pty pptp vpn.enttek.net --nolaunchpppd          # 
(from /etc/ppp/peers/enttek-vpn)
mru 1000                # (from /etc/ppp/options.pptp)
mtu 1000                # (from /etc/ppp/options.pptp)
lcp-echo-failure 10             # (from /etc/ppp/options.pptp)
lcp-echo-interval 10            # (from /etc/ppp/options.pptp)
ipparam enttek-vpn              # (from /etc/ppp/peers/enttek-vpn)
nobsdcomp               # (from /etc/ppp/options.pptp)
nodeflate               # (from /etc/ppp/options.pptp)
require-mppe            # (from /etc/ppp/options.pptp)
require-mppe-128                # (from /etc/ppp/peers/enttek-vpn)
using channel 5
Using interface ppp0
Connect: ppp0 <--> /dev/pts/4
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x2d2dd597> <pcomp> 
<accomp>]
rcvd [LCP ConfReq id=0x0 <mru 1400> <auth eap> <magic 0x5b4f7d3f> <pcomp> 
<accomp> <callback CBCP> <mrru 1614> <endpoint 
[local:ca.14.8c.08.a1.f5.4f.e5.82.f7.00.db.32.c5.73.48.00.00.00.00]> < 17 04 
00 26>]
No auth is possible
sent [LCP ConfRej id=0x0 <auth eap> <callback CBCP> <mrru 1614> < 17 04 00 
26>]
rcvd [LCP ConfAck id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x2d2dd597> <pcomp> 
<accomp>]
rcvd [LCP TermReq id=0x1 "[O}?\000<\37777777715t\000\000\003\37777777627"]
sent [LCP TermAck id=0x1]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x2d2dd597> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x2d2dd597> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x2d2dd597> <pcomp> 
<accomp>]
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x2d2dd597> <pcomp> 
<accomp>]
Terminating on signal 2.
Script pptp vpn.enttek.net --nolaunchpppd finished (pid 8752), status = 0x0
Modem hangup
Connection terminated.


>
> > > , or it's garbled, or there's a bug in the basic
> > > auth.c code that does the lookup for LCP, or LCP itself has become
> > > mangled.
> >
> > Well, I suppose I can build it and debug it with gdb (or printf).  Any
> > particular tips in that area?
>
> The function that's used to determine if there's a viable
> MD5-Challenge secret present in the /etc/ppp/chap-secrets file is
> have_chap_secret() in pppd/auth.c.

Thanks.
