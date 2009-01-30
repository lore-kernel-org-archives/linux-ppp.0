From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 30 Jan 2009 18:06:13 +0000
Subject: Re: Routing
Message-Id: <18819.16789.188721.257467@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W3133827767292401233331800@webmail16>
In-Reply-To: <W3133827767292401233331800@webmail16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
>   192.168.x.x addresses are not forwarded by
> routers. They are simply thrown away as private addresses.

That's not true without qualification.  The correct statement is that
those "private" addresses are not forwardable on the open Internet.
The routes for the RFC 1918 address ranges don't exist by
administrative design, and the ranges are (sometimes) filtered at the
edges of provider networks.

However, no known router will discard them arbitrarily, so the
injunction against letting them pass through routers doesn't make
sense here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
