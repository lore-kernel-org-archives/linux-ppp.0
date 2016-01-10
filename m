From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Sun, 10 Jan 2016 22:58:10 +0000
Subject: Re: Add support for IPv6 RADIUS attributes
Message-Id: <Pine.LNX.4.64.1601101753410.13191@e-smith.charliebrady.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20160108142012.GL19014@drscott.swordarmor.fr>
In-Reply-To: <20160108142012.GL19014@drscott.swordarmor.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I see here:

http://marc.info/?l=linux-ppp&m4636974704703

that my comments and earlier patch referred to config file parsing, but 
Alarig's patch concerns dictionary parsing. The same config applies, 
however - irrelevant changes in the radius schema or configuration should 
not cause pppd to crash. Use 'warn();continue' instead of error().

