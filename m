From: Phil Mayers <p.mayers@imperial.ac.uk>
Date: Sun, 19 Feb 2006 23:40:29 +0000
Subject: Re: final repost - MPPE incorrect REJECT/NAK behaviour (was Re: Windows
Message-Id: <43F901ED.20900@imperial.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <43F8F60F.70106@imperial.ac.uk>
In-Reply-To: <43F8F60F.70106@imperial.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron wrote:
> Looked fine to me, and so I began to test it, but it would not apply to
> PPP CVS, which appears to contain code that does something similar.
> 
> Is it already fixed in CVS?  Could you try CVS?  Or adapt your change to
> what is already there?

Oops. How embarrassing! Apologies for not checking CVS and for the noise.

I'll test it, but I guess that should resolve the issue - though the 
patch I wrote only NAKs with the preferred crypto bit which is what I 
observed win2k to do, and at a glance that code will NAK with all bits 
we support (i.e. 40 and 128 set, if you permit that)? For reference:

client sends:

Generic Routing Encapsulation (PPP)
  Protocol Type: PPP (0x880b)
Point-to-Point Protocol
  Protocol: Compression Control Protocol (0x80fd)
PPP Compression Control Protocol
  Code: Configuration Request (0x01)
  Identifier: 0x00
  Length: 10
  Options: (6 bytes)
   Microsoft PPC: Supported Bits: 0x00000001
    .... .... .... .... .... .... .... ...1 = Desire to negotiate MPPC
    .... .... .... .... .... .... ...0 .... = Obsolete
    .... .... .... .... .... .... ..0. .... = 40-bit encryption OFF
    .... .... .... .... .... .... .0.. .... = 128-bit encryption OFF
    .... .... .... .... .... .... 0... .... = 56-bit encryption OFF
    .... ...0 .... .... .... .... .... .... = Stateless mode OFF

server replies (server does permit 40 bit):

Generic Routing Encapsulation (PPP)
  Protocol Type: PPP (0x880b)
Point-to-Point Protocol
  Protocol: Compression Control Protocol (0x80fd)
PPP Compression Control Protocol
  Code: Configuration Nak (0x03)
  Identifier: 0x00
  Length: 10
  Options: (6 bytes)
   Microsoft PPC: Supported Bits: 0x00000041
    .... .... .... .... .... .... .... ...1 = Desire to negotiate MPPC
    .... .... .... .... .... .... ...0 .... = Obsolete
    .... .... .... .... .... .... ..0. .... = 40-bit encryption OFF
    .... .... .... .... .... .... .1.. .... = 128-bit encryption ON
    .... .... .... .... .... .... 0... .... = 56-bit encryption OFF
    .... ...0 .... .... .... .... .... .... = Stateless mode OFF


Having said that, I agree the version in CVS is "more correct", you 
should NAK with what you can permit.

Thanks again,
Phil
