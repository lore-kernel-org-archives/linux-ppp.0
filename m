From: James Carlson <carlson@workingcode.com>
Date: Wed, 03 Mar 2004 02:54:53 +0000
Subject: Re: pppd gotcha with ATT GPRS service using SE GC82
Message-Id: <16453.18685.730066.448274@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <03F1A9D14E1F3D4A984B3EDDFA9823DEF897@bldc02.research.intel-research.net>
In-Reply-To: <03F1A9D14E1F3D4A984B3EDDFA9823DEF897@bldc02.research.intel-research.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Philip Buonadonna writes:
> However, ATT wireless w/ the Sony Ericsson GC82 tries to negotiate
> 127.0.0.2 as the remote peer IP address.

Yes, I've seen other reports of that sort of bogus behavior.

> A quick review of RFC 1331/1332 doesn't seem to indicate that 127.0.0.x
> are excluded from PPP links.

RFC 1812 says:

    (e) { 127, <any> }

         Internal host loopback address.  Addresses of this form MUST
         NOT appear outside a host.

> The question(s) are: Is the reason I'm getting 127.0.0.2 as the remote
> IP a configuration error on my part?  Is it unique to this GPRS
> hardware?  Is it unique to ATT?  

I think it's peculiar to GPRS deployments, which tend to be very odd
in other ways as well.

I think a better answer would be to have an option that allows pppd to
ignore the negotiated remote address and use a configured value
instead.  Putting ugly things like 127.0.0.2 into the kernel is likely
to break multicast and other protocols, since a point-to-point link is
often referred to by the remote address.

-- 
James Carlson                                  <carlson@workingcode.com>
