From: James Cameron <james.cameron@hp.com>
Date: Thu, 05 Feb 2009 00:41:27 +0000
Subject: Re: VPN disconnect
Message-Id: <20090205004127.GB3718@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W66896262654641233767149@webmail29>
In-Reply-To: <W66896262654641233767149@webmail29>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Feb 04, 2009 at 12:11:33PM -0500, James Carlson wrote:
> Note that this just tells pppd to request a particular address.
> There's no telling whether the peer understands what to do with such a
> request, or if it can or will honor it.  Some servers may refuse to
> negotiate at all under such conditions, causing the link to fail.
> (Bugs are unfortunately common.)

On the peer side, pptpd on Linux in the default configuration gives the
IP address to pppd on command line, and so the IP address is usually
non-negotiable.  I don't know about other peers.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
