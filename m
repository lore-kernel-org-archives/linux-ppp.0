From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 01 Feb 2006 22:40:10 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <17377.14538.699918.202466@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> > defaultroute            # (from /etc/ppp/peers/gprs-script)
> > proxyarp                # (from /etc/ppp/options)
> 
> It makes no sense to have both proxyarp and defaultroute. GEt rid of the
> proxyarp.

That's not true.  It's plausible to need both in some situations.

That doesn't mean he does, though.  Most users (particularly those
dialing into an ISP as an individual user) do _not_ want or need
proxyarp.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
