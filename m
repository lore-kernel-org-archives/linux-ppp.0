From: Nicholas Humfrey <njh@aelius.com>
Date: Sat, 20 Feb 2021 01:13:02 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <28d6f815-4e98-a4c4-ec53-55803669d7a7@aelius.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


>> Looking at the git master branch, it looks like Pali Roh=C3=A1r is activ=
ely
>> working in this space:
>>
>> https://github.com/paulusmack/ppp/commits/master
> Well, I'll give a look to find what's wrong.


Just a quick follow up to say that it is all working fine after I=20
upgraded to version 2.4.9 of pppd.

I had initially been using version 2.4.7, that came with Raspberry Pi OS=20
(buster).
I had also been testing using git master of the ppp repo on the 'client'.

But I hadn't tried upgrading the 'server' (the peer configured with the=20
interface identifiers).
After upgrading to 2.4.9 on the 'server' it works perfectly - even with=20
an older version of pppd on the 'client'.
I haven't tracked down the commit that fixed it but I guess it was=20
something to do with failing to Nack the random interface identifier=20
sent by the peer.

Thank you for your help and thoughts on the issue.


nick.


|pppd file ./ppp-options ipv6cp-accept-local /dev/ttyAMA0 115200 using=20
channel 368 Using interface ppp0 Connect: ppp0 <--> /dev/ttyAMA0 sent=20
[LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0x7f793cbe>] rcvd [LCP ConfReq =

id=3D0xb <asyncmap 0x0> <magic 0xecde7250>] sent [LCP ConfAck id=3D0xb=20
<asyncmap 0x0> <magic 0xecde7250>] rcvd [LCP ConfReq id=3D0xb <asyncmap=20
0x0> <magic 0xecde7250>] sent [LCP ConfAck id=3D0xb <asyncmap 0x0> <magic=20
0xecde7250>] rcvd [LCP ConfAck id=3D0x1 <asyncmap 0x0> <magic 0x7f793cbe>] =

sent [LCP EchoReq id=3D0x0 magic=3D0x7f793cbe] sent [IPV6CP ConfReq id=3D0x=
1=20
<addr fe80::0dfd:3c3b:e130:91ce>] rcvd [LCP EchoReq id=3D0x0=20
magic=3D0xecde7250] sent [LCP EchoRep id=3D0x0 magic=3D0x7f793cbe] rcvd [LC=
P=20
EchoRep id=3D0x0 magic=3D0xecde7250] rcvd [IPV6CP ConfReq id=3D0xb <addr=20
fe80::0000:0000:0000:0001>] sent [IPV6CP ConfAck id=3D0xb <addr=20
fe80::0000:0000:0000:0001>] rcvd [IPV6CP ConfNak id=3D0x1 <addr=20
fe80::0000:0000:0000:0002>] sent [IPV6CP ConfReq id=3D0x2 <addr=20
fe80::0000:0000:0000:0002>] rcvd [IPV6CP ConfAck id=3D0x2 <addr=20
fe80::0000:0000:0000:0002>] local LL address fe80::0000:0000:0000:0002=20
remote LL address fe80::0000:0000:0000:0001 Script /etc/ppp/ipv6-up=20
started (pid 7049) Script /etc/ppp/ipv6-up finished (pid 7049), status =3D =

0x0 |

