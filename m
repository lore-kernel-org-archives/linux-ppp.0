From: arun b <arun.s.bailur@gmail.com>
Date: Thu, 24 Jun 2010 16:48:33 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <AANLkTinuhlWiMJnRBOGz3asHJdxD9jRUH3hPdCNyLKfk@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Ok ,
let me explore on the server side ....!

Could you please guide me thru ppp-extension support ....!

Regs,
Arun

On Thu, Jun 24, 2010 at 7:49 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> arun b wrote:
>> Ok,
>> as you said i can verify all compression types on PPPoE test...
>> So i have pppoe-server available at my pc, =A0if you have come across
>> related server configuration for this .... pls do know me.
>> and running PPPoA - test running is not just easy to me as
>> unavailability of the device.
>
> I don't know what you're asking about, but pppd generally enables all
> available compression modes by default (regardless of the underlying
> communication mechanism), and will disable a compression mode either if
> the peer disagrees with the request or if you specify one of the
> documented options to turn off that mode (or to turn off compression
> completely).
>
> In other words, if your "server" is actually pppd, then there's nothing
> that you need to do to enable compression. =A0If it's something other than
> pppd, then this might not be the right mailing list. =A0You should consult
> your server's documentation to find out what features it offers.
>
> As for selectively turning off available compression types in pppd, I
> still urge you to read the pppd man page. =A0It's pretty important. =A0For
> data compression options, you'll find the following:
>
> =A0noccp, bsdcomp, nobsdcomp, deflate, nodeflate, predictor1,
> =A0nopredictor1
>
> For header compression (again, _not_ data compression), you'll find:
>
> =A0noaccomp, novj, novjccomp, vj-max-slots
>
> There are also two that are sort of special -- mpshortseq and
> nompshortseq -- that have to do with header compression when using MP.
> You haven't mentioned MP yet, so I'll assume you're not using it.
>
> The really short answer is this: PPP negotiates for everything. =A0If both
> sides support something, then, great, it'll be enabled. =A0If either or
> both sides don't support something, then it won't be enabled. =A0That's
> pretty much the whole story.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
