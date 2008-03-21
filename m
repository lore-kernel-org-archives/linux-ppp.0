From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Fri, 21 Mar 2008 16:17:35 +0000
Subject: Re: pppd + static routes
Message-Id: <Pine.LNX.4.64.0803211213100.24959@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <47E3408F.1000609@stekloprom.ru>
In-Reply-To: <47E3408F.1000609@stekloprom.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Fri, 21 Mar 2008, Vladi Lemurov wrote:

> lame. Is it possible to push the routes via ppp.

No. PPP's IPCP doesn't allow for that, although there was once a proposed 
extension:

http://ml.osdir.com/ietf.pppext/2003-05/msg00005.html
