From: Benjamin Cama <benoar@dolka.fr>
Date: Sun, 14 Feb 2021 21:24:12 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <e04667f8e2ff35927fca7e6280c0817a0caccebb.camel@dolka.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-mMfC2+ltYu2Bsveuc5Rv"
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
To: linux-ppp@vger.kernel.org


--=-mMfC2+ltYu2Bsveuc5Rv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello James, Nicholas & others,

Please allow me to join the conversation:

Le dimanche 14 février 2021 à 11:23 -0500, James Carlson a écrit :
> RFC 2472 is a little weird with respect to the Interface-Identifier
> option.  It's possible to send an all-zero identifier, but we're really
> in uncharted waters if the peer can't give us an address or rejects the
> option.

Could I suggest that then IPv6CP just fails?

> This sort of makes sense given that IPv6 itself just doesn't
> work at all (no ICMPv6 ND means no work gets done) without a local
> address, so it's not something anyone has really explored.

Well, I actually sent last year a patch (attached again to this
message) to Paul and Cc'ed here about sending a zero identifier to do
exactly (to my understanding) what Nicholas is intending to do: let the
“server”-side choose the interface identifier.

It is a very small change that is basically activated on the “client”-
side with:

  ipv6 ::,

thus sending a zero identifier for our side. It worked quite well for
my work case (virtual serial links), where having short addresses when
autoconfiguring helps a lot, too. I couldn't resist also citing the
“stability to global scope addresses” argument from the RFC, which is
indeed relevant to me, at least.

What do you think about it?
Regards,
--
Benjamin

--=-mMfC2+ltYu2Bsveuc5Rv
Content-Disposition: attachment;
	filename*0=0001-pppd-Allow-for-a-zero-interface-identifier-in-ConfRe.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-pppd-Allow-for-a-zero-interface-identifier-in-ConfRe.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA1OWVlNzJiZTliNmRiYTU2YjU0MjJjMGJlYzg4ODQyZDYxYzljNTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW5qYW1pbiBDYW1hIDxiZW5vYXJAZG9sa2EuZnI+CkRhdGU6
IFdlZCwgMTcgSnVuIDIwMjAgMTQ6MzA6MDEgKzAyMDAKU3ViamVjdDogW1BBVENIXSBwcHBkOiBB
bGxvdyBmb3IgYSB6ZXJvIGludGVyZmFjZSBpZGVudGlmaWVyIGluIENvbmZSZXEKClJGQyA1MDcy
IGFsbG93cyBhIHBlZXIgdG8gc2VuZCBhIHplcm8gaW50ZXJmYWNlIGlkZW50aWZpZXIgaW4gYW4g
SVB2NkNQCkNvbmZpZ3VyZS1SZXF1ZXN0LCBzaWduaWZ5aW5nIGl0IHdhbnRzIHRoZSBvdGhlciBz
aWRlIHRvIGNob29zZSBvbmUgZm9yCml0LiBBbGxvdyB0aGlzIGJ5IHBhc3NpbmcgIjo6IiB0byB0
aGUgY2xhc3NpYyAiaXB2NiIgb3B0aW9uLgotLS0KUXVvdGluZyBzZWN0aW9uIDQuMSBvZiBSRkMg
NTA3MiA8aHR0cHM6Ly90b29scy5pZXRmLm9yZy9odG1sL3JmYzUwNzIjc2VjdGlvbi00LjE+OgoK
ICBJZiBuZWl0aGVyIGEgdW5pcXVlIG51bWJlciBub3IgYSByYW5kb20gbnVtYmVyIGNhbiBiZSBn
ZW5lcmF0ZWQsIGl0IGlzCiAgcmVjb21tZW5kZWQgdGhhdCBhIHplcm8gdmFsdWUgYmUgdXNlZCBm
b3IgdGhlIGludGVyZmFjZSBpZGVudGlmaWVyCiAgdHJhbnNtaXR0ZWQgaW4gdGhlIENvbmZpZ3Vy
ZS1SZXF1ZXN0LiBJbiB0aGlzIGNhc2UsIHRoZSBQUFAgcGVlciBtYXkKICBwcm92aWRlIGEgdmFs
aWQgbm9uLXplcm8gaW50ZXJmYWNlIGlkZW50aWZpZXIgaW4gaXRzIHJlc3BvbnNlIGFzCiAgZGVz
Y3JpYmVkIGJlbG93LgoKSXQgY2FuIGJlIHVzZWZ1bCB0byBoYXZlIG5vbi1yYW5kb20gaWRlbnRp
ZmllcnMsIHRvIGhlbHAgaGF2aW5nIHNob3J0CmFuZCBzdGFibGUgaWRzLCBmdXJ0aGVybW90ZSBh
c3NpZ25lZCBmcm9tIG9uZSBwbGFjZSBvbmx5LiBJdCBoZWxwcwpwcm92aWRpbmcg4oCcc3RhYmls
aXR5IHRvIGdsb2JhbCBzY29wZSBhZGRyZXNzZXPigJ0sIGFzIHB1dCBieSB0aGUgUkZDCmF1dGhv
cnMuCgogcHBwZC9pcHY2Y3AuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcHBwZC9pcHY2Y3AuYyBiL3BwcGQvaXB2
NmNwLmMKaW5kZXggYmRhOTFlOS4uMWU0ZmQyYiAxMDA2NDQKLS0tIGEvcHBwZC9pcHY2Y3AuYwor
KysgYi9wcHBkL2lwdjZjcC5jCkBAIC0zNDYsOCArMzQ2LDcgQEAgc2V0aWZhY2VpZChhcmd2KQog
ICAgIHN0cnVjdCBpbjZfYWRkciBhZGRyOwogICAgIHN0YXRpYyBpbnQgcHJpb19sb2NhbCwgcHJp
b19yZW1vdGU7CiAKLSNkZWZpbmUgVkFMSURJRChhKSAoICgoKGEpLnM2X2FkZHIzMlswXSA9PSAw
KSAmJiAoKGEpLnM2X2FkZHIzMlsxXSA9PSAwKSkgJiYgXAotCQkJKCgoYSkuczZfYWRkcjMyWzJd
ICE9IDApIHx8ICgoYSkuczZfYWRkcjMyWzNdICE9IDApKSApCisjZGVmaW5lIFZBTElESUQoYSkg
KCAoKGEpLnM2X2FkZHIzMlswXSA9PSAwKSAmJiAoKGEpLnM2X2FkZHIzMlsxXSA9PSAwKSApCiAg
ICAgCiAgICAgYXJnID0gKmFyZ3Y7CiAgICAgaWYgKChjb21tYSA9IHN0cmNocihhcmcsICcsJykp
ID09IE5VTEwpCi0tIAoyLjI2LjAKCg==


--=-mMfC2+ltYu2Bsveuc5Rv--
