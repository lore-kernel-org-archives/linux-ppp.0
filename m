From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Jun 2010 11:24:20 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <4C234064.6030105@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> 3) what is shlc ?

Is it possible you're asking about "slhc?"

If so, then that's the name of the kernel module on Linux that
implements VJ header compression.  That's yet another header compression
mechanism, and is specific to IPv4 TCP.  It was basically designed to
make the usual 40 byte highly-predictable TCP header squeeze down to two
or three bytes, so that interactive data (think: "telnet" or "rlogin")
is usable over a slow serial link (think: "modems").

Again, pppd(1M) is your friend.  It documents the options for turning VJ
header compression on and off and adjusting the number of slots available.

Header compression does not compress the data itself, and is not in any
way related to CCP.  Instead, VJ header compression is negotiated by IPCP.

(The "slhc" module is Linux-specific, and isn't a generic PPP term.  On
other OSes, you'll see VJ compression implemented in other ways.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
