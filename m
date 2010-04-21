From: "Milan P. Stanic" <mps@arvanta.net>
Date: Wed, 21 Apr 2010 09:08:35 +0000
Subject: Re: CRC-16 or CRC-32
Message-Id: <20100421090835.GA1768@arvanta.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 2010-04-21 at 08:56, Arne Lie wrote:
> > -----Original Message-----
> > From: linux-ppp-owner@vger.kernel.org [mailto:linux-ppp-
> > owner@vger.kernel.org] On Behalf Of Milan P. Stanic
> > Sent: 20. april 2010 17:10
> > To: linux-ppp@vger.kernel.org
> > Subject: Re: CRC-16 or CRC-32
> > 
> > On Tue, 2010-04-20 at 16:49, Jan Just Keijser wrote:
> > > Arne Lie wrote:
> > > >Hm, my observations are that if there are bit errors introduced in
> > the PPP frame, the "ifconfig ppp0" will count such packets in the
> > "error" tab. From this I anticipated that the PPP stack included CRC
> > checking of its payload. By CRC-16 I mean 2 byte CRC, CRC-32 4 byte.
> > Our customer wants 4 byte CRC. From RFC2823 I see both are mentioned.
> > The question is, how does one select either? Perhaps it is not
> > configurable via pppd?
> > > >
> > > RFC2823 is about PPP SDL on SONET/SDH ; AFAIK the pppd code does not
> > > support this *at all* so I am not surprised that I did not find any
> > > references to CRCs in the headers...
> > >
> > > So the short answer to your question would be: no, PPP v2.4.5 does
> > > not support CRC-16 or CRC-32.
> > 
> > In Linu CRC is done in kernel ppp driver not the ppp daemon.
> > ZLIB compression uses crc-32, AFAIR.

> [Arne::] Milan, thanks for your information. Yes, the CRC is done in
> the kernel part of PPP. My question was how, of possible, one could
> select CRC-16 or CRC-32 to be activated using options when starting
> pppd (in a similar manner as one is able to select compression
> algorithm). In http://fixunix.com/ppp/62264-hdlc-like-framing.html
> James Carson says that the Solaris implementation of pppd make it
> possible to negotiate to CRC-32.

CRC is just mathematical method to calculate some number. It would be
better to use term FCS (Frame Check Sequence) to avoid ambiguities.
FCS can be null, 16 and 32 bit. Default is 16 bit and if peers cannot
negotiate other values this is default.

To have 32bit FCS in Linux kernel and ppp daemon you (or someone who
could be paid or volunteer) should add it to the kernel driver and add
configuration option to the ppp daemon to signal kernel driver that it
wants/prefer 32/16/null FCS.

There are RFCs which describes what CRC and LCP should/must be used for
all that stuff.

> I read your answer this way: by choosing the deflate compression
> algorithm, which I believe is using ZLIB, then we *are* using the
> CRC-32 since it defaults to this.

No. ZLIB is used in data compression and not in link layer, but I
could be wrong.

-- 
Kind regards,  Milan
--------------------------------------------------
Arvanta, IT Security        http://www.arvanta.net
Please do not send me e-mail containing HTML code.
