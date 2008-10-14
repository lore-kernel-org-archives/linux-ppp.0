From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 14 Oct 2008 10:26:24 +0000
Subject: Re: pppd creates route without "gateway" flag
Message-Id: <18676.29648.777176.812305@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
In-Reply-To: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul Mackerras writes:
> > And that is in fact a gateway route.  The issue is whether that flag
> > actually matters on Linux.
> 
> Why do you say it's a gateway route?  It doesn't have a gateway
> address.  It's a route to the 0.0.0.0/0 network via the ppp0 device.

OK; fair point.  That point-to-point peer, though, still is the
'gateway' for all packets that match that route, even though we don't
have the (effectively useless) remote address stored in the route
itself.

If the flag is missing merely because the next-hop address isn't set,
then that explains it, and there's nothing wrong at all with the
original poster's system.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
