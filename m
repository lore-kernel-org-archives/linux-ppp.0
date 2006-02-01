From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 01 Feb 2006 22:29:02 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <Pine.LNX.4.61.0602011426551.28874@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PS:

> pap-max-authreq 3               # (from /etc/ppp/peers/gprs-script)

Make this one 5 or 7 to make sure that it is not just a timeout.


> defaultroute            # (from /etc/ppp/peers/gprs-script)
> proxyarp                # (from /etc/ppp/options)

It makes no sense to have both proxyarp and defaultroute. GEt rid of the
proxyarp.


