From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Feb 2005 22:16:05 +0000
Subject: Re: Client requesting its authentication
Message-Id: <Pine.LNX.4.61.0502241413150.9592@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 24 Feb 2005, James Carlson wrote:

>
> In that case, his side will be the authenticator, and he doesn't want
> that to happen.

Why?

Especially aqs in eap his side IS an authenticator as well as an
authenticatee. That is precisely what he wants, is for the far side to
authenticate itself to him. He wants to be an authenticator but does not
want to ask to be an authenticator. I cannot see any justification for that
stance. It certainly does not prevent any attack I can think of ( a
sensible attacker would not be as coy as he is).

