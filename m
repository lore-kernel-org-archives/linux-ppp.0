From: James Cameron <james.cameron@hp.com>
Date: Wed, 30 Apr 2008 03:46:39 +0000
Subject: Re: where is the rx interrupt handler in Ppp_generic.c?
Message-Id: <20080430034639.GE5198@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200804301033127661642@fiberhome.com.cn>
In-Reply-To: <200804301033127661642@fiberhome.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Apr 30, 2008 at 10:33:13AM +0800, ?????? wrote:
> I'm confused when I read the kernel's ppp implement. in
> Ppp_generic.c,the function ppp_create_interface  register the
> net_device , but I can't find out whereis the rx interrupt handler. So
> how the net device interface such as ppp0 deal with received packets? 

I'm not sure exactly what you mean.  I think you want to know how the
received packets find their way from the tty to the network interface
ppp0.

ppp_async.c ppp_asynctty_receive() occurs when bytes are received from
the tty.  This wakes the tasklet ppp_async_process().  The tasklet calls
ppp_input() for each packet.

Eventually, ppp_input() calls ppp_receive_nonmp_frame() which removes
the encapsulation and calls netif_rx() ... after that the packet will
appear in ppp0 as received.

"rx interrupt handler" ... might be better thought of as the tty receive
handler, which cascades through ppp_async.c into ppp_generic.c

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
