From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 21 Jan 2008 21:27:41 +0000
Subject: Re: RSA SecureId (RFC 4793) support
Message-Id: <18325.3661.947432.80568@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
In-Reply-To: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> Actually, pppd (2.4.4) does not seem to support TLS. Also EAP is just an
> extention, so there need be no relation between the various ways the
> various EAP  authentications do things.

Indeed.  There are some EAP methods that are simple, but others that
have very high levels of complexity.  EAP is just a framework for
carrying authentication methods.

> Of which probably only MD5 and SRP are actually implimented in pppd it
> looks like to me.

True.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
