From: Levente <leventelist@gmail.com>
Date: Wed, 26 Jun 2019 14:43:57 +0000
Subject: Re: IPv6 with pppd
Message-Id: <CACwWb3As+qgy8+Fk2OanSwPi3HDr=g9jzbEncv3i+hE1E28txQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
In-Reply-To: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Yes, you are right. This issue has nothing to do with pppd, it is/was
an OpenWRT misconfiguration. BTW, it works now. Thank you for your
suggestion!

Best regards,
Levente

On Wed, Jun 26, 2019 at 2:45 PM James Carlson <carlsonj@workingcode.com> wrote:
>
> On 06/26/19 07:30, Levente wrote:
> > Dear maintainer,
> >
> >
> > I am struggling with IPv6 over PPP on Linux. The situation is that I
> > have a 3G modem, when I plug it in to the USB on my Debian box,
> > everything works as expected, I have IPv6 address from the provider,
> > and I am happy. But how?
>
> There may be problems with this trace, possibly indicating 3G-specific
> authentication issues, but if your only question is about IPv6, the
> answer is very simple.  PPP doesn't negotiate global scope addresses in
> IPv6.  It does link-local only.  Global scope addresses come from either
> ICMPv6 Router Advertisements, DHCPV6 address assignments, or static
> configuration.
>
> > Please note that in the logs, I can't see that global scope address,
> > and I don't know how the IPv6CP assigns this address to the interface.
> > How is this done?
>
> Some other protocol.  IPV6CP is not involved.
>
> > And when I plug the same modem to an OpenWRT box, I don't get the
> > global scope address, only the link-local address. Is this some PPP
> > specific problem, or there might be some IPv6 autoconfiguration magic
> > happening in the background? I don't think so, because that address
> > corresponds to a statically allocated address of the provider.
> >
> > lev@mercury:~$ host 2a00:1110:135:4594:303e:582f:ea95:aa10
> > 0.1.a.a.5.9.a.e.f.2.8.5.e.3.0.3.4.9.5.4.5.3.1.0.0.1.1.1.0.0.a.2.ip6.arpa
> > domain name pointer
> > 2A00111001354594303E582FEA95AA10.mobile.pool.telekom.hu.
> >
> > Could you help me out what is going on here, and why can't I get a
> > global scope address on the OpenWRT? I'm sure it is an OpenWRT issue,
> > but need help tracing it.
>
> My guess would be that the OpenWRT box doesn't have IPv6 routing enabled
> and isn't doing RAs.  That's just a guess.  I don't believe the issues
> you're having here have anything to do with PPP.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
