From: arun b <arun.s.bailur@gmail.com>
Date: Thu, 24 Jun 2010 13:55:46 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <AANLkTinIkePP2iA0f_4m8ncODbNvASVSegzn2Nj4Md_i@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Ok,
as you said i can verify all compression types on PPPoE test...
So i have pppoe-server available at my pc,  if you have come across
related server configuration for this .... pls do know me.
and running PPPoA - test running is not just easy to me as
unavailability of the device.


Regs,
Arun



On Thu, Jun 24, 2010 at 4:54 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> arun b wrote:
>> 3) what is shlc ?
>
> Is it possible you're asking about "slhc?"
>
> If so, then that's the name of the kernel module on Linux that
> implements VJ header compression. =A0That's yet another header compression
> mechanism, and is specific to IPv4 TCP. =A0It was basically designed to
> make the usual 40 byte highly-predictable TCP header squeeze down to two
> or three bytes, so that interactive data (think: "telnet" or "rlogin")
> is usable over a slow serial link (think: "modems").
>
> Again, pppd(1M) is your friend. =A0It documents the options for turning VJ
> header compression on and off and adjusting the number of slots available.
>
> Header compression does not compress the data itself, and is not in any
> way related to CCP. =A0Instead, VJ header compression is negotiated by IP=
CP.
>
> (The "slhc" module is Linux-specific, and isn't a generic PPP term. =A0On
> other OSes, you'll see VJ compression implemented in other ways.)
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
