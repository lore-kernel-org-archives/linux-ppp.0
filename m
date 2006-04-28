From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Fri, 28 Apr 2006 00:03:53 +0000
Subject: Re: Troubleshooting MPPE problem.
Message-Id: <20060428000353.GB25425@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060427234900.GA25365@digitalpath.net>
In-Reply-To: <20060427234900.GA25365@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Probably should throw in my options file as well:

lock
name pptpd
proxyarp
require-mschap-v2
require-mppe-128
nomppe-lower-mtu
ms-dns 72.242.124.4
ms-dns 72.242.124.101
plugin radius.so
plugin radattr.so
nodeflate
mtu 1456
mru 1456
lcp-restart 5
lcp-echo-interval 20
lcp-echo-failure 5
nobsdcomp
novj
noaccomp
nodeflate
