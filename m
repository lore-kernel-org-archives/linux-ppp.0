From: =?ISO-8859-1?Q?Fran=E7ois_Cachereul?= <f.cachereul@alphalink.fr>
Date: Fri, 25 Oct 2013 08:24:12 +0000
Subject: Re: [RFC PATCH net-next] ppp: Allow ppp device connected to an l2tp session to change of namespace
Message-Id: <526A2AAC.4060809@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <5268F6CD.9070600@alphalink.fr> <5268FCB1.7020903@katalix.com> <526923A7.8090108@alphalink.fr> <5269402E.2070203@katalix.com> <20131024155354.GQ2704@kvack.org>
In-Reply-To: <20131024155354.GQ2704@kvack.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: James Chapman <jchapman@katalix.com>, Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

On 10/24/2013 05:53 PM, Benjamin LaHaise wrote:
> On Thu, Oct 24, 2013 at 04:43:42PM +0100, James Chapman wrote:
>> I'm thinking about the implications of a skb in the net namespace of the
>> ppp interface passing through a tunnel socket which is in another
>> namespace. I think net namespaces are completely isolated.
>>
>> To keep your ppp interfaces isolated from each other, have you
>> considered using netfilter to prevent data being passed between ppp
>> interfaces?
>=20
> Using network namespaces for this is far more efficient.  We've already=20
> added support for doing this to other tunneling interfaces.  This approac=
h=20
> also makes creating VPNs where there is re-use of the private address spa=
ce=20
> between different customers far easier to implement.
>=20
> 		-ben

That's indeed on of the problems we have to deal with and net namespaces
seems to be the right answer.

Fran=E7ois
