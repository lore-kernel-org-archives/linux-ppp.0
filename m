From: James Chapman <jchapman@katalix.com>
Date: Fri, 30 May 2008 08:13:00 +0000
Subject: Re: howto setup a route by netlink socket
Message-Id: <483FB70C.9020401@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805300937396564081@gmail.com>
In-Reply-To: <200805300937396564081@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron wrote:
> You could look at the ip(8) command source to find out how it is done,
> /sbin/ip or /bin/ip is part of the iproute package on Red Hat and Debian
> based Linux distributions.

The ip command uses libnetlink, but there's a new netlink library that 
is much easier to use. It's called libnl, at 
http://people.suug.ch/~tgr/libnl/. It includes simple apps that do 
common things like add routes. Binary packages are available for modern 
distros.

> Latest version of pptp has a hack that uses system(3) to execute ip(8).
> If you can figure a way to do this without using system(3) then I'm
> quite interested.


-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

