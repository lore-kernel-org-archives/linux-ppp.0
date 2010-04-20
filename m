From: Arne Lie <Arne.Lie@sintef.no>
Date: Tue, 20 Apr 2010 14:38:16 +0000
Subject: RE: CRC-16 or CRC-32
Message-Id: <291B2C7721AC7B49AD11449A2883992E2C4A9BDE43@SINTEFEXMBX01.sintef.no>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jan,

Hm, my observations are that if there are bit errors introduced in the PPP frame, the "ifconfig ppp0" will count such packets in the "error" tab. From this I anticipated that the PPP stack included CRC checking of its payload. By CRC-16 I mean 2 byte CRC, CRC-32 4 byte. Our customer wants 4 byte CRC. From RFC2823 I see both are mentioned. The question is, how does one select either? Perhaps it is not configurable via pppd?

Best regards


Arne Lie
SINTEF ICT, Dept. of Communication Systems
NO-7465 Trondheim, NORWAY
Dir. phone +47 73 59 27 03 - mobile +47 450 20 040
e-mail: arne.lie@sintef.no 



> -----Original Message-----
> From: Jan Just Keijser [mailto:jan.just.keijser@gmail.com]
> Sent: 20. april 2010 16:16
> To: Arne Lie
> Cc: linux-ppp@vger.kernel.org
> Subject: Re: CRC-16 or CRC-32
> 
> Arne Lie wrote:
> > Hi,
> >
> > A very basic question: does PPP v2.4.5 support CRC-16 or CRC-32 (or
> it may be configurable, in that case, how)?
> >
> what exactly do you mean by CRC-16 or CRC-32? ( I know what CRC means )
> BTW, the word 'crc' does not appear anywhere in the ppp source code.
> 
> cheers,
> 
> JJK / Jan Just Keijser

