From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 10 Mar 2005 18:17:02 +0000
Subject: Re: Blowfish encryption
Message-Id: <16944.36638.767255.464284@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christopher Fowler writes:
> The only problem with ssh is that it is one protocol.  There are many
> protocols that travel across the ppp link.  Some fo them not encryted
> and can not be encrypted.
> 
> I stopped using telnet a long time ago.  Also with these devices there
> are protocols that are routed across that link we have no control over
> so doing encryption inside of ppp would cover all the bases.

As I mentioned, if it's really a PPP issue (not clear that it is, as
the threat model isn't clear), then ECP is likely to be the right
answer.

If it's an IP issue (are you worried about non-IP protocols?), then
I'd certainly recommend the use of IPsec.  It defends against things
that ssh (and, for that matter, SSL/TLS) cannot, works whether or not
you use PPP, works on an end-to-end basis, and doesn't require
changing everyone's implementations.

-- 
James Carlson                                 <carlsonj@workingcode.com>
