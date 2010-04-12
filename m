From: James Cameron <quozl@laptop.org>
Date: Mon, 12 Apr 2010 10:18:50 +0000
Subject: Re: why cbcp option is not in the pppoe request packet
Message-Id: <20100412101850.GA15892@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <28215364.post@talk.nabble.com>
In-Reply-To: <28215364.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Apr 12, 2010 at 02:06:27AM -0700, Mondayfox wrote:
> I tried to connet to win2003 RAS with linux redhat5,but failed.
> After capturing packets , I found there was no cbcp option in the packet .

But the peer accepted the host's rejection of CBCP, so CBCP is not
required.  What makes you think CBCP is required?  Is the peer
configured to callback?

The debug log shows LCP termination request from the peer immediately
after the host sends an EAP response.

Are you sure you wish to authenticate to the peer using EAP?  Have you
tried "refuse-eap" option?

-- 
James Cameron
http://quozl.linux.org.au/
