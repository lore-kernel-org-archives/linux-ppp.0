From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 15 Aug 2012 13:07:25 +0000
Subject: Re: Using pppd as a library
Message-Id: <502B9F0D.3050302@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <502A3A31.2050106@ibtechnology.com>
In-Reply-To: <502A3A31.2050106@ibtechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> The question is do they need ppp at all ? I certainly has advantages to use
> tcp/ip but it is no requirement is several cases. Going with a more simple
> protocol can reduce the overhead considerable.

Please explain.  What "more simple protocol" are you suggesting?  SLIP,
perhaps?

I expect that the original poster's design constraints include having an
interoperable implementation -- that is, being able to talk to peer
machines built by other vendors.  Whether the overhead is "considerable"
or not doesn't seem to factor into the choice.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
