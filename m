From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 28 Oct 2004 16:04:13 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <Pine.LNX.4.58.0410280857220.1553@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 28 Oct 2004, a b wrote:

> Hello,
> 
> First sorry for my poor English.
> 
> I'm trying to set up a pptpd server under Mandrake
> 10.0 and I think my problem is related to pppd and the
> authentication.

Probably. 

> 
> server: 10.0.0.178, client 10.0.0.124
> ppp-2.4.3-0.cvs_20040527.5mdk
> pptpd-server-1.2.1-1mdk
> kernel 2.6.3-19mdksecure
> 
> server: 
> cat /etc/pptpd.conf
> option /etc/ppp/options.poptop
> stimeout 10
> speed 115200
> localip 10.0.0.178
> remoteip 10.0.1.234-238
> 
> cat /etc/ppp/options.poptop 
> logfile /tmp/vpn.log
> dump
> debug
> refuse-pap
> refuse-eap
> refuse-chap
> refuse-mschap
> require-mschap-v2

Why in the world you would require mschap-v2 on a machine that runs pppd
is completely beyond me. It would be like demanding running boards on a
Ferrari. Remove these all. IF you are going to require anything make it
eap, but if you communicate with anything but a pppd client that will
not work. chap and pap are far better options. 


> lock
> 
> cat /etc/ppp/chap-secrets
> # Secrets for authentication using CHAP
> # client        server  secret                  IP
> addresses
> adrian  *       adrian  *
> 
> 
> client:
> 
> cat /etc/ppp/peers/pptp0 
> logfile /tmp/vpn.log
> dump
> debug
> refuse-pap
> refuse-eap
> refuse-chap
> refuse-mschap
> require-mschap-v2

Now you are getting completely silly. This says that you are demanding
that the server authenticate itself to the client using mschapv2. 
REmove all of these "refuse/require" entries. I think you are very
confused as to what they mean. 


> lock
> pty "/usr/sbin/pptp 10.0.0.178 --nolaunchpppd"
> nodetach
> 
> cat /etc/ppp/chap-secrets
> # Secrets for authentication using CHAP
> # client        server  secret                  IP
> addresses
> adrian  *       adrian  *
> 
> cat -A /etc/ppp/chap-secrets
> # Secrets for authentication using CHAP$
> # client^Iserver^Isecret^I^I^IIP addresses$
> adrian^I*^Iadrian^I*$
> 
> logs on the server side:
> tail -f /tmp/vpn.log -n 100
> 
> pppd options in effect:
> debug           # (from /etc/ppp/options.poptop)
> logfile /tmp/vpn.log            # (from
> /etc/ppp/options.poptop)
> dump            # (from /etc/ppp/options.poptop)
> require-mschap-v2               # (from
> /etc/ppp/options.poptop)
> refuse-pap              # (from 
> etc/ppp/options.poptop)
> refuse-chap             # (from
> /etc/ppp/options.poptop)
> refuse-mschap           # (from
> /etc/ppp/options.poptop)
> refuse-eap              # (from
> /etc/ppp/options.poptop)
> 115200          # (from command line)
> lock            # (from /etc/ppp/options.poptop)
> local           # (from command line)
> ipparam 10.0.0.124         # (from command line)
> 10.10.0.178:10.10.1.234           # (from command
> line)
> using channel 6
> Using interface ppp0
> Connect: ppp0 <--> /dev/pts/1
> sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap
> MS-v2> <magic 0x140228e> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap
> MS-v2> <magic 0xc3c66f9d> <pcomp> <accomp>]
> No auth is possible
> sent [LCP ConfRej id=0x1 <auth chap MS-v2>]
> rcvd [LCP ConfRej id=0x1 <auth chap MS-v2>]
> sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic
> 0x140228e> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic
> 0xc3c66f9d> <pcomp> <accomp>]
> sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic
> 0xc3c66f9d> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic
> 0x140228e> <pcomp> <accomp>]
> peer refused to authenticate: terminating link

That should be pretty clear.


> sent [LCP TermReq id=0x3 "peer refused to
> authenticate"]
> rcvd [LCP TermReq id=0x3 "peer refused to
> authenticate"]
> sent [LCP TermAck id=0x3]
> rcvd [LCP TermAck id=0x3]
> Connection terminated.
> 
> Please note that if I simply change two lines on both
> sides:
> 
> add noauth and comment out require-mschap-v2 I get

Yes. YOu SHOULD have noauth on the client side, unless you really want
them to authenticate to each other.

You also it seems do not use the "user" option on the client side. You
have to do so.
man pppd


> any ideas ?

man pppd
