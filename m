From: ben_gal@libero.it
Date: Thu, 24 Feb 2005 22:04:37 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050224220437.GA2445@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 01:27:54PM -0800, Bill Unruh wrote:
> Then demand that they authenticate themselves to you via eap. If that is
> what you want then demand it. Why  are you trying to force them into
> demanding it from you? " I want you to do something. But I do not want to
> ask you to do it, I want to force you to ask me to do it". That is not how
> the world works. If you want something, ask for it.

I don't want to *force* the peer to authenticate me.
I want to *hint* him.
If he doesn't want that, I close because that doesn't satisfy me.
This seems not so strange to me.


> >
> >This is the behaviour I were looking for:
> 
> Sorry, the behaviour you want is that the two sides never agree on anything
> and refuse to talk to each other?

Is more desiderable that they don't connect than a client connecting
to an untrusted server without authentication

> Well demand that it authenticate itself to you via eap.

In tls there's a client and a server. Roles cannot be swapped

> 
> That is the other sides perfect right. If someone walked up to you and
> demanded that you demand to see his driver's license, don;t you think a
> valid reaction on your part is to walk away?

Yes. This isn't a problem.
The problem is when I trust him, but we haven't shown driver licenses each
other.
