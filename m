From: marc ferraton <mferrato@ogm-techno.org>
Date: Fri, 24 Sep 2004 08:14:31 +0000
Subject: Re: pppd 2.4.2  with SMP -- crash --
Message-Id: <4153D767.4080409@ogm-techno.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
In-Reply-To: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Clive Nicolson wrote:
> On Thu, 23 Sep 2004, marc ferraton wrote:
>=20
>=20
>>Clive Nicolson wrote:
>>
>>>Hi,
>>>
>>>feed your opps through ksymoops so we can see what the addresses refer t=
o.=20
>>>Then post the improved oops to linux-ppp .
>>>
>>>What adsl card are you using.
>>
>>modem alcatel speed-touch ethernet
>>
>>
>>>Clive
>>>
>>>
>>
>>Hello,
>>
>>Thanks you for your help ;)
>>but i am a stupid boy,
>>When i would use ksymoops, i see more warning.. also i'he recompiled my=20
>=20
>=20
> We really need to see the oops after it has been feed through ksymoops.
>=20
>=20
>>kernel, but i have made some changes... (delete and/or replace modules)=20
>>and STUPID, i have delete my old-config ;(
>>
>>Oops..
>>
>>BUT, with this new kernel, i can start pppd without crash,.. hum good ;)
>>whenever, after start adsl, the use of internet (sample lynx=20
>>www.gnu.org) crash always, with KERNEL BUB sched.c..... whaoo !!
>>
>=20
> ....
>=20
>>Also I reedit my kernel, replace all modules by static,
>>reinstall slack ppp (2.4.2-i486), and on
>>my Proliant ML370 P17 with kernel 2.4.26 + SMP, pppoe is OK. Why ?
>=20
>=20
> You have changed so much at once it is now very hard to know what changed=
=20
> the behaviour. What we need is the output from ksymoops.
>=20

I see what this Oops interress you,
also because today my conf is validated, I tree to recover the bug ( I
have keeped a version of the same config without smp).
I remade the installation, and informe you as soon as twice with
ksymoops infos ;=FE.

>=20
>>I join my config because, I don't say if my network configuration is=20
>>correct.
>>
>>Purhaps, you can help me for my new problem,
>>I have error when i compile source of ppp.
>>
>>demand.c:53:21: net/bpf.h: No such file or directory
>>make[1]: *** [demand.o] Error 1
>>make[1]: Leaving directory `/home/forum/ML370_P17/ppp-2.4.2/pppd'
>>make: *** [all] Error 2
>=20
>=20
> I see you should now have a solution for this.
>=20
> In chat.c at line 216 put a "static" there, ie
>=20
> static void logf( ...
>=20
> Clive
>=20
>=20

for ppd:
i have linked /usr/include/pcap-bpf.h with /usr/include/net/bpf.h
edit chat.c line 216
compile + install, all is OK

see join make.log

last thing:
pppd compile error become also with cdrom source slackware, the shell=20
proccess ppp.SlackBuild produce same result
 >>demand.c:53:21: net/bpf.h: No such file or directory
 >>make[1]: *** [demand.o] Error 1
 >>make[1]: Leaving directory `/home/forum/ML370_P17/ppp-2.4.2/pppd'
How Patrick can build it ?, I have not found bpf.h in others packages

bash-2.05b$ grep bpf /var/log/packages/*
/var/log/packages/tcpdump-3.8.3-i486-2:usr/include/pcap-bpf.h

Best Regards
-- marc ferraton --





