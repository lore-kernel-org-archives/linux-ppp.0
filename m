From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 10 Jan 2005 18:57:08 +0000
Subject: Re: PPP features ?
Message-Id: <16866.53252.345156.916052@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <41E262D3.8020303@free.fr>
In-Reply-To: <41E262D3.8020303@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jean Lee writes:
> In order to write my own application, I would like to know where I can 
> find information on the ppp stack features for linux 2.4.27. Does 
> anybody know it ?
> 
> In particular, does the linux ppp stack implements the following 
> protocols ? :
> PAP, IPCP

Yes to both.

> IP header compression

It has VJ (RFC 1144) header compression, but nobody has worked on the
newer patent-laden ROHC things.

>, CCP

Yes.

>, LZS

No, not by default.  It's patent-encumbered.  There are patches
floating around the 'net that reportedly add this.  Use at your own
risk.

(Patents aren't like copyrights, at least in much of the world.  You
can get sued successfully even if you write the darned thing from
scratch.  You can even get sued if you happened to invent it on your
own purely by accident.  Not sure about the situation in France ...)

> and NCP

That's not really a protocol.  The "NCPs" in PPP are the network
control protocols.  One of these is IPCP, the Internet Protocol
Control Protocol, which is used to negotiate IP parameters.

Or are you asking about IPX support?  (One of the IPX-related
protocols is also called "NCP.")

-- 
James Carlson                                 <carlsonj@workingcode.com>
