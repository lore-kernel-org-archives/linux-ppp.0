From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 05 Apr 2018 17:47:09 +0000
Subject: Re: [PATCH] slip: Check if rstate is initialized before uncompressing
Message-Id: <20180405174709.GB1416@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180329095758.GA510@tejaswit-linux.qualcomm.com>
In-Reply-To: <20180329095758.GA510@tejaswit-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Apr 04, 2018 at 04:21:25PM +0530, Tejaswi Tanikella wrote:
> On receiving a packet the state index points to the rstate which must be
> used to fill up IP and TCP headers. But if the state index points to a
> rstate which is unitialized, i.e. filled with zeros, it gets stuck in an
> infinite loop inside ip_fast_csum trying to compute the ip checsum of a
> header with zero length.
> 
Hi Tejaswi,

Patches aren't reviewed on linux-ppp but on netdev. You should post
your patch there.

Regards,

Guillaume
