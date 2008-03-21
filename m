From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 21 Mar 2008 16:34:05 +0000
Subject: Re: pppd + static routes
Message-Id: <Pine.LNX.4.64.0803210930080.19302@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <47E3408F.1000609@stekloprom.ru>
In-Reply-To: <47E3408F.1000609@stekloprom.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 21 Mar 2008, Charlie Brady wrote:

>
> On Fri, 21 Mar 2008, Vladi Lemurov wrote:
>
>>  lame. Is it possible to push the routes via ppp.
>
> No. PPP's IPCP doesn't allow for that, although there was once a proposed 
> extension:

That sounds like a bad idea. PPP is Point to Point protocol. It is a means
of connecting two computers together. Once they are connected then you can
do whatever you want with the connection, including routing things over
that connection. Overloading that negotiation with all kinds of stuff which
have nothing to do with that connection seems like a bad idea. About all
you can do is to make it the default routing, which for example the Linux
pppd can already do, but has nothing to with the ppp negotiation. Surely
each machine knows what it wants to do over that connection, and should not
be told by the other end what to do.


>
> http://ml.osdir.com/ietf.pppext/2003-05/msg00005.html
