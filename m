From: James Carlson <carlson@workingcode.com>
Date: Tue, 13 Apr 2004 15:39:20 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <16508.2472.992842.219141@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> notice the apparent response from the client(?) in the successful case:
> 
> 04/13 09:27:21 yS3   getlogname (AUTO_PPP), read:~}[df]}#[c0]!

Right.

>   it's still not clear what this response represents.

It's the start of a normal LCP Configure-Request packet --

	7E 7D DF 7D 23 C0 21 ...

That decodes as:

	7E	- start of frame marker (see RFC 1662)
	7D DF	- address FF (see RFCs 1662 and 1661)
	7D 23	- control 03 (same)
	C0 21	- PPP Protocol value; Link Control Protocol (LCP)

>  is the client side
> pppd supposed to be sending that "~}[df]}#[c0]!" line?

Yes.

>  and in response
> to what?

The physical link being available.  It's not triggered by anything in
PPP itself -- it's done when PPP starts.

>  i'm just trying to understand at exactly what point in the 
> negotiation things are breaking down.  thanks for any pointers.

The very beginning.  There's no PPP data coming from this peer at all,
and there should be.

-- 
James Carlson                                  <carlson@workingcode.com>
