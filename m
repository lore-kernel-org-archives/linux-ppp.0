From: "Nestor Urquiza" <nestor.urquiza@gmail.com>
Date: Mon, 21 Jan 2008 13:35:35 +0000
Subject: Re: RSA SecureId (RFC 4793) support
Message-Id: <dff43e6d0801210535v7e94c1e2y56c1a3293e69a4f2@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
In-Reply-To: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Apparently there was a patch for EAP-TLS:
http://marc.info/?l=pptpclient-devel&m9191642811483&w=2
According to what I see the current ppp just responds NACK when it
receives EAP type 15.

Thanks!

-Nestor

On Jan 20, 2008 3:23 PM, Bill Unruh <unruh@physics.ubc.ca> wrote:
>
> On Sun, 20 Jan 2008, Charlie Brady wrote:
>
> >
> > On Sun, 20 Jan 2008, Nestor Urquiza wrote:
> >
> >>  I guess supporting EAP-POTP shouldn't be that hard since EAP-TLS and
> >>  EAP-POTP are just different types from the same rfc 3748.
> >
> > It's "not hard" compared to hard problems. But it's also a non-trivial amount
> > of work. I wouldn't expect to see an implementation soon unless I was paying
> > someone to make it.
>
> Course the person to ask would be Carlson, since he implimented the EAP-SRP
> into pppd.
> Actually, pppd (2.4.4) does not seem to support TLS. Also EAP is just an
> extention, so there need be no relation between the various ways the
> various EAP  authentications do things.
>
> pppd lists various types of EAP.
> "Identity", "Notification", "Nak", "MD5-Challenge",
>     "OTP", "Generic-Token", NULL, NULL,
>     "RSA", "DSS", "KEA", "KEA-Validate",
>     "TLS", "Defender", "Windows 2000", "Arcot",
>     "Cisco", "Nokia", "SRP"
>
> Of which probably only MD5 and SRP are actually implimented in pppd it
> looks like to me.
>
>
