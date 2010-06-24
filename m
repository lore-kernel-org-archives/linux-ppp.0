From: arun b <arun.s.bailur@gmail.com>
Date: Thu, 24 Jun 2010 05:13:27 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <AANLkTimTOI1078hOKKNLgN611bLZ3AzZGgb-qFv57_Dg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Well I need to bring up the setup for both data and header compression..
Below are the logs, obtained I can see there is CCP-protocol
negotiation initiated and got rejected.

1) Not sure where is wrong ..... is client is up with CCP here?
2) Can we use PPPoE test  to do CCP negotiaoin successfully ?

Here i provide the logs i got in the test...
Regs,
Arun

LOGS:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Plugin pppoatm.so loaded.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 using channel 1
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Using interface ppp0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Connect: ppp0 <--> 8.48
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [LCP ConfReq id=3D0x1 <m=
agic 0x9197cda1>]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [LCP ConfAck id=3D0x1 <m=
agic 0x9197cda1>] 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [LCP ConfReq id=3D0x9 <a=
uth chap MD5> <magic
0xffe16db>] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [LCP ConfAck id=3D0x9 <a=
uth chap MD5> <magic 0xffe16db>]

=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sent [LCP EchoReq id=3D0x0 ma=
gic=3D0x9197cda1]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [CHAP Challenge id=3D0x1
<0ca36321bddd80756467d9f49a764ad3>, name =3D "ASAMRouter"] 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Warning - secret file /etc/pp=
p/chap-secrets has world
and/or group access

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [CHAP Response id=3D0x1
<31dc4c7b43023d4691446131a9248418>, name =3D "test"]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [LCP EchoRep id=3D0x0 ma=
gic=3D0xffe16db] 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [CHAP Success id=3D0x1 "=
"] 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CHAP authentication succeeded

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CHAP authentication succeeded

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kernel does not support PPP f=
iltering

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [CCP ConfReq id=3D0x1 <d=
eflate 15> <deflate(old#)
15> <bsd v1 15>]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [IPCP ConfReq id=3D0x1 <=
compress VJ 0f 01> <addr 0.0.0.0>]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [IPCP ConfReq id=3D0x1 <=
addr 19.0.0.1>] 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [IPCP ConfAck id=3D0x1 <=
addr 19.0.0.1>]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [LCP ProtRej id=3D0xa 80=
 fd 01 01 00 0f 1a 04 78 00
18 04 78 00 15 03 2f] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Protocol-Reject for 'Compress=
ion Control Protocol'
(0x80fd) received

=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0rcvd [IPCP ConfRej id=3D0x1 <=
compress VJ 0f 01>] 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [IPCP ConfReq id=3D0x2 <=
addr 0.0.0.0>]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [IPCP ConfNak id=3D0x2 <=
addr 13.0.0.20>] 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sent [IPCP ConfReq id=3D0x3 <=
addr 13.0.0.20>]

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcvd [IPCP ConfAck id=3D0x3 <=
addr 13.0.0.20>] 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 ...

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local=A0 IP address 13.0.0.20

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 remote IP address 19.0.0.1

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Script /etc/ppp/ip-up started=
 (pid 780)

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Script /etc/ppp/ip-up finishe=
d (pid 780), status =3D 0x1


On Wed, Jun 23, 2010 at 11:47 PM, James Carlson
<carlsonj@workingcode.com> wrote:
>
> arun b wrote:
> > Hi James.,
> >
> > Thank you as usual to respond me quick..!
> > Well =A0I wanted to validate rfc-1662.
> > I see in ppp source =A0deflate, bsd, compression =A0are these covers
> > rfc-1662 if so please provide me further info on this
>
> I'm afraid I still don't really understand.
>
> RFC 1662 describes AHDLC, which is the low-level framing on async lines,
> as well as the other mappings of PPP to octet-synchronous HDLC (read:
> SONET/SDH) and bit-stuffed HDLC (read: ISDN and other telecom). =A0It
> doesn't really describe much about "compression" except a few header
> compression bits.
>
> Are you really asking about PPP header compression? =A0If so, why? =A0What
> could you be testing that would require a specific test for this?
>
> If you need such a low-level PPP-specific test, I strongly recommend
> getting a protocol validation device or employing a service. =A0IXIA's
> ixANVL tester can verify low-level details of protocol operation.
> Another place to turn would be UNH's IOL.
>
> If you actually have your own independent implementation (and wanting to
> test this low-level detail on your own suggests that you do), then I
> really recommend getting the right tools for the job.
>
> If you don't want to do either of those, then you're probably on your
> own. =A0You could perhaps make do by using the existing options described
> in pppd(1M) along with either an external analyzer or (perhaps) using
> either the pppdump(1M) tool or even kdebug 3.
>
> But, again, this is just header compression, not data compression. =A0It's
> really pretty boring stuff.
>
> Did you mean RFC 1962 instead? =A0If so, then that's just what
> _negotiates_ compression. =A0The actual compression takes place using the
> compression algorithms, and these are controlled by the documented
> pppd(1M) options and the kernel modules, as I mentioned in my first reply.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
