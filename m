From: David Miller <davem@davemloft.net>
Date: Mon, 02 Mar 2015 05:17:49 +0000
Subject: Re: [PATCH net-next v2] pppoe: Use workqueue to die properly when a PADT is received
Message-Id: <20150302.001749.1494675361394874315.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1425207279-4822-1-git-send-email-simon@farnz.org.uk>
In-Reply-To: <1425207279-4822-1-git-send-email-simon@farnz.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: simon@farnz.org.uk
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, mostrows@gmail.com

From: Simon Farnsworth <simon@farnz.org.uk>
Date: Sun,  1 Mar 2015 10:54:39 +0000

> When a PADT frame is received, the socket may not be in a good state to
> close down the PPP interface. The current implementation handles this by
> simply blocking all further PPP traffic, and hoping that the lack of traffic
> will trigger the user to investigate.
> 
> Use schedule_work to get to a process context from which we clear down the
> PPP interface, in a fashion analogous to hangup on a TTY-based PPP
> interface. This causes pppd to disconnect immediately, and allows tools to
> take immediate corrective action.
> 
> Note that pppd's rp_pppoe.so plugin has code in it to disable the session
> when it disconnects; however, as a consequence of this patch, the session is
> already disabled before rp_pppoe.so is asked to disable the session. The
> result is a harmless error message:
> 
> Failed to disconnect PPPoE socket: 114 Operation already in progress
> 
> This message is safe to ignore, as long as the error is 114 Operation
> already in progress; in that specific case, it means that the PPPoE session
> has already been disabled before pppd tried to disable it.
> 
> Signed-off-by: Simon Farnsworth <simon@farnz.org.uk>
> Tested-by: Dan Williams <dcbw@redhat.com>
> Tested-by: Christoph Schulz <develop@kristov.de>

Applied, thanks Simon.
