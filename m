From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 15 May 2008 19:14:08 +0000
Subject: Re: Re: from which hook , I can get the usrname that pppd used?
Message-Id: <18476.35712.417819.980107@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805151619318592147@foxmail.com>
In-Reply-To: <200805151619318592147@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

cyx writes:
> Thank for your help! username that  I want to get is the one pppd  read from chap-secret or pap-secret, I think they my be store in an global var?

I'm afraid you're still not being specific enough.

pppd can be configured to behave as an authenticator ("server"), an
authenticatee ("client"), both, or neither.

When configured as an authenticator, pppd will acquire a name from the
peer and will validate that identity.  The resulting validated peer
name appears in the peer_authname[] array.

When configured as an authenticatee, the name pppd presents to the
peer for identification is in the our_name[] array.

This is all in the pppd/auth.c module, which is common to all
authentication schemes (including PAP and CHAP).  If you're trying to
write code that integrates with pppd, I *strongly* recommend spending
the time to read through the pppd source code.  The layout of the code
is fairly logical, so it's not hard to read, and there are substantial
and informative comments in many places.

(Note that it's really not proper to talk about "users" here.  PPP is
a layer two technology; there are no "users."  There are only peers.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
