From: Michael Richardson <mcr@sandelman.ca>
Date: Mon, 07 Dec 2015 04:05:31 +0000
Subject: Re: Netflix and pppd
Message-Id: <3866.1449461131@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <566461FE.4090003@seiner.com>
In-Reply-To: <566461FE.4090003@seiner.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Yes, like James, I'd say that your problem is MTU issues with the PPPoE.
Aside from the usual mss-clamping solution, you could also lower the MTU
on the "lan2" to 1460 or so.
DHCP should tell the other boxes about that, and things may work better.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [

