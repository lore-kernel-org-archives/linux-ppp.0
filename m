From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Fri, 10 Sep 2004 20:43:39 +0000
Subject: Re: pppd Filtering
Message-Id: <Pine.LNX.4.21.0409100833120.1230-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <0bb901c49715$f4272510$0300a8c0@neilw>
In-Reply-To: <0bb901c49715$f4272510$0300a8c0@neilw>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Fri, 10 Sep 2004, Neil Wilson wrote:

|I have been trying to solve a problem with a server staying online and not
|disconnecting, because activity is keeping the link up.

My comments don't solve the problem but perhaps will give you some basis
for comparison.

|The activity from the /var/log/messages is "IN=3Dppp0 OUT=3D MAC|SRC=155.2=
39.185.193 DST=155.239.198.170 LENH TOS=3D0x00 PREC=3D0x00 TTL=123
|IDI468 DF PROTO=3DTCP SPT=1919 DPTD5 WINDOW=8760 RES=3D0x00 SYN URGP=3D0"
|
|As far as I am aware this is activity cause by the Sasser worm trying to g=
et
|into my network, and it is getting blocked by the firewall.
|
|I have tried using ppp filtering to stop these,with the line 'active-filter
|"not port 445"' in the options.demand file, but this has made no differenc=
e.
|
|I have also tried using different syntax's, including adding "inbound" or
|"outbound", and I get the following error. "pppd: error in active-filter
|expression: inbound/outbound not supported on linktype 0"

If this was any distribution except Slackware then I'd say the pppd that
came with it has been modified and broken.  This type of error is typical
if you use tcpdump, at least a version cetera Oct 2002:

~# tcpdump -i ppp0 'outbound'
tcpdump: inbound/outbound not supported on linktype 113

(I've no idea what "linktype" means but, IMHO, the maintainer of tcpdump
should fix tcpdump to support inbound/outbound on PPP interface, as the
tcpdump man pages appear to say it does.)

But the active-filter works fine with the 2.4.1 or 2.4.2 pppds that I've
compiled using any 2.4.x kernel complied with the proper options, at least
through 2.4.24 (I also compile my kernels).  I use

active-filter '(outbound and not (icmp[0] =3D 0))'

to reset the idle timer only for outbound traffic that is not a ping echo
reply (I don't care if someone pings me but don't want the reply to reset
the timer).  That and a firewall has been very effective.  The firewall
allows me to initiate a TCP connection but prevents other hosts from
initiating connections not associated with an existing connection unless
a server port is specifically allowed.

There was a problem with active-filter in kernels 2.6.6 and 2.6.7, but this
one seems to be different and no such message was generated.  The problem
is fixed in 2.6.8.1, the latest "stable" kernel I know about.

|Please could someone help me in filtering this activity, so that my server
|disconnects when it is supposed to.
|
|I am running slackware 10, with ppp filtering compiled in the kernel by
|default, and pppd has the filter option enable also by default.
|My idle time is set to 120 in my options.demand file.

It seems to me you have two problems.  The active-filter problem and a
firewall problem.  I can't imagine what's causing the active-filter
problem, given that pppd and the kernel are both compiled to support it.
My firewall is based this one:

http://iptables-tutorial.frozentux.net/scripts/rc.firewall.txt

Tuning it to suit me wasn't hard, and I'm far from being an iptables
expert.

---
Clifford Kite                                 http://ckite.no-ip.net



