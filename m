From: "Milan P. Stanic" <mps@arvanta.net>
Date: Tue, 20 Apr 2010 15:10:09 +0000
Subject: Re: CRC-16 or CRC-32
Message-Id: <20100420151008.GB16143@arvanta.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 2010-04-20 at 16:49, Jan Just Keijser wrote:
> Arne Lie wrote:
> >Hm, my observations are that if there are bit errors introduced in the PPP frame, the "ifconfig ppp0" will count such packets in the "error" tab. From this I anticipated that the PPP stack included CRC checking of its payload. By CRC-16 I mean 2 byte CRC, CRC-32 4 byte. Our customer wants 4 byte CRC. From RFC2823 I see both are mentioned. The question is, how does one select either? Perhaps it is not configurable via pppd?
> >
> RFC2823 is about PPP SDL on SONET/SDH ; AFAIK the pppd code does not
> support this *at all* so I am not surprised that I did not find any
> references to CRCs in the headers...
> 
> So the short answer to your question would be: no, PPP v2.4.5 does
> not support CRC-16 or CRC-32.

In Linu CRC is done in kernel ppp driver not the ppp daemon.
ZLIB compression uses crc-32, AFAIR.

-- 
Kind regards,  Milan
--------------------------------------------------
Arvanta, IT Security        http://www.arvanta.net
Please do not send me e-mail containing HTML code.
