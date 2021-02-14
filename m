From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 14 Feb 2021 17:50:29 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <5fa48c13-0a5d-49e4-681e-0df6a2ae2ea1@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 2021-02-14 12:07, Kurt Van Dijck wrote:
>=20
>=20
> On 14 February 2021 02:03:28 GMT+01:00, Nicholas Humfrey <njh@aelius.com>=
 wrote:
>> Hi,
>> pppd. I am trying to use static addresses so I know the link-local IP=20
>> address of the remote peer.
>>
>> On the 'server' I am running:
>> =C2=A0 pppd file ./ppp-options ipv6 ::1,::2 /dev/ttyAMA0 115200
>=20
> ::1 is not a link-local ip.
> ::1 is 'localhost', i would advise not to use it elsewhere
> Sent from a small mobile device
>=20

That's not quite true.  The "ipv6" option takes IPV6CP "interface
identifiers," which are (essentially) the lower 64 bits of an IPv6 address.

The user interface uses IPv6 address parsing, so they look like actual
addresses, but the upper 64 bits must all be zero, and they're not
actually used as addresses anywhere.

So, "::1" means "IPV6CP Interface-Identifier 0000000000000001".

Unlike IPCP (IPv4), there is absolutely no way to negotiate IPv6
addresses with PPP.  That's just not how IPv6 works.

--=20
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
