From: "Neil Wilson" <neil@dcdata.co.za>
Date: Fri, 10 Sep 2004 09:10:01 +0000
Subject: pppd Filtering
Message-Id: <0bb901c49715$f4272510$0300a8c0@neilw>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi Guys,

I have been trying to solve a problem with a server staying online and not
disconnecting, because activity is keeping the link up.

The activity from the /var/log/messages is "IN=3Dppp0 OUT=3D MACSRC=155.239=
.185.193 DST=155.239.198.170 LENH TOS=3D0x00 PREC=3D0x00 TTL=123
IDI468 DF PROTO=3DTCP SPT=1919 DPTD5 WINDOW=8760 RES=3D0x00 SYN URGP=3D0"

As far as I am aware this is activity cause by the Sasser worm trying to get
into my network, and it is getting blocked by the firewall.

I have tried using ppp filtering to stop these,with the line 'active-filter
"not port 445"' in the options.demand file, but this has made no difference.

I have also tried using different syntax's, including adding "inbound" or
"outbound", and I get the following error. "pppd: error in active-filter
expression: inbound/outbound not supported on linktype 0"

Please could someone help me in filtering this activity, so that my server
disconnects when it is supposed to.

I am running slackware 10, with ppp filtering compiled in the kernel by
default, and pppd has the filter option enable also by default.
My idle time is set to 120 in my options.demand file.

Many thanks in advance!

Neil Wilson

