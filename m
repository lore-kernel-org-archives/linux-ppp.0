From: James Cameron <quozl@laptop.org>
Date: Mon, 14 Mar 2011 21:46:58 +0000
Subject: Re: pptponfig centos 5.4
Message-Id: <20110314214658.GA3828@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6630510430284451299766958@webmail23>
In-Reply-To: <W6630510430284451299766958@webmail23>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Mar 14, 2011 at 01:05:26PM +0000, tony.chamberlain@lemko.com wrote:
> Using the Windows pptp when I connect it allows the remote host to set
> my routes for the PPTP vpn.

Is there a protocol specification for how this is achieved?

> Is there a way to do this in Linux too?

Not to my knowledge.  It would imply a communication of routing policy
over the PPP link, and some way to know if it is trusted.

A common way to achieve this is to use /etc/ppp/ip-up.d scripts on the
client side that recognise the tunnel in some way.

-- 
James Cameron
http://quozl.linux.org.au/
