From: James Chapman <jchapman@katalix.com>
Date: Thu, 21 Oct 2004 08:44:26 +0000
Subject: Re: pppd mtu negotiation problems
Message-Id: <417776EA.1000304@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4176BDD8.30803@katalix.com>
In-Reply-To: <4176BDD8.30803@katalix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Chen, thanks for the clarification.

I assumed pppd's mtu parameter set the max value for the local ppp
interface's mtu. I thought that was why pppd has separate mtu and mru
parameters.

Is it ok for ppp to set its local ppp interface mtu to the minimum of
the peer's mru and its preferred mtu? I can do this in my pppd plugin.

Thanks

/james

Chen=A3=A8=B3=C2=A3=A9 Jun=A3=A8=BE=FC=A3=A9 wrote:
> ........
>=20
>> The local syslog contains the following.
>>
>> pppd[3442]: pppd 2.4.2 started by root, uid 0
>> pppd[3442]: using channel 12
>> pppd[3442]: Using interface ppp0
>> pppd[3442]: Connect: ppp0 <-->
>> pppd[3442]: sent [LCP ConfReq id=3D0x1 <mru 1460> <magic 0x1175456f>]
>> pppd[3442]: rcvd [LCP ConfReq id=3D0x1 <mru 1464> <auth pap> <magic
>> 0x7bdddc5>]
>> pppd[3442]: sent [LCP ConfAck id=3D0x1 <mru 1464> <auth pap> <magic
>> 0x7bdddc5>]
>>                                      ^^^^^^^^^^
>> pppd[3442]: rcvd [LCP ConfReq id=3D0x2 <mru 1464> <auth pap> <magic
>> 0x7bdddc5>]
>> pppd[3442]: sent [LCP ConfAck id=3D0x2 <mru 1464> <auth pap> <magic
>> 0x7bdddc5>]
>> pppd[3442]: sent [LCP ConfReq id=3D0x1 <mru 1460> <magic 0x1175456f>]
>> pppd[3442]: rcvd [LCP ConfNak id=3D0x1 <mru 1464>]
>> pppd[3442]: sent [LCP ConfReq id=3D0x2 <mru 1464> <magic 0x1175456f>]
>> pppd[3442]: rcvd [LCP ConfAck id=3D0x2 <mru 1464> <magic 0x1175456f>]
>=20
> .........
>=20
>> Questions:-
>>
>> - Is cisco right to request MTU of 1464 and then set its interface to
>>   have MTU of 1460? Perhaps the MTU value sent during LCP negotiations
>>   is supposed to include the ethernet checksum? If so, pppd should
>>   always reduce the negotiated value of MTU by 4 when doing
>>   netif_set_mtu() for ethernet links.
>>
>> - Is the above LCP negotiation correct? Should pppd ack the 1464 value
>>   when an MTU of 1460 is requested? (See the '^^^^' annotation in the
>>   log above).
>=20
>=20
>    I think you do not get the meaning of this ppp negotiation right, in=20
> your ppp case, neither peer ConfAck MRU=1464 for a ConfReq of MRU=1460.=20
>    You should know that the two peers of a ppp session can choose=20
> different MRU values. If A sends a ConfReq of MRU=1460 to B, it means A=20
> requests that B should send a packet not larger than 1460 to A, while=20
> how large packet can A send to B is another matter.
>    In your ppp case(taking your ppp-2.4.2 as peer A, take cisco as peer=20
> B): B request that A's packet does not exceeds 1464, and A immediately=20
> acknowledge it. On the other hand, A first request that B's packet does=20
> not exceeds 1460(this initial value is chosen by A's preference), but B=20
> is not happy with tha value and tells A he(B) will send a packet as=20
> large as 1464. At this point, if A's implementation can only process a=20
> incoming packet not larger than 1460, it(A) will probably stop the=20
> negotiation and send a LCP-TermReq to B, but A's ppp stack is flexible=20
> and can receive a packet as large as 1464(larger than his initial=20
> prefrence 1460), therefore, A send a new ConfReq to B to request a=20
> MRU=1464, this time B acknowledges it.    Note: the MRU value's meaning=20
> is the length network layer packet(e.g. IP packet) encapsulated in the=20
> PPP frame, not PPP frame itself.
>=20
> -- Chen Jun
>=20
