From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 10 Mar 2005 19:13:15 +0000
Subject: Re: Blowfish encryption
Message-Id: <16944.40011.700211.813141@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christopher Fowler writes:
> I think the thing I'll want to use is ECP.  Does pppd come with it?

Nope.  But I thought you were looking for new things to write.  ;-}

There is an implementation of Microsoft's proprietary CCP hack called
"MPPE" in pppd, and this does do the same sort of encryption, though
you're limited to RC4 instead of Blowfish.  It's negotiated using CCP
rather than ECP by mistake and misdesign.

-- 
James Carlson                                 <carlsonj@workingcode.com>
