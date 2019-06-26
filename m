From: Michael Richardson <mcr@sandelman.ca>
Date: Wed, 26 Jun 2019 15:28:20 +0000
Subject: Re: IPv6 with pppd
Message-Id: <9745.1561562900@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
In-Reply-To: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Levente <leventelist@gmail.com> wrote:
    > I am struggling with IPv6 over PPP on Linux. The situation is that I
    > have a 3G modem, when I plug it in to the USB on my Debian box,
    > everything works as expected, I have IPv6 address from the provider,
    > and I am happy. But how?

...

    > Please note that in the logs, I can't see that global scope address,
    > and I don't know how the IPv6CP assigns this address to the interface.
    > How is this done?

IPv6CP does not.
The major difference between IPCP and IPv6CP is that it was realized that in
IPv4, the IPCP people were having to repeat all the DHCPv4 work again in
IPCP, and why not just run DHCP?

So in IPv6CP, *ALL* IPv6CP does it assign the LL address (which are either
made up randomly, or come from an IID/EUI/OUI of a physical interface).

Then, an IPv6 RS/RA occurs, which MAY assign an address (M=0), or MAY
suggest using DHCPv6 (M=1).  My experience is that many devices do both,
and one winds up with two addresses.

If DHCPv6-PD also occurs (O=1), then there is actually no reason to even
number the PPP link with a GUA, as one can just use a GUA from an downstream
interface.

In my copious spare time, I hope to write an RFC updating 7084 that provides
a way for the ISP to understand what the CPE device would like, such that the
ISP does not have to deal with all the situations of single-device-with-/64,
single-device-that-may-tether-with-/64, WAN-link-numbered+PD, or
WAN-link-unnumbered+PD.  There are scaling efficiencies for the ISP in the size of
it's access network routing table if each customer costs a single TCAM slot
rather than two, sometimes three.

    > And when I plug the same modem to an OpenWRT box, I don't get the
    > global scope address, only the link-local address. Is this some PPP
    > specific problem, or there might be some IPv6 autoconfiguration magic
    > happening in the background? I don't think so, because that address
    > corresponds to a statically allocated address of the provider.

I assume PPPoE, and modem is DSL or CableModem (not dialup).
What version of OpenWRT?  18.06 just works!

Feel free to unicast me your /etc/config/network

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl0TjxMACgkQgItw+93Q
3WV7/Af/XbJWD3aU3dsDEPRfRfLTIux3enHxWfd+uEyYzyL8mvTpPFZa3JlmgdVO
+pLg2LLGwksuH2wpPp8fry34DFwFP/qGHHMQM1VN4ELF3y8/AHvPyP4O+r4n5nzB
8t4f1sc6VZCNld/SJt1abTmBrjfpvAgVP954/KEIFvBBzfzZc6rUb4iiFyqPQWe3
NYoDNhHtdCR5Z6N1HhToYmBGk6TTShK6vWGvAsViyaJU+/hO+048AIBkIbGQY/gF
GQ9kljnIDr4BH7l5770g9RxMJNo30vl3PRfpGPYuSYofCnuMWIei3z1oQ2QxvgcM
xjvINvA3/hHECxEdK3XQKzzYv4HQGQ==
=IHDv
-----END PGP SIGNATURE-----
--=-=-=--
