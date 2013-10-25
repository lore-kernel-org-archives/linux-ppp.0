From: =?ISO-8859-1?Q?Fran=E7ois_Cachereul?= <f.cachereul@alphalink.fr>
Date: Fri, 25 Oct 2013 08:27:59 +0000
Subject: Re: [RFC PATCH net-next] ppp: Allow ppp device connected to an l2tp session to change of namespace
Message-Id: <526A2B8F.4030700@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <5268F6CD.9070600@alphalink.fr> <5268FCB1.7020903@katalix.com> <526923A7.8090108@alphalink.fr> <5269402E.2070203@katalix.com> <20131024155354.GQ2704@kvack.org> <52695012.6090700@katalix.com>
In-Reply-To: <52695012.6090700@katalix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: James Chapman <jchapman@katalix.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

On 10/24/2013 06:51 PM, James Chapman wrote:
> On 24/10/13 16:53, Benjamin LaHaise wrote:
>> On Thu, Oct 24, 2013 at 04:43:42PM +0100, James Chapman wrote:
>>> I'm thinking about the implications of a skb in the net namespace of the
>>> ppp interface passing through a tunnel socket which is in another
>>> namespace. I think net namespaces are completely isolated.
>>>
>>> To keep your ppp interfaces isolated from each other, have you
>>> considered using netfilter to prevent data being passed between ppp
>>> interfaces?
>>
>> Using network namespaces for this is far more efficient.  We've already =

>> added support for doing this to other tunneling interfaces.  This approa=
ch=20
>> also makes creating VPNs where there is re-use of the private address sp=
ace=20
>> between different customers far easier to implement.
>>
>> 		-ben
>=20
> Yes, it's definitely more efficient and potentially useful, I agree.
>=20
> But unlike the other tunneling interfaces for which this has already
> been done, L2TP uses a socket for its tunnel and a skb will cross net
> namespace boundaries while passing through the socket. I remember a
> similar discussion came up several months ago with vxlan which also uses
> UDP sockets. See http://www.spinics.net/lists/netdev/msg221498.html.
>=20
> Changing the behaviour of ppp interfaces only when they are created by
> l2tp feels wrong to me, unless it is the first step in doing the same
> for all ppp interfaces.


I agree, I only took care of l2TP first because it seemed safe and that's
why I posted the patch as RFC in the first place.

Fran=E7ois
