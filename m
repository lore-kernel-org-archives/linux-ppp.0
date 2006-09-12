From: "Ludovic MARCILLY" <lmarcilly@aressi.fr>
Date: Tue, 12 Sep 2006 07:57:23 +0000
Subject: Re-2: Authentication problems
Message-Id: <0001E280.45068483@aressi.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


First of all, thank you for your answer! Now it works. In fact, i have put the
auth-pap in my config files because i think i have to put it in order to
authenticate me to the server with pap. It seems that i was wrong...

So i can't put these options in the config file on the client side? If i
understand, he server ask the client for PAP, CHAP or MS-CHAP method to
authenticate? The client doesn't choose authentication method? Is it right?

Thanks for your answer.

Ludo.

-------- Original Message --------
Subject: Re: Authentication problems (11-Sep-2006 19:43)
From:     unruh@physics.ubc.ca
To:         lmarcilly@aressi.fr

So why are you asking the server to authenticate to you using pap? 
Almost no server will do so.
Get rid of the auth-pap or +pap from your options. 
That is NOT without authentication. The  far side demands that you
authenticate to them anyway.



On Mon, 11 Sep 2006, Ludovic MARCILLY wrote:

> Hi all,
>
> I try to use linux pptp client in order to connect to a Windows 2003
> Server but without any success.
>
> When i try to connect without authentication, it seems to work. So i
> try with PAP, CHAP, MSCHAP and MSCHAPv2 but it doesn't work.

Why?

>
> Here are my logs for a test with PAP:
>
> Sep 11 11:56:18 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x1 <asyncmap
> 0x0> <auth pap> <magic 0x9bb62805> <pcomp> <accomp>]

YOu ask them to authenticate to you using pap.

> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x0 <mru
> 1400> <auth pap> <magic 0x309a32f4> <pcomp> <accomp> <callback CBCP>
> <mrru 1614> <endpoint
> [local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]> <
> 17 04 00 22>]

They ask you to authenticate to them using pap.

> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfRej id=0x0 <callback
> CBCP> <mrru 1614> < 17 04 00 22>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfAck id=0x1 <asyncmap
> 0x0> <auth pap> <magic 0x9bb62805> <pcomp> <accomp>]

They agree to authenticate to you.

> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x1 <mru
> 1400> <auth pap> <magic 0x309a32f4> <pcomp> <accomp> <endpoint
> [local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfAck id=0x1 <mru
> 1400> <auth pap> <magic 0x309a32f4> <pcomp> <accomp> <endpoint
> [local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [PAP AuthReq id=0x1
> user="vpnman" password=<hidden>]

You send your name and password.

> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [PAP AuthAck id=0x1 ""]

They say it is ok.

> Sep 11 11:56:21 LinuxBox pppd[1834]: PAP authentication succeeded
> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x3 <mru
> 1400> <auth pap> <magic 0x31655e15> <pcomp> <accomp> <callback CBCP>
> <mrru 1614> <endpoint
> [local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]> <
> 17 04 00 22>]

They repeat their request. as if nothing had happened.

> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x2 <asyncmap
> 0x0> <auth pap> <magic 0x7715a449> <pcomp> <accomp>]

So do you.

> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfRej id=0x3 <callback
> CBCP> <mrru 1614> < 17 04 00 22>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfRej id=0x2 <auth
> pap>]

But this time they refuse to authenticate themselves to you with pap.

> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfReq id=0x3 <asyncmap
> 0x0> <magic 0x7715a449> <pcomp> <accomp>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfReq id=0x4 <mru
> 1400> <auth pap> <magic 0x31655e15> <pcomp> <accomp> <endpoint
> [local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: sent [LCP ConfAck id=0x4 <mru
> 1400> <auth pap> <magic 0x31655e15> <pcomp> <accomp> <endpoint
> [local:21.c5.a8.4c.e7.20.49.3d.a3.30.be.d2.48.a0.d6.b3.00.00.00.00]>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: rcvd [LCP ConfAck id=0x3 <asyncmap
> 0x0> <magic 0x7715a449> <pcomp> <accomp>]
> Sep 11 11:56:21 LinuxBox pppd[1834]: peer refused to authenticate:
> terminating link

At which point you tell them to get lost and hang up.


> On the windows server logs, i can see that vpnman session is opened but
> i see "peer refused to authenticate: terminating link" in my linux
> logs.
>
> Here are my config files:
>
> /etc/ppp/peers/Tunnel1:
>
> file /var/vpn/pptp-client/options
> pty "pptp 192.168.8.239 --nolaunchpppd"
> name vpnman
> remotename VpnServer
> nomppe


> noauth
> require-pap
> refuse-chap
> refuse-mschap
> refuse-mschap-v2

These are all nonesense. Get rid of them all.

-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html







