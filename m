From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 01 Feb 2006 11:40:50 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <17376.40514.940826.112083@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> I agree with Bill that the "sent [PAP AuthReq" suggests that your end is
> attempting to authenticate the peer.  Use the dump option to find out
> where the options are coming from.

No.  With PAP, the authenticatee ("client") sends PAP Authenticate-
Request to the authenticator ("server").  It's the reverse of the
somewhat more familiar CHAP procedure.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
