From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 11 Jan 2005 13:38:36 +0000
Subject: Re: PPP features ?
Message-Id: <16867.55004.510693.730573@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <41E262D3.8020303@free.fr>
In-Reply-To: <41E262D3.8020303@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jean Lee writes:
> For the NCP protocol, I am not sure but I think that it is IPCP + IP 
> header compression + software compression (LZS) + CCP because it is 
> wrotten like this :

That looks like a misunderstanding.  "Network Control Protocol" in the
context of PPP is just a generic term.  It's like saying "a feature"
or "a program."  It doesn't define any particular protocol.  Requiring
support for it is just nonsense.

So, yeah, sure, pppd supports NCP.  ;-}

> /Network Control Protocol (NCP), for the PPP protocol integration 
> control in the IPv4 layer :/
>     /- protocol IPC management (Internet Protocol Control)/ I think that 
> there is a mistake and that he want to speek about IPCP because I don't 
> know IPC.

That does indeed look quite garbled.

There is no such thing as "protocol IPC management."  I don't know
what that would mean in this context.

IPCP (RFC 1332) is indeed one of the PPP NCPs, and is the one you want
if you want to run IPv4.  (If you want IPv6, you need IPV6CP, a
separate NCP, which is also supported by pppd.)

>     /- IP header compression support/
>     /- software compression support (LZS) optional./
>    / - Compression Control Protocol (CCP)/
> 
> Does it have a meaning ?
> Is there another software compression protocol than LZS which is available ?

There are *many* of them.

> Where did you find all this information ?

Which information?

If you want to know what pppd supports, looking at the code itself is
probably the best answer.  Looking at the documentation that comes
with it would likely also be productive.  You can get the source here:

	ftp://ftp.samba.org/pub/ppp/

As for the list of protocols, you can look here to find the list of
data compression (CCP) algorithms:

	http://www.iana.org/assignments/ppp-numbers

(Scroll down to "PPP CCP CONFIGURATION OPTION TYPES.")  And you can
look here to find references to the documents describing those
algorithms:

	http://www.ietf.org/rfc/rfc-index.txt

For example, LZS (commonly called "Stac") is defined here:

	http://www.ietf.org/rfc/rfc1974.txt

There's also a reasonably-available book on PPP design,
implementation, and debugging that I could recommend.

-- 
James Carlson                                 <carlsonj@workingcode.com>
