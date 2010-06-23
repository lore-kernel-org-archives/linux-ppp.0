From: arun b <arun.s.bailur@gmail.com>
Date: Wed, 23 Jun 2010 17:59:09 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <AANLkTilcZ-1phHlHn5aZuU00NhagSOqmCkLsX4j_kmRg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi James.,

Thank you as usual to respond me quick..!
Well  I wanted to validate rfc-1662.
I see in ppp source  deflate, bsd, compression  are these covers
rfc-1662 if so please provide me further info on this

Regs,
Arun


On Wed, Jun 23, 2010 at 11:09 PM, James Carlson
<carlsonj@workingcode.com> wrote:
> arun b wrote:
>> HI,
>> I wanted to know PPP -extension =A0support , compression ...
>> does it available in the ppp-2.4.4. ? =A0if so how do we test it.?
>> Any =A0info you know =A0to share would be appreciated..
>
> Yes, it supports data compression, and it's enabled by default. =A0See the
> pppd(1M) man page for details. =A0Note that compression schemes need to be
> built into your kernel, so what's _actually_ supported depends on what
> kernel modules you have.
>
> The debug log messages will be helpful here as well, as they indicate
> which compression algorithms are being negotiated.
>
> I'm not sure what sort of testing you want to do with it, though, so
> you'll need to be more specific. =A0For what it's worth, I find that
> passing large amounts of highly-compressible data (such as the letter
> "A" repeated a few million times in a file) is one good stress test, and
> passing incompressible data (such as a large bzip2'd file) is another.
> Each explores a different end in the usual string-based data compression
> algorithm. =A0The Canterbury Corpus is another fairly well-known test, and
> is probably a good middle-of-the-road test for passing compressible data.
>
> But there are other forms of "testing" that are possible here, including
> performance and interoperability, and those may require other sorts of
> testing schemes and other considerations, so I'm not really sure what it
> is you're after.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
